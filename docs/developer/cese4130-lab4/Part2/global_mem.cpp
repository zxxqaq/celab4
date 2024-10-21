#include <vp/vp.hpp>
#include <vp/signal.hpp>
#include <vp/itf/io.hpp>

class MyComp : public vp::Component
{

public:
    MyComp(vp::ComponentConf &config);

private:
    static vp::IoReqStatus handle_req(vp::Block *__this, vp::IoReq *req);

    vp::IoSlave input_itf;

    // Global counter for each core
    uint32_t count[16];

    // Sync register
    uint32_t sync_reg;

    vp::Trace trace;
    vp::Signal<uint32_t> vcd_value;
};


MyComp::MyComp(vp::ComponentConf &config)
    : vp::Component(config), vcd_value(*this, "status", 32)
{
    this->input_itf.set_req_meth(&MyComp::handle_req);
    this->new_slave_port("input", &this->input_itf);

    for(int i = 0; i < 16; i++){
        this->count[i] = this->get_js_config()->get_child_int("count");
    }

    this->sync_reg = this->get_js_config()->get_child_int("sync_reg");

    this->traces.new_trace("trace", &this->trace);
}

vp::IoReqStatus MyComp::handle_req(vp::Block *__this, vp::IoReq *req)
{
    MyComp *_this = (MyComp *)__this;

    _this->trace.msg(vp::TraceLevel::DEBUG, "Received request at offset 0x%lx, size 0x%lx, is_write %d\n",
        req->get_addr(), req->get_size(), req->get_is_write());

    if (req->get_size() == 4)
    {
        if(req->get_addr() == 0x00){
            if (!req->get_is_write()){
                *(uint32_t *)req->get_data() = _this->sync_reg;
            }
            else {
                _this->sync_reg = *(uint32_t *)req->get_data();
            }
        }
        else{
            if (!req->get_is_write()){
                *(uint32_t *)req->get_data() = _this->count[(req->get_addr() - 4) / 4];    
            }
            else {
                _this->count[(req->get_addr() - 4) / 4] = *(uint32_t *)req->data;
            }
            
        }
        
    }
    return vp::IO_REQ_OK;
}


extern "C" vp::Component *gv_new(vp::ComponentConf &config)
{
    return new MyComp(config);
}
