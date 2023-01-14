%% P1 - Phase Portrait
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;
%%
g = 9.81;

[X,Y] = meshgrid(0:2:38,-19:2:19);
U = Y;
V = zeros(length(U),length(U)) -g;

set(gcf, 'Position',  [100, 100, 660, 500])

quiver(Y, X, V, U, LineWidth=1.5, Color="#5AA4FF"); 

set(gca,'Visible','off')
h=gca; h.XAxis.TickLength = [0 0];
h=gca; h.YAxis.TickLength = [0 0];

ylim([-4 13]); xlim([-20 20]);