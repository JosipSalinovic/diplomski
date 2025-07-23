import numpy as np
import math
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


plt.rcParams.update({'font.size':15})




theta, phi = np.linspace(0.001, 0.999 * np.pi, 80), np.linspace(0.001, 1.999*np.pi, 80)
THETA, PHI = np.meshgrid(theta, phi)

R =np.sqrt(0.5*((np.cos((np.pi/2)*np.cos(THETA)))/(np.sin(THETA)))**2)
X = R * np.sin(THETA) * np.cos(PHI)
Y = R * np.sin(PHI) * np.sin(THETA)
Z = R * np.cos(THETA)
fig = plt.figure()
ax = fig.add_subplot(1,1,1,projection='3d')
ax.set_xlabel('$x$ (m)', labelpad=10)
ax.set_ylabel('$y$ (m)', labelpad=10)
ax.set_zlabel('$z$ (m)', labelpad=10)

ax.axes.set_xlim3d(left=-0.65, right=0.65) 
ax.axes.set_ylim3d(bottom=-0.65, top=0.65) 
ax.axes.set_zlim3d(bottom=-0.65, top=0.65)  

plot = ax.plot_surface(
    X, Y, Z, rstride=1, cstride=1, cmap='viridis',
    linewidth=0, antialiased=False, alpha=0.5)







#ax.set_box_aspect((1, 1, 1))

plt.show()
