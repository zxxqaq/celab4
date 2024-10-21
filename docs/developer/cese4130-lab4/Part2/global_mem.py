
import gvsoc.systree

class Global_Mem(gvsoc.systree.Component):
    def __init__(self, parent: gvsoc.systree.Component, name: str):

        super().__init__(parent, name)

        self.add_sources(['global_mem.cpp'])

        # Initialize the memory 
        self.add_properties({
            "count": -1,
            "sync_reg": -1,
        })

    def i_INPUT(self) -> gvsoc.systree.SlaveItf:
        return gvsoc.systree.SlaveItf(self, 'input', signature='io')
