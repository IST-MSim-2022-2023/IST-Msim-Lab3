%% P4
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables

%init
Altura = 10;
V = 30;
K = -0.8;

%% run Sim
out = sim("P4simulink2022a", 8.5);

%% Plot
set(gcf, 'Position',  [100, 100, 680, 500])
plot(out.y,out.Altura,LineStyle='--', LineWidth=1.5, Color="#745296"); hold on

plot(out.y(end),out.Altura(end),'-o', LineWidth=3.5, Color="#D1B1CB", MarkerFaceColor="#D1B1CB"); hold on

xline(0, '-', 'Parede 1', 'interpreter','latex', 'LineWidth',2,'FontSize',9,"Color","#252323"); 
hold on
xline(5, '-', 'Parede 2', 'interpreter','latex', 'LineWidth',2,'FontSize',9,"Color","#252323"); 
hold off

xlabel('\textbf{$\mathbf{y}$ [m]}','interpreter','latex','FontSize',16)
ylabel('\textbf{$\mathbf{z}$ [m]}','interpreter','latex','FontSize',16);
