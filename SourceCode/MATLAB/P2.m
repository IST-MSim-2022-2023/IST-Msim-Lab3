%% P2
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables
K = -0.8;
coefAtrito = -0.4;
Altura = 10;
V = 15;

%% run Sim
out1 = sim("P1simulink2022a", 20);
out2 = sim('P2simulink2022a',20);

%% function call

Compare(out1,out2)

K = -1;
V = 15;
coefAtrito = -0.8;
Altura = 100;
TerminalVelocity()

%% Terminal Velocity
function TerminalVelocity()
   
    % Altura
    out2 = sim('P2simulink2022a',15);
    figure(2)
    subplot(3,1,1)
    plot(out2.t(end),out2.Altura(end),'r*',MarkerSize=10); hold on;
    title('\textbf{Simula\c{c}\~ao do sistema:} \textbf{Velocidade Terminal}','FontSize',16,'Interpreter', 'latex');
    plot(out2.t, out2.Altura, LineStyle='-', LineWidth=1.5,Color=	"#0072BD");
    grid(), grid minor;
    xlim([0 16]); ylim([-2 110]);

    xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
    ylabel('\textbf{$\mathbf{z}$ [m]}','interpreter','latex','FontSize',16);
    
    % Velocidade
    subplot(3,1,2)
    plot(out2.t(end),out2.velocidade(end),'r*',MarkerSize=10); hold on;
    plot(out2.t, out2.velocidade, LineStyle='-', LineWidth=1.5,Color=	"#0072BD"); hold on
    plot(out2.t(25:38), out2.velocidade(25:38), LineStyle='--', LineWidth=1.9); 
    grid(), grid minor;
    ylim([-15 20]);xlim([0 16]);

    xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
    ylabel('\textbf{$\mathbf{v_z}$ [ms$^{-1}$]}','interpreter','latex','FontSize',16);

    legend({'','','\textbf{Velocidade Terminal}'}, ...
            'Interpreter', 'latex', 'Location','best');
    
    % Aceleracao
    subplot(3,1,3)
    plot(out2.t(end),out2.forca(end),'r*',MarkerSize=10); hold on;
    plot(out2.t,out2.forca, LineStyle='-', LineWidth=1.5,Color=	"#0072BD"); hold on;
    plot(out2.t(25:38), out2.forca(25:38), LineStyle='--', LineWidth=1.9); 
    grid(), grid minor;
    ylim([-20 1.5]);xlim([0 16]);

    xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
    ylabel('\textbf{$\mathbf{a}$ [ms$^{-2}$]}','interpreter','latex','FontSize',16);

    legend({'','','\textbf{Zona de Acelera\c{c}\~ao nula}'}, ...
            'Interpreter', 'latex', 'Location','best');
end
%% Compare 
function Compare(out1,out2)

    figure(1);
    plot(out2.t, out2.Altura, LineStyle='-', LineWidth=2);
    hold on;
    plot(out1.t, out1.Altura, LineStyle='--', LineWidth=1,Color="#7E2F8E");
    hold off
    
    ylim([-0.1 22]);

    title('\textbf{Compara\c{c}\~ao das trajet\''orias Com e Sem Atrito}','FontSize',16,'Interpreter', 'latex');

    xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
    ylabel('\textbf{$\mathbf{z}$ [m]}','interpreter','latex','FontSize',16);
    
    legend({'\textbf{Com Atrito Viscoso}','\textbf{Sem Atrito Viscoso}'}, ...
            'Interpreter', 'latex', 'Location','best');
end




                             