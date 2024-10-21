#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

// Define the number of cores you want to simulate with
// Hint: You can use this to test your code with different number of cores
#ifndef NUM_CORES
    #define NUM_CORES 1
#endif

// Do not change the number of bins and letters per bin
#define NUM_BINS 7
#define N_LETTERS_PER_BIN 4

// ************************* Test Arrays *************************
// const char arr[] = "programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors programming massively parallel processors"; 
// Output Data:
// Bin[0]: 500
// Bin[1]: 500
// Bin[2]: 600
// Bin[3]: 1000
// Bin[4]: 1000
// Bin[5]: 100
// Bin[6]: 100

const char arr[] = "programming massively parallel processors";
// Output Data:
// Bin[0]: 5
// Bin[1]: 5
// Bin[2]: 6
// Bin[3]: 10
// Bin[4]: 10
// Bin[5]: 1
// Bin[6]: 1
// ****************************************************************

// Define the Global memory shared between all the cores
uint32_t *global_mem = (uint32_t*)0x20000004;
uint32_t *sync = (uint32_t *)0x20000000;        // Sync used to indicate program end


// Read the Core_ID
uint32_t read_hart_id(void) {
    uint32_t hart_id;
    asm volatile ("csrr %0, mhartid" : "=r"(hart_id));
    return hart_id;
}

// Loop until all the cores have updated their global-memory element
void sync_cores(){
    int done = 0;
    while(!done){
        done = 1;
        for(int i = 0 ; i < NUM_CORES * NUM_BINS; i++){
            if(global_mem[i] == -1){
                done = 0;
            }
        }    
    }  
}

// Pause the core until Sync is updated
// Required in simulation since GVSoC stops simulation once core has executed the program.
void pause_core(){
    while(*sync != 0);
    exit(0);
}

int main()
{
    // Read the core_id of the core executing the code
    uint32_t core_id = read_hart_id();

    // Uncomment to set the global_memory variable for unused cores to 0 and Pause the core unused cores
    // if (core_id >= NUM_CORES){
    //     global_mem[core_id] = 0;
    //     pause_core();
    // }

    // TODO: Slice the array into sections based on NUM_CORES
    // Hint: Each start_index should be dynamically calculated using arr_size_per_core
    // array_size_per_core should be calculated using NUM_CORES (remember setting the kernel parameters in CUDA)
    int arr_size = sizeof(arr) / sizeof(arr[0]);
    int arr_size_per_core = arr_size;
    int start_index = 0;
    int end_index = start_index + arr_size_per_core;                 
    int local_counter[7] = {0, 0, 0, 0, 0, 0, 0};

    int bin_index;
    for (int i = start_index; i < end_index; i++) {
        char c = arr[i];
        // Protection from illegal memory access
        if (i >= arr_size) {
            break;
        }
        if (c >= 'a' && c <= 'z') {
            bin_index = (c - 'a') / N_LETTERS_PER_BIN;
            local_counter[bin_index]++;
        }
    }

    // Uncomment to update of the global variable
    // for (int i = 0; i < NUM_BINS; i++) {
    //     global_mem[core_id * NUM_BINS + i] = local_counter[i];
    // }

    // Uncomment to pause all cores except Core 0
    // if(core_id != 0){
    //     pause_core();
    // }

    // Uncomment to synchronize all the cores
    // sync_cores();

    // TODO: Calculate the Final Sum Value
    // Hint: You need to add up the global_memory values for each 
    // final count from the used cores
    int final_count[7] = {0, 0, 0, 0, 0, 0, 0};
    for (int j = 0; j < NUM_BINS; j++) {
        final_count[j] += local_counter[j];
    }

    // Print Final Value
    printf("Output Data:\n");
    for (int i = 0; i < NUM_BINS; i++){
        printf("Bin[%d]: %d\n", i, final_count[i]);
    }       
    
    // Uncomment sync so that all the cores can terminate
    // *sync = 0;

    return 0;  
}
