import cpu.iss.riscv
import memory.memory
import vp.clock_domain
import interco.router
import utils.loader.loader
import gvsoc.systree
import gvsoc.runner
import gdbserver.gdbserver
import global_mem


GAPY_TARGET = True

class Soc(gvsoc.systree.Component):

    def __init__(self, parent, name, parser):
        super().__init__(parent, name)

        # Parse the arguments to get the path to the binary to be loaded
        [args, __] = parser.parse_known_args()

        binary = args.binary

        # Main interconnect
        ico = interco.router.Router(self, 'ico')

        # Main memory
        mem = memory.memory.Memory(self, 'mem', size=0x00100000)
        ico.o_MAP(mem.i_INPUT(), 'mem', base=0x00000000, size=0x00100000, rm_base=True)

        # Define 16 cores
        cores = []
        for core_id in range(16):
            core = cpu.iss.riscv.Riscv(self, f'host_{core_id}', isa='rv64imafdc', core_id=core_id)
            core.o_FETCH(ico.i_INPUT())
            core.o_DATA(ico.i_INPUT())
            core.o_DATA_DEBUG(ico.i_INPUT())
            cores.append(core)

        # ELF loader (one loader for all cores)
        loader = utils.loader.loader.ElfLoader(self, 'loader', binary=binary)
        loader.o_OUT(ico.i_INPUT())
        loader.o_START(cores[0].i_FETCHEN())  # Only the first core starts the execution
        loader.o_ENTRY(cores[0].i_ENTRY())

        gdbserver.gdbserver.Gdbserver(self, 'gdbserver')
        # Create global memory component
        gm = global_mem.Global_Mem(self, 'gm')

        # Map global memory to the interconnect with the specified base address and size
        ico.o_MAP(gm.i_INPUT(), 'gm', base=0x20000000, size=0x00001000, rm_base=True)

        # # Instantiates the main core and connect fetch and data to the interconnect
        # host = cpu.iss.riscv.Riscv(self, 'host', isa='rv64imafdc', core_id = 0)
        # host.o_FETCH     ( ico.i_INPUT     ())
        # host.o_DATA      ( ico.i_INPUT     ())
        # host.o_DATA_DEBUG(ico.i_INPUT    ())


        # # Finally connect an ELF loader, which will execute first and will then
        # # send to the core the boot address and notify him he can start
        # loader = utils.loader.loader.ElfLoader(self, 'loader', binary=binary)
        # loader.o_OUT     ( ico.i_INPUT     ())
        # loader.o_START   ( host.i_FETCHEN  ())
        # loader.o_ENTRY   ( host.i_ENTRY    ())
        





# This is a wrapping component of the real one in order to connect a clock generator to it
# so that it automatically propagate to other components
class Rv64(gvsoc.systree.Component):

    def __init__(self, parent, name, parser, options):

        super().__init__(parent, name, options=options)

        clock = vp.clock_domain.Clock_domain(self, 'clock', frequency=100000000)
        soc = Soc(self, 'soc', parser)
        clock.o_CLOCK    ( soc.i_CLOCK     ())




# This is the top target that gapy will instantiate
class Target(gvsoc.runner.Target):

    def __init__(self, parser, options):
        super(Target, self).__init__(parser, options,
            model=Rv64, description="RV64 virtual board")

