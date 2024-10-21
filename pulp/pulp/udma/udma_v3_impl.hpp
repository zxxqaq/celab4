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

#ifndef __PULP_UDMA_UDMA_V2_IMPL_HPP__
#define __PULP_UDMA_UDMA_V2_IMPL_HPP__

#include <vp/vp.hpp>
#include <vp/itf/io.hpp>
#include <vp/itf/qspim.hpp>
#include <vp/itf/uart.hpp>
#include <vp/itf/cpi.hpp>
#include <vp/itf/wire.hpp>
#include <vp/itf/hyper.hpp>
#include <vp/itf/i2c.hpp>
#include <vp/itf/clk.hpp>
#include <vp/itf/i2s.hpp>
#include <stdio.h>
#include <string.h>
#include <vector>
#include "archi/udma_v3.h"

#ifdef HAS_HYPER
#if HYPER_VERSION == 2
#include "archi/udma/hyper/udma_hyper_v2.h"
#endif
#if HYPER_VERSION == 3
#include "archi/udma_hyper_v3.h"
#endif
#endif

class udma;
class Udma_channel;


class Udma_transfer
{
public:
  uint32_t addr;
  uint32_t size;
  int transfer_size;
  int continuous_mode;
  uint32_t current_addr;
  int32_t remaining_size;
  uint64_t received_size;
  Udma_channel *channel;

  bool prepare_req(vp::IoReq *req);
  void set_next(Udma_transfer *next) { this->next = next; }
  Udma_transfer *get_next() { return next; }
  Udma_transfer *next;
};



template<class T>
class Udma_queue
{
public:
  Udma_queue(int size) : size(size) { init(); }
  void init() { first=NULL; last=NULL; nb_cmd=0; }
  T *pop();
  inline void push(T *cmd);
  void push_from_latency(T *cmd);
  bool is_full() { return nb_cmd >= size; }
  bool is_empty() { return nb_cmd == 0; }
  T *get_first() { return first; }

private:
  T *first;    // First command of the queue, commands are popped from here
  T *last;     // Last command of the queue, commands are pushed here
  int        nb_cmd;
  int        size;
};


class Udma_channel
{
public:
  Udma_channel(udma *top, int id, std::string name);
  virtual vp::IoReqStatus req(vp::IoReq *req, uint64_t offset);
  virtual void reset(bool active);
  virtual bool is_tx() { return false; }
  void set_next(Udma_channel *next) { this->next = next; }
  Udma_channel *get_next() { return next; }
  void event_handler();
  bool prepare_req(vp::IoReq *req);
  void push_ready_req(vp::IoReq *req);
  bool handle_ready_req_end(vp::IoReq *req);
  virtual bool is_busy() { return false; }
  virtual void handle_ready() { }
  virtual void handle_ready_reqs();
  virtual void handle_transfer_end();
  void check_state();

  Udma_transfer *current_cmd;

  void build_reqs_and_enqueue(Udma_transfer *current_req);

protected:
  vp::Trace     trace;
  Udma_queue<vp::IoReq> *ready_reqs;
  udma *top;

private:
  virtual vp::IoReqStatus saddr_req(vp::IoReq *req);
  virtual vp::IoReqStatus size_req(vp::IoReq *req);
  virtual vp::IoReqStatus cfg_req(vp::IoReq *req); 
  void enqueue_transfer();
  virtual void handle_ready_req(vp::IoReq *req);

  uint32_t saddr;
  uint32_t size;
  
  int transfer_size;
  bool continuous_mode;

  int id;
  string name;
  Udma_channel *next;

  vp::ClockEvent *event;

  Udma_queue<Udma_transfer> *free_reqs;
  Udma_queue<Udma_transfer> *pending_reqs;

  vp::Trace     state_event;
};



class Udma_rx_channel : public Udma_channel
{
public:
  Udma_rx_channel(udma *top, int id, string name) : Udma_channel(top, id, name) {}
  bool is_tx() { return false; }
  void reset(bool active);
  void push_data(uint8_t *data, int size);
  bool has_cmd() { return this->current_cmd != NULL; }

private:
  int pending_byte_index;
  uint32_t pending_word;
};



class Udma_tx_channel : public Udma_channel
{
public:
  Udma_tx_channel(udma *top, int id, string name) : Udma_channel(top, id, name) {}
  bool is_tx() { return true; }

  void handle_pending_word(vp::Block *__this, vp::ClockEvent *event);

};



