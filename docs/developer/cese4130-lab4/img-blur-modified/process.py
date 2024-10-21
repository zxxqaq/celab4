import re

# Define the regular expression pattern to match the trace line
pattern = r"(\d+):.*main:"
 
def process_log():
    # Initialize variables to store cycle counts
    first_cycle = None
    second_cycle = None
 
    # Read the log file
    log_file = 'out.log'
    with open(log_file, 'r') as file:
        for line in file:
            match = re.search(pattern, line)
            if match:
                cycle_count = int(match.group(1))  # Get the cycle count from the matched line
                
                if first_cycle is None:
                    first_cycle = cycle_count  # Record the first occurrence
                else:
                    second_cycle = cycle_count  # Record the last occurrence
 
    # Compute and print the cycle difference if first and last occurrences were found
    if first_cycle is not None and second_cycle is not None:
        cycle_difference = (second_cycle - first_cycle) / 10000
        print(f"Cycle count difference of 'main:' occurrences: {cycle_difference}")
        return cycle_difference
    else:
        print("Less than two occurrences of main found.")
        return 0
    
process_log()