    .section .text
    .global _start
_start:
    // Stack initialization
    //la    x2, stack
    # Read the hart ID (hardware thread ID) from the mhartid CSR
    csrr a0, mhartid      # a0 = mhartid (hart ID)

    # Set up the stack based on the core (hart ID)
    li a1, 0
    beq a0, a1, setup_core0_stack   # If hart ID is 0, jump to core 0 setup

    li a1, 1
    beq a0, a1, setup_core1_stack   # If hart ID is 1, jump to core 1 setup

    li a1, 2
    beq a0, a1, setup_core2_stack   # If hart ID is 2, jump to core 2 setup

    li a1, 3
    beq a0, a1, setup_core3_stack   # If hart ID is 3, jump to core 3 setup

    li a1, 4
    beq a0, a1, setup_core4_stack   # If hart ID is 4, jump to core 4 setup

    li a1, 5
    beq a0, a1, setup_core5_stack   # If hart ID is 5, jump to core 5 setup

    li a1, 6
    beq a0, a1, setup_core6_stack   # If hart ID is 6, jump to core 6 setup

    li a1, 7
    beq a0, a1, setup_core7_stack   # If hart ID is 7, jump to core 7 setup

    li a1, 8
    beq a0, a1, setup_core8_stack   # If hart ID is 8, jump to core 8 setup

    li a1, 9
    beq a0, a1, setup_core9_stack   # If hart ID is 9, jump to core 9 setup

    li a1, 10
    beq a0, a1, setup_core10_stack   # If hart ID is 10, jump to core 10 setup

    li a1, 11
    beq a0, a1, setup_core11_stack   # If hart ID is 11, jump to core 11 setup

    li a1, 12
    beq a0, a1, setup_core12_stack   # If hart ID is 12, jump to core 12 setup

    li a1, 13
    beq a0, a1, setup_core13_stack   # If hart ID is 13, jump to core 13 setup

    li a1, 14
    beq a0, a1, setup_core14_stack   # If hart ID is 14, jump to core 14 setup

    li a1, 15
    beq a0, a1, setup_core15_stack   # If hart ID is 15, jump to core 15 setup

    j start_program                 # For safety, jump to start_program

setup_core0_stack:
    la x2, stack0      # Load stack address for core 0
    j start_program

setup_core1_stack:
    la x2, stack1      # Load stack address for core 1
    j start_program

setup_core2_stack:
    la x2, stack2      # Load stack address for core 2
    j start_program

setup_core3_stack:
    la x2, stack3      # Load stack address for core 3
    j start_program

setup_core4_stack:
    la x2, stack4      # Load stack address for core 4
    j start_program

setup_core5_stack:
    la x2, stack5      # Load stack address for core 5
    j start_program

setup_core6_stack:
    la x2, stack6      # Load stack address for core 6
    j start_program

setup_core7_stack:
    la x2, stack7      # Load stack address for core 7
    j start_program

setup_core8_stack:
    la x2, stack8      # Load stack address for core 8
    j start_program

setup_core9_stack:
    la x2, stack9      # Load stack address for core 9
    j start_program

setup_core10_stack:
    la x2, stack10      # Load stack address for core 10
    j start_program

setup_core11_stack:
    la x2, stack11      # Load stack address for core 11
    j start_program

setup_core12_stack:
    la x2, stack12      # Load stack address for core 12
    j start_program

setup_core13_stack:
    la x2, stack13      # Load stack address for core 13
    j start_program

setup_core14_stack:
    la x2, stack14      # Load stack address for core 14
    j start_program

setup_core15_stack:
    la x2, stack15      # Load stack address for core 15
    j start_program

start_program:
    // Exception handler
    la    t0, handle_exception
    csrw  0x305, t0

    // Do all other initializations from C code
    la    t0, __init_start
    addi  a0, x0, 0
    jalr  x1, t0


handle_exception:
    la    t0, exit
    li    a0, 1
    jr    t0

handle_exception_loop:
    j handle_exception_loop