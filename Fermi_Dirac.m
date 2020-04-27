%% Fermi-Dirac
clear;
clc;

%% Probability At Ground Energy Level
Delta_E = -1:.0001:1;
T = [10,300,3000];
K = 8.62*10^-5;

fermi_10K = 1./(1+exp(Delta_E./(K*T(1))));
fermi_300K = 1./(1+exp(Delta_E./(K*T(2))));
fermi_3000K = 1./(1+exp(Delta_E./(K*T(3))));

figure(1)
plot(Delta_E,fermi_10K); hold on;
plot(Delta_E,fermi_300K); hold on;
plot(Delta_E,fermi_3000K); hold on;
title('Fermi-Dirac At Different Temperatures');
ylabel('Probability')
xlabel('Delta E (eV)')
legend('T = 10K','T = 300K','T = 3000K')

%% Total Probability Over an EF range

E1 = 0;
E2 = 1;
EF = -0.5:0.0001:1.5;

total_fermi_10k = 1./(1+exp((E1-EF)./(K*T(1)))) + 1./(1+exp((E2-EF)./(K*T(1))));
total_fermi_300k = 1./(1+exp((E1-EF)./(K*T(2)))) + 1./(1+exp((E2-EF)./(K*T(2))));
total_fermi_3000k = 1./(1+exp((E1-EF)./(K*T(3)))) + 1./(1+exp((E2-EF)./(K*T(3))));

figure(2)
plot(EF,total_fermi_10k); hold on;
plot(EF,total_fermi_300k); hold on;
plot(EF,total_fermi_3000k); hold on;
title('Total Fermi-Dirac Probability At Different Fermi Levels')
ylabel('Probability')
xlabel('Fermi Energy Level (eV)')
legend('T = 10K','T = 300K','T = 3000K')

for i = 1:length(total_fermi_10k)
    if total_fermi_300k(i) == 1
        fprintf('Fermi level at 300 Kelvin is at: %d\n', EF(i));
    end
    if total_fermi_3000k(i) == 1
        fprintf('Fermi level at 3000 Kelvin is at: %d\n', EF(i));
    end
end
