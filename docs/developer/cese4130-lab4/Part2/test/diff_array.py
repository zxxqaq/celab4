import re
import subprocess
import matplotlib.pyplot as plt

# Define the commands to be executed
compile_command = 'make all compile_args="-DNUM_CORES='
array_cmd = ' -DARRAY='
run_command = 'make run runner_args="--trace=host/insn"'

# Define the regular expression pattern to match the trace line
pattern = r"(\d+):.*main:"

def process_log():
    # Initialize variables to store cycle counts
    first_cycle = None
    second_cycle = None

    # Read the log file
    log_file = 'out.log'  # Replace with your log file path
    with open(log_file, 'r') as file:
        for line in file:
            match = re.search(pattern, line)
            if match:
                cycle_count = int(match.group(1))  # Get the cycle count from the matched line
                
                if first_cycle is None:
                    first_cycle = cycle_count  # Record the first occurrence
                else:
                    second_cycle = cycle_count  # Record the last occurrence

    # Compute and print the cycle difference if both occurrences were found
    if first_cycle is not None and second_cycle is not None:
        cycle_difference = (second_cycle - first_cycle) / 10000
        print(f"Cycle count: {cycle_difference}")
        return cycle_difference
    else:
        print("Less than two occurrences of main found.")
        return 0

def main():
    instr_arr1 = []
    instr_arr2 = []
    for i in range(1,17):
        try:
            # Run the compile command
            print("Compiling the project...")
            subprocess.run(compile_command + str(i) + array_cmd + str(1) + '"', shell=True, check=True)

            # Run the simulation command and redirect output to out.log
            print("Running the simulation...")
            with open('out.log', 'w') as log_file:
                subprocess.run(run_command, shell=True, stdout=log_file, check=True)

            print("Simulation completed. Output is saved in out.log.")
        except subprocess.CalledProcessError as e:
            print(f"An error occurred while executing the commands: {e}")

        instr_arr1.append(process_log())

        try:
            # Run the compile command
            print("Compiling the project...")
            subprocess.run(compile_command + str(i) + array_cmd + str(2) + '"', shell=True, check=True)

            # Run the simulation command and redirect output to out.log
            print("Running the simulation...")
            with open('out.log', 'w') as log_file:
                subprocess.run(run_command, shell=True, stdout=log_file, check=True)

            print("Simulation completed. Output is saved in out.log.")
        except subprocess.CalledProcessError as e:
            print(f"An error occurred while executing the commands: {e}")

        instr_arr2.append(process_log())
    print('Cycle Count Array 1:')
    print(instr_arr1)
    print('Cycle Count Array 2:')
    print(instr_arr2)

    diff = []
    for i in range(0,16):
        diff.append(instr_arr1[i] - instr_arr2[i])

    cores = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
    # Plotting
    plt.figure(figsize=(8, 6))
    plt.plot(cores, diff, marker='o', linestyle='-', color='b', label="Array 1")

    # Labels and title
    plt.xlabel('Number of Cores')
    plt.ylabel('Difference in Cycles between Array 1 and Array 2')
    plt.title('Execution Cycles vs Number of Cores')
    # plt.legend()

    # Grid and display
    plt.grid(True)
    plt.xticks(cores)  # Set x-ticks to core numbers
    plt.show()


if __name__ == "__main__":
    main()