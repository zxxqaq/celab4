/*
 * Copyright (C) 2020 GreenWaves Technologies, SAS, ETH Zurich and
 *                    University of Bologna
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* 
 * Authors: Germain Haugou, GreenWaves Technologies (germain.haugou@greenwaves-technologies.com)
 */

#include <vp/vp.hpp>
#include <vp/itf/io.hpp>
#include <stdio.h>
#include <vp/itf/wire.hpp>
#include <vp/itf/clock.hpp>
#include <string.h>
#include "archi/soc_eu_v2.h"

class soc_eu;

class soc_eu_target
{
public:

  soc_eu_target(soc_eu *top, std::string name, std::string itf_name);

  vp::WireMaster<int>    event_itf;
  unsigned int event_mask[SOC_NB_EVENT_REGS];
  std::string name;
};

class soc_eu : public vp::Component
{

public:

  soc_eu(vp::ComponentConf &config);

  void reset(bool active);

  static vp::IoReqStatus req(vp::Block *__this, vp::IoReq *req);

private:

  static void event_in_sync(vp::Block *__this, int event);
  static void ref_clock_sync(vp::Block *_this, bool value);
  void trigger_event(int event);

  vp::IoReqStatus trigger_event_req(int reg_offset, int size, bool is_write, uint8_t *data);
  vp::IoReqStatus mask_req(int target_id, int reg_id, int reg_offset, int size, bool is_write, uint8_t *data);

  int nb_fc_events;
  int first_fc_event;
  int ref_clock_event;

  vp::Trace     trace;
  vp::IoSlave in;

  vp::WireSlave<int>      event_in_itf;
  vp::ClockSlave          ref_clock;
  vp::WireMaster<bool>     ref_clock_event_itf;

  vector<soc_eu_target *> targets;
};

soc_eu::soc_eu(vp::ComponentConf &config)
: vp::Component(config)
{
  traces.new_trace("trace", &trace, vp::DEBUG);
  in.set_req_meth(&soc_eu::req);
  new_slave_port("input", &in);

  this->ref_clock_event = this->get_js_config()->get_child_int("ref_clock_event");
  this->ref_clock.set_sync_meth(&soc_eu::ref_clock_sync);
  this->new_slave_port("ref_clock", &this->ref_clock);

  event_in_itf.set_sync_meth(&soc_eu::event_in_sync);
  new_slave_port("event_in", &event_in_itf);

  nb_fc_events = get_js_config()->get_child_int("properties/nb_fc_events");
  first_fc_event = get_js_config()->get_child_int("properties/first_fc_event");

  new_master_port("ref_clock_event", &ref_clock_event_itf);

  this->targets.push_back(new soc_eu_target(this, "FC", "fc_event_itf"));
  this->targets.push_back(new soc_eu_target(this, "PR", "pr_event_itf"));
  this->targets.push_back(new soc_eu_target(this, "CL", "cl_event_itf"));
}

void soc_eu::reset(bool active)
{
  if (active)
  {
    for (auto target: this->targets)
    {
      for (int i=0; i<SOC_NB_EVENT_REGS; i++)
      {
        target->event_mask[i] = 0xffffffff;
      }
    }
  }

}

void soc_eu::trigger_event(int event)
{
  int word_id = event >> 5;
  int bit_id = event & 0x1f;

  for (auto target: this->targets)
  {
    if (((target->event_mask[word_id] >> bit_id) & 1) == 0)
    {
      trace.msg("Generating %s event (event: %d)\n", target->name.c_str(), event);
      if (!target->event_itf.is_bound())
        trace.msg("Trying to send event to %s while it is not instantiated\n", target->name.c_str());
      else
        target->event_itf.sync(event);
    }
  }
}

vp::IoReqStatus soc_eu::trigger_event_req(int reg_offset, int size, bool is_write, uint8_t *data)
{
  if (!is_write) return vp::IO_REQ_INVALID;
  for (unsigned int i=0; i<this->nb_fc_events; i++) {
    if ((*(data) >> i) & 1) {
      this->trigger_event(i + this->first_fc_event);
    }
  }
  return vp::IO_REQ_OK;
}

vp::IoReqStatus soc_eu::mask_req(int target_id, int reg_id, int reg_offset, int size, bool is_write, uint8_t *data)
{
  soc_eu_target *target = this->targets[target_id];

  if (!is_write)
  {
    memcpy(data, &(((uint8_t *)&target->event_mask[reg_id])[reg_offset]), size);
  }
  else {
    memcpy(&(((uint8_t *)&target->event_mask[reg_id])[reg_offset]), data, size);
    this->trace.msg("Setting soc event mask (target: %s, mask_id: %d, value: 0x%x)\n", target->name.c_str(), reg_id, target->event_mask[reg_id]);
  }
  return vp::IO_REQ_OK;
}

vp::IoReqStatus soc_eu::req(vp::Block *__this, vp::IoReq *req)
{
  soc_eu *_this = (soc_eu *)__this;

  vp::IoReqStatus err = vp::IO_REQ_INVALID;

  uint64_t offset = req->get_addr();
  uint8_t *data = req->get_data();
  uint64_t size = req->get_size();
  bool is_write = req->get_is_write();

  _this->trace.msg("Soc event unit access (offset: 0x%x, size: 0x%x, is_write: %d)\n", offset, size, is_write);

  int reg_id = offset / 4;
  int reg_offset = offset % 4;

  if (reg_offset + size > 4) {
    _this->trace.warning("Accessing 2 registers in one access\n");
    goto error;
  }

  switch (reg_id) {
    case SOC_EU_EVENT/4:     err = _this->trigger_event_req(reg_offset, size, is_write, data); break;
    default: {
      int target_id = (reg_id - SOC_FC_FIRST_MASK/4) / SOC_NB_EVENT_REGS;
      int target_reg_id = (reg_id - SOC_FC_FIRST_MASK/4) % SOC_NB_EVENT_REGS;

      if (target_id < SOC_NB_EVENT_TARGETS)
        err = _this->mask_req(target_id, target_reg_id, reg_offset, size, is_write, data);

      break;
    }
  }

  if (err != vp::IO_REQ_OK)
    goto error;

  return vp::IO_REQ_OK;

error:
  _this->trace.force_warning("Soc event unit invalid access (offset: 0x%x, size: 0x%x, is_write: %d)\n", offset, size, is_write);

  return vp::IO_REQ_INVALID;
}

void soc_eu::event_in_sync(vp::Block *__this, int event)
{
  soc_eu *_this = (soc_eu *)__this;
  _this->trace.msg("Received incoming event (event: %d)\n", event);
  _this->trigger_event(event);
}

void soc_eu::ref_clock_sync(vp::Block *__this, bool value)
{
  soc_eu *_this = (soc_eu *)__this;
  _this->trace.msg("Received ref clock event, generating event (event: %d)\n", _this->ref_clock_event);
  _this->ref_clock_event_itf.sync(true);
  _this->trigger_event(_this->ref_clock_event);
}

soc_eu_target::soc_eu_target(soc_eu *top, std::string name, std::string itf_name)
: name(name)
{
  top->new_master_port(itf_name, &this->event_itf);
}

extern "C" vp::Component *gv_new(vp::ComponentConf &config)
{
  return new soc_eu(config);
}
