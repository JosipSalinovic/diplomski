
import numpy as np
import matplotlib.pyplot as plt
# Load data
angles = []
magnitudes = []

with open("voda.txt", "r") as file:
    for line in file:
        if line.strip():
            angle_deg, magnitude = map(float, line.strip().split())
            angles.append(np.deg2rad(angle_deg))  # convert to radians
            magnitudes.append(magnitude)

# Plot
plt.figure()
ax = plt.subplot(111, polar=True)
ax.plot(angles, magnitudes, marker='o', markersize=2)

# Customize angle grid ticks
ax.set_thetagrids(range(0, 360, 15))  # Grid every 15°


plt.show()