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
#include <string.h>
#include <vector>

#define MAX_PUTC_LENGTH 1024

class Stdout : public vp::Component
{

public:

  Stdout(vp::ComponentConf &config);

  static vp::IoReqStatus req(vp::Block *__this, vp::IoReq *req);

private:

  vp::Trace     trace;
  vp::IoSlave in;

  int nb_cluster;
  int nb_core;

  std::vector <char *> putc_buffer;
  int *putc_buffer_pos;

};

Stdout::Stdout(vp::ComponentConf &config)
: vp::Component(config)
{
  traces.new_trace("trace", &trace, vp::DEBUG);
  in.set_req_meth(&Stdout::req);
  new_slave_port("input", &in);

  nb_cluster = get_js_config()->get_child_int("max_cluster");
  nb_core = get_js_config()->get_child_int("max_core_per_cluster");

  putc_buffer_pos = new int[nb_cluster*nb_core];
  for (int j=0; j<nb_cluster; j++) {
    for (int i=0; i<nb_core; i++) {
      putc_buffer.push_back(new char[MAX_PUTC_LENGTH]);
      putc_buffer_pos[j*nb_core+i] = 0;
    }
  }


}

vp::IoReqStatus Stdout::req(vp::Block *__this, vp::IoReq *req)
{
  Stdout *_this = (Stdout *)__this;

  uint64_t offset = req->get_addr();
  uint8_t *data = req->get_data();
  uint64_t size = req->get_size();

  _this->trace.msg("Stdout access (offset: 0x%x, size: 0x%x, is_write: %d)\n", offset, size, req->get_is_write());

  int core_id = (offset >> 3) & 0xf;
  int cluster_id = (offset >> 7) & 0x3f;

  if (core_id >= _this->nb_core || cluster_id >= _this->nb_cluster)
  {
    _this->trace.warning("Accessing invalid stdout channel (coreId: %d, clusterId: %d)\n", core_id, cluster_id);
    return vp::IO_REQ_INVALID;
  }
  
  _this->putc_buffer[cluster_id*_this->nb_core+core_id][_this->putc_buffer_pos[cluster_id*_this->nb_core+core_id]++] = *data;
  if (*data == '\n' || _this->putc_buffer_pos[cluster_id*_this->nb_core+core_id] == MAX_PUTC_LENGTH - 1) {
    _this->putc_buffer[cluster_id*_this->nb_core+core_id][_this->putc_buffer_pos[cluster_id*_this->nb_core+core_id]] = 0;
      //if (stdoutPrefix) fprintf(stdout, "# [STDOUT-CL%d_PE%d] ", clusterId, coreId);
    fwrite((void *)_this->putc_buffer[cluster_id*_this->nb_core+core_id], 1, _this->putc_buffer_pos[cluster_id*_this->nb_core+core_id], stdout);
  //  if (stdoutToFile) fwrite((void *)putcBuffer[clusterId][coreId], 1, putcBufferPos[clusterId][coreId], stdoutFiles[clusterId][coreId]);
    _this->putc_buffer_pos[cluster_id*_this->nb_core+core_id] = 0;
  }

  return vp::IO_REQ_OK;
}

extern "C" vp::Component *gv_new(vp::ComponentConf &config)
{
  return new Stdout(config);
}
