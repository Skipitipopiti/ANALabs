%% SIZING AB OUTPUT STAGE - PROJ. 2 

clear all
clc

%Parameters
bn = 18.6e-6;
bp = 5.46e-6;
r = bn/bp;
Vthn = 0.880;
Vthp = 0.920;
Vps = 6;
Vomax = 4.6;
R = 1000;
imax = Vomax/R;
Ips = 150e-6;
Ln = 500e-9;
Lp = 600e-9;

%M0
Vod29 = 0.2;
Vgs0max= Vps - Vod29-Vomax;
Vod0 = Vgs0max -Vthn;
WL0 = imax/(bn*Vod0^2);
W0 = WL0*Ln*1e6     %[um]

%M1
Vod30 = 0.2;
Vgs1max = Vps -Vod30 - Vomax;
Vod1 = Vgs1max -Vthp;
WL1 = imax/(bn*Vod1^2);
W1 = WL1*Lp*1e6     %[um]

%M2 e M3
Ib = 5e-6;

k = Ips/Ib -5
WL2 = WL0/k;
W2 = WL2*Ln*1e6     %[um]
WL3 = WL1/k;
W3 = WL3*Lp*1e6     %[um]

%M29 e M30 
WL29 = Ib/(bp*Vod29^2);
L29 = 1e-6;
W29 = WL29*L29*1e6   %[um]
WL30 = Ib/(bn*Vod30^2);
L30 = 2e-6;
W30 = WL30*L30*1e6   %[um]

%Cross-conduction current
Icc = Ib*((2*WL2)^(-1/2)+(2*WL3)^(-1/2))^2/((2*WL0)^(-1/2)+(2*WL1)^(-1/2))^2*1e3    %[mA]
