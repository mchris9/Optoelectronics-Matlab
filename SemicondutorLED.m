%% Semiconductor Alloy Bandgap
clear;
clc;

N = 1000;

x = 0:0.37/N:0.37;
Eg_Alx_Gax_As = 1.424 + 1.266*x + 0.266*x.^2;

x = 0:0.47/N:0.47;
y = 2.2*x;
Eg_Inx_Gax_Asy_Py = 1.35-0.72*y+0.12*y.^2;

figure(1)
plot(x,Eg_Alx_Gax_As);
xlim([0,0.37]);
title('Bandgap of Al_xGa_{1-x}As as a function of mole fraction')
xlabel('Mole fraction')
ylabel('Bandgap (eV)')

figure(2)
plot(x,Eg_Inx_Gax_Asy_Py);
xlim([0,0.47]);
title('Bandgap of In_{1-x}Ga_xAs_yP_{1-y} as a function of mole fraction')
xlabel('Mole fraction As')
ylabel('Bandgap (eV)')

%% LED

x = 0:0.37/N:0.37;
Lamda = 1.24./(Eg_Alx_Gax_As);

figure(3)
plot(x,Lamda)
xlim([0,0.37]);
title('Emission wavelength of Al_xGa_{1-x}As as a function of mole fraction')
xlabel('Mole fraction')
ylabel('Wavelength (um)')

x = 0:0.47/N:0.47;
Lamda = 1.24./(Eg_Inx_Gax_Asy_Py);

figure(4)
plot(x,Lamda);
xlim([0,0.47]);
title('Emission wavelength of In_{1-x}Ga_xAs_yP_{1-y} as a function of mole fraction')
xlabel('Mole fraction Ga')
ylabel('Wavelength (um)')