class Io_Periph;


class Io_rx_channel : public Udma_rx_channel
{
  friend class Io_Periph;

public:
  Io_rx_channel(udma *top, Io_Periph *io_periph, int id, string name);

private:
  Io_Periph *io_periph;
};




class Io_tx_channel : public Udma_tx_channel
{
  friend class Io_Periph;

public:
  Io_tx_channel(udma *top, Io_Periph *io_periph, int id, string name);

protected:
  void handle_ready_reqs();

private:
  Io_Periph *io_periph;
};




class Udma_periph 
{
public:
  Udma_periph(udma *top, int id);
  virtual vp::IoReqStatus req(vp::IoReq *req, uint64_t offset);
  virtual void reset(bool active);
  void clock_gate(bool is_on);

  int id;

  bool get_periph_status() { return is_on; }
  
protected:
  Udma_channel *channel0 = NULL;
  Udma_channel *channel1 = NULL;
  Udma_channel *channel2 = NULL;
  udma *top;

private:
  virtual vp::IoReqStatus custom_req(vp::IoReq *req, uint64_t offset);
  bool is_on;
};



class Io_Periph : public Udma_periph
{
  friend class Io_tx_channel;
  friend class Io_rx_channel;

public:
  Io_Periph(udma *top, int id, string itf_name);
  void handle_ready_reqs();
  void set_addr(unsigned int addr) { this->addr = addr; this->current_addr = addr; }
  void set_eot_event(int event) { this->eot_event = event; }

private:  
  static void data_grant(vp::Block *__this, vp::IoReq *req);
  static void data_response(vp::Block *__this, vp::IoReq *req);
  static void handle_pending_word(vp::Block *__this, vp::ClockEvent *event);
  void check_state();

  vp::IoMaster io_itf;
  vp::ClockEvent *pending_access_event;
  vp::IoReq *pending_req;
  vp::IoReq io_req;
  unsigned int addr;
  unsigned int current_addr;
  int eot_event = -1;
};





/*
 * I2C
 */

class I2c_periph_v2;

class I2c_rx_channel : public Udma_rx_channel
{
public:
  I2c_rx_channel(udma *top, I2c_periph_v2 *periph, int id, string name);
  bool is_busy();
  void handle_rx_bit(int bit);

private:
  void reset(bool active);
  I2c_periph_v2 *periph;
  uint8_t  pending_rx_byte;
  int nb_received_bits;
};


class I2c_tx_channel : public Udma_tx_channel
{
public:
  I2c_tx_channel(udma *top, I2c_periph_v2 *periph, int id, string name);
  void handle_ready_reqs();
  bool is_busy();

private:
  void reset(bool active);
  void check_state();
  static void handle_pending_word(vp::Block *__this, vp::ClockEvent *event);

  I2c_periph_v2 *periph;

  vp::ClockEvent *pending_word_event;

  uint32_t pending_word;
  int pending_bits;
  vp::IoReq *pending_req;
  int64_t next_bit_cycle;
};


typedef enum
{
  I2C_PERIPH_STATE_WAIT_CMD,
  I2C_PERIPH_STATE_WAIT_CFG,
  I2C_PERIPH_STATE_WR0,
  I2C_PERIPH_STATE_WR1,
  I2C_PERIPH_STATE_ACK0,
  I2C_PERIPH_STATE_ACK1,
  I2C_PERIPH_STATE_WAIT_RPT,
  I2C_PERIPH_STATE_WAIT_RPT_CMD,
  I2C_PERIPH_STATE_RD,
  I2C_PERIPH_STATE_START0,
  I2C_PERIPH_STATE_STOP0,
  I2C_PERIPH_STATE_STOP1
} i2c_periph_state_e;


class I2c_periph_v2 : public Udma_periph
{
  friend class I2c_tx_channel;
  friend class I2c_rx_channel;

public:
  I2c_periph_v2(udma *top, int id, int itf_id);
  vp::IoReqStatus custom_req(vp::IoReq *req, uint64_t offset);
  void reset(bool active);

protected:
  vp::I2cMaster i2c_itf;
  i2c_periph_state_e state;
  unsigned int pending_value;
  int pending_value_bits;
  int clkdiv;
  int repeat_count;
  bool waiting_rx;
  bool gen_ack;
  bool waiting_pending_bits;
  unsigned int repeat_command;
  int pending_rx_bit;
  int prev_sda;
  int prev_scl;

private:
  vp::IoReqStatus status_req(vp::IoReq *req);
  vp::IoReqStatus setup_req(vp::IoReq *req);
  static void rx_sync(vp::Block *, int scl, int data);

