import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation

plt.rcParams['animation.ffmpeg_path'] = r'C:\ffmpeg\ffmpeg-master-latest-win64-gpl-shared\bin\ffmpeg'
plt.rcParams.update({'font.size': 13})

pi=np.pi
j=1j
k=2*np.pi
l=0.5
t=0.0
w=300.0e+06
e=0.0001
fig = plt.figure(dpi=300)
ax = plt.gca()

y = np.linspace(-3, 3, 600)
filteredy = y[(y < -0.01) | (y > 0.01)]
z = np.linspace(-3, 3, 600)
#t= 2.09e-08*0.25
Y, Z = np.meshgrid(filteredy,z)
plt.axis('equal')


X=0

R = np.sqrt(X**2+Y**2 + Z**2)

R_1 = np.sqrt(X**2+Y**2 + (Z-l/2)**2)
R_2 = np.sqrt(X**2+Y**2 + (Z+l/2)**2)

E_rho=j*(0.3*((Z-l/2)*np.exp(-j*(k*R_1-w*t))/(R_1)+(Z+l/2)*np.exp(-j*(k*R_2-w*t))/(R_2))/(Y))#El.polje rho je u y smjeru za yz ravninu
E_z=-j*(0.3*(np.exp(-j*(k*R_1-w*t))/(R_1)+np.exp(-j*(k*R_2-w*t))/(R_2)))#El.polje u z smjeru
E_uk = (np.sqrt(E_rho**2 + E_z**2))#ukupno polje je zbroj komponenata


contour= plt.contourf(Y, Z, (E_uk.real), levels=1000, cmap='viridis',vmin=0,vmax=2.5)
plt.colorbar(contour, label='Re$[E]$ (V/m)')













def update(frame):
    ax.clear()
    t=frame*(2.09e-08)/64
    plt.xlabel('$y$ (m)')
    plt.ylabel('$z$ (m)')
    plt.xlim([-3,3])
    plt.ylim([-3,3])
    plt.title('Animacija polja, Autor:Josip Šalinović')


    E_rho=j*(0.3*((Z-l/2)*np.exp(-j*(k*R_1-w*t))/(R_1)+(Z+l/2)*np.exp(-j*(k*R_2-w*t))/(R_2))/(Y))#El.polje rho je u y smjeru za yz ravninu
    E_z=-j*(0.3*(np.exp(-j*(k*R_1-w*t))/(R_1)+np.exp(-j*(k*R_2-w*t))/(R_2)))#El.polje u z smjeru
    E_uk = (np.sqrt(E_rho**2 + E_z**2))#ukupno polje je zbroj komponenata
    contour= plt.contourf(Y, Z, (E_uk.real), levels=1000, cmap='viridis',vmin=0,vmax=2.5)
    
    
    
    return contour

ani=animation.FuncAnimation(fig,update,frames=128)
FFwriter=animation.FFMpegWriter(fps=15,extra_args=['-vcodec','libx264'])
ani.save('antenavideo.mp4',writer=FFwriter)
