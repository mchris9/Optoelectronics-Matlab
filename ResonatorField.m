%% Energy Density Propagation in a Resonator
clear;
clc;

%% First Mode

%Instantiating the known variables
Eo = 10^3;
L = 2*10^-6;
n = 1.5;
N = 1;
z = 0:L/10000:L;
u = 4*pi*10^-7;
t = 0;
c = 3*10^8;
e = n^2*8.85*10^-12;

%Finding Wavelength and Wave Number
Lamda = 2*n*L/N;
k = n*2*pi/Lamda;
w = c*k/n;

%Finding Time Averaged Electric Field
E_forward = Eo*exp(1j*w*t)*exp(-1j*k*z);
E_backward = -Eo*exp(1j*w*t)*exp(1j*k*z);
%E_time_averaged = 1/2*real(abs(E_forward).^2) + 1/2*real(abs(E_backward).^2) + 1/2*real(E_forward.*conj(E_backward) + E_backward.*conj(E_forward));
E = E_forward + E_backward;

%Finding Time Averaged Magnetic Field
Ho = k*Eo/(w*u);
H_forward = -Ho*exp(1j*w*t)*exp(-1j*k*z);
H_backward = Ho*exp(1j*w*t)*exp(1j*k*z);
%H_time_averaged = 1/2*real(abs(H_forward).^2) + 1/2*real(abs(H_backward).^2) + 1/2*real(H_forward.*conj(H_backward) + H_backward.*conj(H_forward));
H = H_forward + H_backward;

energy = 1/4*real(e*E.*conj(E)+u*H.*conj(H));
figure(1)
plot(z,energy);
title('Fundamental Mode Energy Density in the Resonator');
xlabel('Distance (m)')
ylabel('Energy Density uW/m^3')

print -dtiff FundamentalEnergyDensityplot.tif;

%% Second Mode

N = 2;

Lamda = 2*n*L/N;
k = n*2*pi/Lamda;
w = c*k/n;

%Finding Time Averaged Electric Field
E_forward = Eo*exp(1j*w*t)*exp(-1j*k*z);
E_backward = -Eo*exp(1j*w*t)*exp(1j*k*z);
%E_time_averaged = 1/2*real(abs(E_forward).^2) + 1/2*real(abs(E_backward).^2) + 1/2*real(E_forward.*conj(E_backward) + E_backward.*conj(E_forward));
E = E_forward + E_backward;

%Finding Time Averaged Magnetic Field
Ho = k*Eo/(w*u);
H_forward = -Ho*exp(1j*w*t)*exp(-1j*k*z);
H_backward = Ho*exp(1j*w*t)*exp(1j*k*z);
%H_time_averaged = 1/2*real(abs(H_forward).^2) + 1/2*real(abs(H_backward).^2) + 1/2*real(H_forward.*conj(H_backward) + H_backward.*conj(H_forward));
H = H_forward + H_backward;

energy = 1/4*real(e*E.*conj(E)+u*H.*conj(H));
figure(2)
plot(z,energy);
title('Second Mode Energy Density in the Resonator');
xlabel('Distance (m)')
ylabel('Energy Density uW/m^3')

print -dtiff SecondModeEnergyDensityplot.tif;