  vp::Trace     trace;
};





/*
 * UART
 */

class Uart_periph_v1;

typedef enum
{
  UART_RX_STATE_WAIT_START,
  UART_RX_STATE_DATA,
  UART_RX_STATE_PARITY,
  UART_RX_STATE_WAIT_STOP
} uart_rx_state_e;

class Uart_rx_channel : public Udma_rx_channel
{
public:
  Uart_rx_channel(udma *top, Uart_periph_v1 *periph, int id, string name);
  bool is_busy();
  void handle_rx_bit(int bit);

private:
  void reset(bool active);
  Uart_periph_v1 *periph;
  uart_rx_state_e state;
  int parity;
  int stop_bits;
  uint8_t  pending_rx_byte;
  int nb_received_bits;
};


typedef enum
{
  UART_TX_STATE_START,
  UART_TX_STATE_DATA,
  UART_TX_STATE_PARITY,
  UART_TX_STATE_STOP
} uart_tx_state_e;

class Uart_tx_channel : public Udma_tx_channel
{
public:
  Uart_tx_channel(udma *top, Uart_periph_v1 *periph, int id, string name);
  void handle_ready_reqs();
  bool is_busy();

private:
  void reset(bool active);
  void check_state();
  static void handle_pending_word(vp::Block *__this, vp::ClockEvent *event);

  Uart_periph_v1 *periph;

  vp::ClockEvent *pending_word_event;

  uint32_t pending_word;
  int pending_bits;
  uart_tx_state_e state;
  vp::IoReq *pending_req;
  int parity;
  int64_t next_bit_cycle;
  int stop_bits;
  int sent_bits;
};


class Uart_periph_v1 : public Udma_periph
{
  friend class Uart_tx_channel;
  friend class Uart_rx_channel;

public:
  Uart_periph_v1(udma *top, int id, int itf_id);
  vp::IoReqStatus custom_req(vp::IoReq *req, uint64_t offset);
  void reset(bool active);

  int parity;
  int bit_length;
  int stop_bits;
  int tx;
  int rx;
  int clkdiv;
  int rx_pe;

protected:
  vp::UartMaster uart_itf;

private:
  vp::IoReqStatus status_req(vp::IoReq *req);
  vp::IoReqStatus setup_req(vp::IoReq *req);
  void set_setup_reg(uint32_t value);
  static void rx_sync(vp::Block *, int data);

  uint32_t setup_reg_value;

  vp::Trace     trace;
};


/*
 * CPI
 */

class Cpi_periph_v1;

class Cpi_rx_channel : public Udma_rx_channel
{
public:
  Cpi_rx_channel(udma *top, Cpi_periph_v1 *periph, int id, string name);

private:
  void reset(bool active);
  Cpi_periph_v1 *periph;
};

class Cpi_periph_v1 : public Udma_periph
{
  friend class Cpi_rx_channel;

public:
  Cpi_periph_v1(udma *top, int id, int itf_id);
  vp::IoReqStatus custom_req(vp::IoReq *req, uint64_t offset);
  void reset(bool active);
  void handle_sof();

protected:
  vp::CpiSlave cpi_itf;

private:
  static void sync(vp::Block *__this, int pclk, int href, int vsync, int data);
  static void sync_cycle(vp::Block *__this, int href, int vsync, int data);
  vp::IoReqStatus handle_global_access(bool is_write, uint32_t *data);
  vp::IoReqStatus handle_l1_access(bool is_write, uint32_t *data);
  vp::IoReqStatus handle_ur_access(bool is_write, uint32_t *data);
  vp::IoReqStatus handle_size_access(bool is_write, uint32_t *data);
  vp::IoReqStatus handle_filter_access(bool is_write, uint32_t *data);
  void push_pixel(uint32_t pixel);

  vp::Trace     trace;

  int pending_byte;
  bool has_pending_byte;
  bool cmd_ready;

  uint32_t glob;
  uint32_t ll;
  uint32_t ur;
  uint32_t size;
  uint32_t filter;

  bool wroteGlob;
  bool wroteLl;
  bool wroteUr;
  bool wroteSize;
  bool wroteFilter;

