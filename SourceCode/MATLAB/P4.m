%% P2
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables

% terreno
Vy_Inicial = 1; Treshold_y = 10;
K1 = -1; K2 = 0.8;

%init
Altura = 10;
V = 15;

%% run Sim
out = sim("P4simulink", 20);

plot(out.y,out.Altura,LineStyle='-', LineWidth=3, Color="#EDB120"); hold on
