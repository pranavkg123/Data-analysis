import numpy as np

# List of differences (after - before weights)
differences = [d1, d2, d3, d4, d5, d6, d7, d8]  # Replace with actual differences

# Calculate the standard deviation
std_dev = np.std(differences, ddof=1)  # ddof=1 for sample standard deviation

print("Standard Deviation of Differences:", std_dev)