  unsigned int enabled;
  unsigned int frameDrop;
  unsigned int nbFrameDrop;
  unsigned int frameSliceEn;
  unsigned int format;
  unsigned int shift;

  unsigned int frameSliceLlx;
  unsigned int frameSliceLly;
  unsigned int frameSliceUrx;
  unsigned int frameSliceUry;

  unsigned int rowLen;

  unsigned int bCoeff;
  unsigned int gCoeff;
  unsigned int rCoeff;

  unsigned int frameDropCount;
  unsigned int currentLine;
  unsigned int currentRow;

};





/*
 * HYPER
 */

// class Hyper_periph_v1;

// class Hyper_rx_channel : public Udma_rx_channel
// {
// public:
//   Hyper_rx_channel(udma *top, Hyper_periph_v1 *periph, int id, string name);
//   void handle_rx_data(int data);
//   void handle_ready();

// private:
//   void reset(bool active);
//   Hyper_periph_v1 *periph;
// };


// //#if defined(HAS_HYPER) && HYPER_VERSION == 2
// class Hyper_periph_v2;

// class Hyper_v2_rx_channel : public Udma_rx_channel
// {
// public:
//   Hyper_v2_rx_channel(udma *top, Hyper_periph_v2 *periph, int id, string name);
//   void handle_rx_data(int data);
//   void handle_ready();
//   void handle_transfer_end();

// private:
//   void reset(bool active);
//   Hyper_periph_v2 *periph;
// };
// //#endif


// typedef enum
// {
//   HYPER_STATE_IDLE,
//   HYPER_STATE_DELAY,
//   HYPER_STATE_CS,
//   HYPER_STATE_CA,
//   HYPER_STATE_DATA,
//   HYPER_STATE_CS_OFF,
// } hyper_state_e;



// class Hyper_tx_channel : public Udma_tx_channel
// {
//   friend class Hyper_periph_v1;

// public:
//   Hyper_tx_channel(udma *top, Hyper_periph_v1 *periph, int id, string name);

// protected:
//   void handle_ready_reqs();

// private:
//   void reset(bool active);

//   Hyper_periph_v1 *periph;

// };

// //#if defined(HAS_HYPER) && HYPER_VERSION == 2
// class Hyper_v2_tx_channel : public Udma_tx_channel
// {
//   friend class Hyper_periph_v2;

// public:
//   Hyper_v2_tx_channel(udma *top, Hyper_periph_v2 *periph, int id, string name);
//   void handle_transfer_end();

// protected:
//   void handle_ready_reqs();

// private:
//   void reset(bool active);

//   Hyper_periph_v2 *periph;

// };
// //#endif


// class Hyper_periph_v1 : public Udma_periph
// {
//   friend class Hyper_tx_channel;
//   friend class Hyper_rx_channel;

// public:
//   Hyper_periph_v1(udma *top, int id, int itf_id);
//   vp::IoReqStatus custom_req(vp::IoReq *req, uint64_t offset);
//   static void rx_sync(vp::Block *__this, int data);
//   void reset(bool active);
//   static void handle_pending_word(vp::Block *__this, vp::ClockEvent *event);
//   void check_state();
//   void handle_ready_reqs();

// protected:
//   vp::HyperMaster hyper_itf;
//   unsigned int *regs; 
//   int clkdiv;
//   Hyper_tx_channel *tx_channel;
//   Hyper_rx_channel *rx_channel;

// private:
//   vp::Trace     trace;

//   vector<Udma_transfer *> pending_transfers;

//   int pending_bytes;
//   vp::ClockEvent *pending_word_event;
//   int64_t next_bit_cycle;
//   vp::IoReq *pending_req;
//   uint32_t pending_word;
//   int transfer_size;
//   hyper_state_e state;
//   int ca_count;
//   bool pending_tx;
//   bool pending_rx;
//   Udma_transfer *current_cmd;
//   union
//   {
//     struct {
//       unsigned int low_addr:3;
//       unsigned int reserved:13;
//       unsigned int high_addr:29;
//       unsigned int burst_type:1;
//       unsigned int address_space:1;
//       unsigned int read:1;
//     } __attribute__((packed));
//     uint8_t raw[6];
//   } ca;
// };


// //#if defined(HAS_HYPER) && HYPER_VERSION == 2
// class Hyper_periph_v2 : public Udma_periph
// {
//   friend class Hyper_v2_tx_channel;
//   friend class Hyper_v2_rx_channel;

