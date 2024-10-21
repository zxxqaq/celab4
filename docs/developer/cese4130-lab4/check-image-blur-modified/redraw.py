import numpy as np
import matplotlib.pyplot as plt

# Step 1: Read the text file and ignore lines until "Output Data:"
txt_file = 'data.txt'  # Replace with your text file path

data = []
start_reading = False

# Open the text file
with open(txt_file, 'r') as file:
    for line in file:
        # Start reading data after finding "Output Data:"
        if "Output Data:" in line:
            start_reading = True
            continue  # Skip the "Output Data:" line itself
        
        # If we are past "Output Data:", collect the data
        if start_reading:
            data.append(int(line.strip()))  # Convert each line to integer

# Step 2: Ensure the data contains exactly 1024 elements
if len(data) != 1024:
    raise ValueError("The data does not contain exactly 1024 elements.")

# Convert the list into a numpy array
data = np.array(data)

# Step 3: Reshape the data into a 32x32 grid
image_data = data.reshape(32, 32)

# Step 4: Normalize the data (optional)
# If your values are not already in the range 0-255, normalize them
image_data = ((image_data - image_data.min()) / (image_data.max() - image_data.min()) * 255).astype(np.uint8)

# Step 5: Generate and save the image
plt.imshow(image_data, cmap='gray')  # Use 'gray' for grayscale, or remove cmap for a color image
plt.axis('off')  # Hide the axes
plt.savefig('output_image.png', bbox_inches='tight', pad_inches=0)
