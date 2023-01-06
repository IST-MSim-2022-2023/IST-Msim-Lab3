%% P2
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables

% terreno
Vy_Inicial = 1; Treshold_y = 10;
K1 = -1; K2 = -0.8;

%init
Altura = 10;
V = 15;

%% run Sim
out = sim("P3simulink2022a", 20);

%% Plot
figure(1);

x = [0 10 10 0]; y = [0 0 25 25];
patch(x,y,[0,0,0,0],[0 0 0 0], FaceColor="#0072BD",FaceAlpha=0.2); hold on;

x = [10 20 20 10];
patch(x,y,[0,0,0,0],[0 0 0 0], FaceColor="#EDB120",FaceAlpha=0.2); hold on;

plot(out.y(1:38),out.Altura(1:38),LineStyle='-', LineWidth=3, Color="#0072BD"); hold on
plot(out.y(38:70),out.Altura(38:70),LineStyle='-', LineWidth=3, Color="#EDB120"); hold on

ylabel('\textbf{$\mathbf{z}$ [m]}','interpreter','latex','FontSize',15)
xlabel('\textbf{$\mathbf{y}$ [m]}','interpreter','latex','FontSize',15);

legend({'\textbf{$\mathbf{\alpha}$ = 1}','\textbf{$\mathbf{\alpha}$ = 0.8}'}, ...
            'Interpreter', 'latex', 'Location','best');