// public:
//   Hyper_periph_v2(udma *top, int id, int itf_id);
//   vp::IoReqStatus custom_req(vp::IoReq *req, uint64_t offset);
//   static void rx_sync(vp::Block *__this, int data);
//   void reset(bool active);
//   static void handle_pending_word(vp::Block *__this, vp::ClockEvent *event);
//   void check_state();
//   void handle_ready_reqs();

// protected:
//   vp::HyperMaster hyper_itf;
//   unsigned int *regs;
//   Hyper_v2_tx_channel *tx_channel;
//   Hyper_v2_rx_channel *rx_channel;

// private:
//   vp::Trace     trace;

//   vector<Udma_transfer *> pending_transfers;

//   vp_hyper_timing_cfg r_timing_cfg;
//   vp_hyper_clk_div r_clk_div;


//   int eot_event;
//   int pending_bytes;
//   vp::ClockEvent *pending_word_event;
//   int64_t next_bit_cycle;
//   vp::IoReq *pending_req;
//   uint32_t pending_word;
//   int transfer_size;
//   hyper_state_e state;
//   int delay;
//   int ca_count;
//   bool pending_tx;
//   bool pending_rx;
//   Udma_transfer *current_cmd;
//   union
//   {
//     struct {
//       unsigned int low_addr:3;
//       unsigned int reserved:13;
//       unsigned int high_addr:29;
//       unsigned int burst_type:1;
//       unsigned int address_space:1;
//       unsigned int read:1;
//     } __attribute__((packed));
//     uint8_t raw[6];
//   } ca;
// };
// //#endif


class Hyper_periph_v3;

class Hyper_transfer : public Udma_transfer
{
public:
  uint32_t ex_addr;
  int mem_sel;
  int ca_setup;
  int data;
  int latency;
  int en_add_latency;
  bool cfg_setup;
  int channel_id;
  bool is_write;
  bool twd_act;
  int twd_count;
  int twd_stride;
  bool twd_is_l2;
  int extra_size;

  void set_next(Hyper_transfer *next) { this->next = next; }
  Hyper_transfer *get_next() { return next; }
  Hyper_transfer *next;

};

class Hyper_v3_rx_channel : public Udma_rx_channel
{
  friend class Hyper_periph_v3;

public:
  Hyper_v3_rx_channel(udma *top, Hyper_periph_v3 *periph, int id, string name);
  void handle_rx_data(int data);
  void handle_ready();

private:
  void reset(bool active);
  Hyper_periph_v3 *periph;
};

typedef enum
{
  HYPER_STATE_IDLE,
  HYPER_STATE_CS,
  HYPER_STATE_CA,
  HYPER_STATE_DATA,
  HYPER_STATE_CS_OFF,
} hyper_state_e;


typedef enum
{
  HYPER_PERIPH_STATE_IDLE,
  HYPER_PERIPH_STATE_SETUP,
  HYPER_PERIPH_STATE_WRITE,
  HYPER_PERIPH_STATE_READ,
  HYPER_PERIPH_STATE_REGWRITE,
  HYPER_PERIPH_STATE_END,
} hyper_periph_state_e;


class Hyper_v3_tx_channel : public Udma_tx_channel
{
  friend class Hyper_periph_v3;

public:
  Hyper_v3_tx_channel(udma *top, Hyper_periph_v3 *periph, int id, string name);

protected:
  void handle_ready_reqs();

private:
  void reset(bool active);
  Hyper_periph_v3 *periph;

};

class Hyper_periph_v3 : public Udma_periph
{
  friend class Hyper_v3_tx_channel;
  friend class Hyper_v3_rx_channel;

public:
  Hyper_periph_v3(udma *top, int id, int itf_id);
  vp::IoReqStatus custom_req(vp::IoReq *req, uint64_t offset, int id);
  static void rx_sync(vp::Block *__this, int data);
  void reset(bool active);
  static void handle_pending_word(vp::Block *__this, vp::ClockEvent *event);
  void check_state();
  void handle_ready_reqs();

  bool get_cfg_status(int id) {return (cfg_setup[id] & command_word[id]);}
  int unpack(int original_size);
  void transfer_splitter();
  void width_modulator_16b_32b();
  void width_modulator_32b_16b();
  int update_trans_id_alloc();
  vp::IoReqStatus req(vp::IoReq *req, uint64_t offset);
  int transfer_arbiter(int id);
  void fetch_from_fifos();
  void set_device(int cs);
  void set_busy_reg(int id, int value);
  int get_busy_reg(int id);
  void update_nb_tran(int id, int value);
  int get_nb_tran(int id);

protected:
  vp::HyperMaster hyper_itf;
  unsigned int **regs;
  unsigned int *common_regs;
  int clkdiv;
  Hyper_v3_tx_channel *tx_channel;
  Hyper_v3_rx_channel *rx_channel;

private:
  vp::Trace     trace;

