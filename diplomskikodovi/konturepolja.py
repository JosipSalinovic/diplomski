import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
plt.rcParams.update({'font.size': 13})
# Constants



#theta = np.arccos(Z / (R + 1e-12))  # avoid division by zero
# Electric field in theta direction (magnitude)

pi = np.pi
j = 1j  # imaginary unit
k=2*np.pi

l=0.5
fig = plt.figure(figsize=(9,5))


w=300.0e+06
x = np.linspace(-3, 3, 400)
y = np.linspace(-3, 3, 400)
z = np.linspace(-3, 3, 400)
t= 2.09e-08*0.25
Y, Z = np.meshgrid(y, z)
plt.axis('equal')
plt.xlabel('$y$ (m)')
plt.ylabel('$z$ (m)')
plt.xlim([-2,2])
plt.ylim([-2,2])

X=0

R = np.sqrt(X**2+Y**2 + Z**2)

R_1 = np.sqrt(X**2+Y**2 + (Z-l/2)**2)
R_2 = np.sqrt(X**2+Y**2 + (Z+l/2)**2)

phi = np.arcsin(Y / (R + 1e-12))  # avoid division by zero


#plt.grid(True)

E_rho=j*(0.3*((Z-l/2)*np.exp(-j*(k*R_1-w*t))/(R_1)+(Z+l/2)*np.exp(-j*(k*R_2-w*t))/(R_2))/Y)#El.polje rho je u y smjeru za yz ravninu
E_z=-j*(0.3*(np.exp(-j*(k*R_1-w*t))/(R_1)+np.exp(-j*(k*R_2-w*t))/(R_2)))#El.polje u z smjeru
E_uk = (np.sqrt(E_rho**2 + E_z**2))#ukupno polje je zbroj komponenata

H_phi=-0.3*(np.exp(-j*(k*R_1-w*t))/(R_1)+np.exp(-j*(k*R_2-w*t))/(R_2))/(j*Y) 

H_phix=-np.sin(phi)*H_phi
H_phiy=np.cos(phi)*H_phi

H_uk=np.sqrt(H_phix**2+H_phiy**2)

 
contour= plt.contourf(Y, Z, (E_uk.real), levels=2200, cmap='viridis',vmin=0,vmax=1.5)
plt.colorbar(contour, label='Re$[E]$ (V/m)')

plt.show()
