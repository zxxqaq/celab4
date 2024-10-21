import re
import subprocess
import matplotlib.pyplot as plt

# Define the commands to be executed
compile_command = 'make all compile_args="-DNUM_CORES='
array_cmd = ' -DARRAY='
run_command = 'make run'



expected_output = [56, 0, 12]

def main():
    pass_flag = True
    for arr in range(1,4):
        for i in range(1,17):
            try:
                # Run the compile command
                print("Compiling the project...")
                subprocess.run(compile_command + str(i) + array_cmd + str(arr) + '"', shell=True, check=True)

                # Run the simulation command and redirect output to out.log
                print("Running the simulation...")
                with open('out.log', 'w') as log_file:
                    subprocess.run(run_command, shell=True, stdout=log_file, check=True)

                print("Simulation completed. Output is saved in out.log.")
            except subprocess.CalledProcessError as e:
                print(f"An error occurred while executing the commands: {e}")
            with open('out.log', 'r') as file:
                content = file.read()
                match = re.search(r'The total 3s are:(\d+)', content)
                if match:
                    if(int(match.group(1)) != expected_output[arr-1]):
                        pass_flag = False
                        print("Failed verification for %d cores and for array %d",i, arr)
    if pass_flag:
        print("\n\nAll tests were passed!!")
    else:
        print("Incorrect output")

                

if __name__ == "__main__":
    main()