  vector<Udma_transfer *> pending_transfers;

  int pending_bytes;
  vp::ClockEvent *pending_word_event;
  int64_t next_bit_cycle;
  vp::IoReq *pending_req;
  uint32_t pending_word;
  int transfer_size;
  hyper_state_e state;
  int delay;
  int ca_count;
  bool pending_tx;
  bool pending_rx;

  Udma_transfer *current_cmd;
  union
  {
    struct {
      unsigned int low_addr:3;
      unsigned int reserved:13;
      unsigned int high_addr:29;
      unsigned int burst_type:1;
      unsigned int address_space:1;
      unsigned int read:1;
    } __attribute__((packed));
    uint8_t raw[6];
  } ca;

  bool *cfg_setup;
  bool *command_word;
  bool ending;
  bool command_mode;
  int twd_count;
  bool write_trans;
  bool continuous_mode;
  int transfer_size_mode;
  void enqueue_transfer(int id);
  vp::IoReqStatus hyper_cfg_req(vp::IoReq *req, int id);
  vp::IoReqStatus access_common_regs(vp::IoReq *req, uint64_t offset, int id);
  vp::IoReqStatus access_private_regs(vp::IoReq *req, uint64_t offset, int id);
  Udma_queue<Hyper_transfer> *free_fifo[HYPER_NB_CHANNELS];
  Udma_queue<Hyper_transfer> *pending_fifo[HYPER_NB_CHANNELS];
  Hyper_transfer *current_command;
  int channel_id;
  int mem_sel;

};


/*
 * UDMA
 */

template<class T>
inline void Udma_queue<T>::push(T *cmd)
{
  if (first)
    last->set_next(cmd);
  else
    first = cmd;
  cmd->set_next(NULL);
  last = cmd;
  nb_cmd++;
}



template<class T>
T *Udma_queue<T>::pop()
{
  if (!first) return NULL;
  T *cmd = first;
  first = cmd->get_next();
  nb_cmd--;

  return cmd;
}



class udma : public vp::Component
{
  friend class Udma_periph;
  friend class Udma_rx_channel;

public:

  udma(vp::ComponentConf &config);

  void reset(bool active);

  void enqueue_ready(Udma_channel *channel);

  static void channel_handler(vp::Block *__this, vp::ClockEvent *event);
  void free_read_req(vp::IoReq *req);

  void trigger_event(int event);

  vp::Trace *get_trace() { return &this->trace; }
  vp::ClockEngine *get_periph_clock() { return this->periph_clock; }

protected:
  vp::IoMaster l2_itf;
  void push_l2_write_req(vp::IoReq *req);

private:

  void check_state();

  vp::IoReqStatus conf_req(vp::IoReq *req, uint64_t offset);
  vp::IoReqStatus periph_req(vp::IoReq *req, uint64_t offset);
  static vp::IoReqStatus req(vp::Block *__this, vp::IoReq *req);
  static void event_handler(vp::Block *__this, vp::ClockEvent *event);
  static void l2_grant(vp::Block *__this, vp::IoReq *req);
  static void l2_response(vp::Block *__this, vp::IoReq *req);
  static void clk_reg(Component *_this, Component *clock);

  vp::Trace     trace;
  vp::IoSlave in;
  vp::ClkSlave    periph_clock_itf;
  vp::ClockEngine *periph_clock;
  
  int nb_periphs;
  int l2_read_fifo_size;
  std::vector<Udma_periph *>periphs;
  Udma_queue<Udma_channel> *ready_rx_channels;
  Udma_queue<Udma_channel> *ready_tx_channels;
  uint32_t clock_gating;
  vp::ClockEvent *event;
  Udma_queue<vp::IoReq> *l2_read_reqs;
  Udma_queue<vp::IoReq> *l2_write_reqs;
  Udma_queue<vp::IoReq> *l2_read_waiting_reqs;
  
  vp::WireMaster<int>    event_itf;
};


#include "spim/udma_spim_v3.hpp"

#endif
