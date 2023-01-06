%% P1
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables
V = 0;
K = -0;
n = 1;
%% run Sim
out = sim('P1simulink2022a',20);

%% function calls

PhasePortrait(out)

plotBolaSaltitante(out);

figure(2);
for K = [0.6 0.7 0.8 0.9]
    K = -K;
    out = sim('P1simulink2022a',8);
    plot(out.t, out.Altura);
    hold on
end
hold off;

% for K = 0:0.1:1
%     K = -K;
%     coef = sim('P1simulink2022a',20);
%     impact(n) = CoefficientOfRestitutionV(coef);
%     n = n + 1;
% end
% 
% plotFittedCurve(impact)

%% Plot sistema completo
function plotBolaSaltitante(out)
    % Plot
    figure(1);
    set(gcf, 'Position',  [100, 100, 680, 500])
    %plot Hight
    subplot(2,1,1);
    
    %plot marker of Zeno's
    hold on; plot(out.t(end),out.Altura(end),'r*',MarkerSize=10)
    xlim([0 13]);
    
    title('\textbf{Simula\c{c}\~ao do sistema:} \textbf{Bola saltitante}','FontSize',16,'Interpreter', 'latex');
    
    plot(out.t, out.Altura, LineStyle='-', LineWidth=1.5,Color=	"#0072BD");
    grid(), grid minor;
    
    xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
    ylabel('\textbf{$\mathbf{z}$ [m]}','interpreter','latex','FontSize',16);
    
    legend({'Marcador de Zeno',}, ...
            'Interpreter', 'latex', 'Location','best');
    
    %plot Velocity
    subplot(2,1,2)
    
    %plot marker of Zeno's
    hold on; plot(out.t(end),out.velocidade(end),'r*', MarkerSize=10)
    xlim([0 13]);
    
    plot(out.t, out.velocidade, LineStyle='-', LineWidth=1.5,Color=	"#0072BD");
    grid(), grid minor;
    
    xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
    ylabel('\textbf{$\mathbf{v_z}$ [ms$^{-1}]$}','interpreter','latex','FontSize',16);
    
    legend({'Marcador de Zeno',}, ...
            'Interpreter', 'latex', 'Location','best');
end
%% Restituition
% function impact = CoefficientOfRestitutionV(coef)
% 
%     % find first impact
%     for i = 1:15
%          if coef.Altura(i) <= 0
%              break;
%          end
%     end
%        
%     impact = coef.velocidade(i);
% end
% %% Fit
% function plotFittedCurve(impact)
%     figure(2);
%     set(gcf, 'Position',  [100, 100, 680, 500])
%     K = 0:0.1:1;
% 
%     fitobject = fit(impact',K','poly1');
%     fig=plot(fitobject,'-');
%      set(fig,'lineWidth',1);
%      %.................. ^
%      hold on;
%      plot(impact,K,'.','MarkerSize',12);
%      set(gca, 'ydir', 'reverse')
%      grid(); grid minor;
%      legend({'fitted curve','Velocidade do primeiro impacto',}, ...
%             'Interpreter', 'latex', 'Location','best');
% 
%     xlabel('\textbf{velocidade ap\''os primeiro impacto [ms$^{-1}$]}','interpreter','latex','FontSize',12)
%     ylabel('\textbf{Coeficiente de Restitui\c{c}\~ao}','interpreter','latex','FontSize',12);
% end
%% Phase P
function PhasePortrait(out)
    figure(3)
    
    title('\textbf{Jump e Flow set (Bola Saltitante)}','FontSize',16,'Interpreter', 'latex');

    set(gcf, 'Position',  [100, 100, 680, 500])
    set(groot,'defaultAxesTickLabelInterpreter','latex');

    x = [-21 21 21 -21]; y = [0 0 25 25];
    patch(x,y,[0,0,0,0],[0 0 0 0], FaceColor="#D3D5D4",FaceAlpha=0.2); hold on;

    plot(out.velocidade, out.Altura, LineStyle='-', LineWidth=2,Color="#2EC4B6");

    % markers
    plot(-14,0,'ko','MarkerFaceColor','#4C8577'); plot(0,0,'ko','MarkerFaceColor','#4C8577');
    %plot(-5.74,0,'kv','MarkerFaceColor','#A6ECE0'); plot(4.6,0,'kv','MarkerFaceColor','#A6ECE0');
    hold off;

    ylim([-4 13]); xlim([-20 20]);

    yticks([10]);
    yticklabels({'$\mathbf{z_0}$'});

    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    h=gca; h.XAxis.TickLength = [0 0];
    h=gca; h.YAxis.TickLength = [0 0];
    
    % adjust ticklabels away from axes
    a=gca;
    a.YRuler.TickLabelGapOffset = -17;    % negative numbers move the ticklabels right (negative -> left)

    xticks([-14 0.7]);
    xticklabels({'$\mathbf{v_z(t_1)}$','$\mathbf{0}$'});
end
