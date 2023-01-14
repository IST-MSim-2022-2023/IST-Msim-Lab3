%% P1
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables
V = 0;
K = -0.8;

%% run Sim
out = sim('P1simulink2022a',13);
% 
%% function calls
% 
Tm = Plot();
PhasePortrait(out)
% 
plotBolaSaltitante(out);
% 
CoefVelocity();

%% ---- variação do coeficiente de restituição ----%
fig = figure(2);
set(gcf, 'Position',  [100, 100, 680, 500])
colorVector = ["#2EC4B6","#00B2CC","#009BD9","#3480D3"];
legendName = ["$\alpha = 0.9$","$\alpha = 0.8$","$\alpha = 0.7$","$\alpha = 0.6$"];
i = 1.5;
k = 1;
for K = [0.9 0.8 0.7 0.6]
    K = -K;
    if(K == -0.9)
        out = sim('P1simulink2022a',28);
    else
        out = sim('P1simulink2022a',14);
    end

    [zeno, index] = TZeno(0,-K,out);
    subplot(2,2,k);
    plot(out.t(1:index), out.Altura(1:index), LineWidth=i, Color=colorVector(k));hold on;
    plot(zeno,0,'r*',MarkerSize=10); hold off;
    legend(legendName(k),'FontSize',10,'Interpreter', 'latex')
    i = i + 0.5;
    k = k + 1;
    grid minor;
end

% Give common xlabel, ylabel and title to your figure
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'$\mathbf{z}$ \textbf{[m]}','FontSize',16,'Interpreter', 'latex');
xlabel(han,'$\mathbf{t}$ \textbf{[s]}','FontSize',16,'Interpreter', 'latex');

%% ---- variação da velocidade inicial ----%
K = -0.8;

fig = figure(5);
set(gcf, 'Position',  [100, 100, 680, 500]) 
colorVector = ["#5AA4FF","#7B8FE6","#8D7AC9","#9566AB"];
legendName = ["$v_{z_0} = -10$ ms$^{-1}$","$v_{z_0} = -1.56714$ ms$^{-1}$","$v_{z_0} = 0$ ms$^{-1}$","$v_{z_0} = 10$ ms$^{-1}$"];
k = 1;
for V = [-10 -1.56714 0 10]
    out = sim('P1simulink2022a',17);
    subplot(2,2,k);
    [zeno, index] = TZeno(V,0.8,out);
    plot(out.t(1:index), out.Altura(1:index), LineWidth=2.0, Color=colorVector(k));hold on;
    plot(zeno,0,'r*',MarkerSize=10); hold off;
    legend(legendName(k),'FontSize',10,'Interpreter', 'latex')
    k = k + 1;
    grid minor;
    xlim([0, 20]);
    ylim([0 15.5]);
end

% Give common xlabel, ylabel and title to your figure
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'$\mathbf{z}$ \textbf{[m]}','FontSize',16,'Interpreter', 'latex');
xlabel(han,'$\mathbf{t}$ \textbf{[s]}','FontSize',16,'Interpreter', 'latex');

%-----------------------------------%

%% Plot sistema completo
function plotBolaSaltitante(out)
    % Plot
    figure(1);
    set(gcf, 'Position',  [100, 100, 680, 500])
    %plot Hight
    subplot(2,1,1);
    
    %plot marker of Zeno's
    [zeno, index] = TZeno(0,0.8,out);
    hold on; plot(zeno,0,'r*',MarkerSize=10)
    xlim([0 14]);
    
    title('\textbf{Simula\c{c}\~ao do sistema:} \textbf{Bola saltitante}','FontSize',16,'Interpreter', 'latex');
    
    plot(out.t(1:index), out.Altura(1:index), LineStyle='-', LineWidth=1.5,Color=	"#0072BD");
    grid(), grid minor;
    
    xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
    ylabel('\textbf{$\mathbf{z}$ [m]}','interpreter','latex','FontSize',16);
    
    legend({'Marcador de Zeno',}, ...
            'Interpreter', 'latex', 'Location','best');
    
    %plot Velocity
    subplot(2,1,2)
    
    %plot marker of Zeno's
    hold on; plot(zeno,0,'r*', MarkerSize=10)
    xlim([0 14]);
    
    plot(out.t(1:index), out.velocidade(1:index), LineStyle='-', LineWidth=1.5,Color=	"#0072BD");
    grid(), grid minor;
    
    xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
    ylabel('\textbf{$\mathbf{v_z}$ [ms$^{-1}]$}','interpreter','latex','FontSize',16);
    
    legend({'Marcador de Zeno',}, ...
            'Interpreter', 'latex', 'Location','best');
end
%% Phase P
function PhasePortrait(out)

    %quiver
    g = 9.81;

    [X,Y] = meshgrid(0:2:38,-19:2:19);
    xTresh = 0.1;
    yTresh = -0.1;
    U = Y;
    V = zeros(length(U),length(U)) -g;
    
    xacceptIndex = X >= xTresh;
    yacceptIndex = Y >= yTresh;

    figure(3)
    
    title('\textbf{Jump e Flow set (Bola Saltitante)}','FontSize',16,'Interpreter', 'latex');

    set(gcf, 'Position',  [100, 100, 680, 500])
    set(groot,'defaultAxesTickLabelInterpreter','latex');

    x = [-21 21 21 -21]; y = [0 0 25 25];
    patch(x,y,[0,0,0,0],[0 0 0 0], FaceColor="#D3D5D4",FaceAlpha=0.2); hold on;

    plot(out.velocidade, out.Altura, LineStyle='-', LineWidth=2,Color="#2EC4B6"); hold on;
    quiver(Y(yacceptIndex),X(yacceptIndex),V(yacceptIndex),U(yacceptIndex),LineWidth=0.01, Color = "#5AA4FF"); hold on;
    quiver(Y(xacceptIndex),X(xacceptIndex),V(xacceptIndex),U(xacceptIndex),LineWidth=0.01, Color="#5AA4FF"); hold on;

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
%% coef&Velocity graph
function CoefVelocity()

    %----- coeficiente -----%
    i = 1;

    % initial height
    z_0 = 10;
    g = 9.81;
    
    % first impact
    T1 = sqrt(2*z_0/g);
 
    % coef range
    aRange = 0:0.001:0.999;
    T = zeros(1,length(aRange));
    
    for a = aRange
        T(i) = T1*((2/(1-a))-1);
        i = i + 1;
    end

    figure(4);
    set(groot,'defaultAxesTickLabelInterpreter','latex');

    plot(aRange,T,Color = "#4DCCBD",LineWidth = 1.5); hold on;
    plot(aRange(801),T(801),'-o', Color = "#2374AB",MarkerFaceColor="#2374AB",MarkerSize=10); hold off
    ylim([0 60]);
    grid, grid minor;

    ylabel('\textbf{$T_\textit{zeno}$}','interpreter','latex','FontSize',16)
    xlabel('\textbf{$\alpha$}','interpreter','latex','FontSize',16);


    %----- velocidade -----%
    
    i = 1;
    vz0Rnge = -10:0.1:10;
    T = zeros(1,length(vz0Rnge));
    for v0 = vz0Rnge
        T(i) = v0/g + sqrt((v0^2+2*g*z_0)/g^2)*((1+0.8)/(1-0.8));
        i = i + 1;
    end

    plot(vz0Rnge,T,Color = "#4DCCBD",LineWidth = 1.5); hold on
    plot(vz0Rnge(101),T(101),'-o', Color = "#2374AB",MarkerFaceColor="#2374AB",MarkerSize=10); hold off

    ylabel('$T_\textit{zeno}$','interpreter','latex','FontSize',16)
    xlabel('$v_{z_0}$','interpreter','latex','FontSize',16);
    grid; grid minor;
end
%% 3dPlot
function fc = Plot()
g = 9.81;
a = 0.8;
z_0 = 10;

set(gcf, 'Position',  [100, 100, 680, 500]);

t=@(x,y) 1/g*(y + sqrt(2*g*z_0+y.^2).*((1+x)./(1-x)));
tDerivative = @(x,y) 1/g*(y./(sqrt(2*g*z_0+y.^2)).*((1+x)./(1-x))+1);
Vmini = @(x) -sqrt((g*z_0*(1-x).^2)./(2*x));

x = 0:0.05:0.9;  
y = -30:2:30;

figure(8);
plot(x,Vmini(x));
xlim([0,1]);

figure(6);
[X, Y] = meshgrid(x, y);
colormap("cool");
s = surfl(X, Y, t(X,Y));

zlabel("$T_{Zeno}$ [s]",'interpreter','latex','FontSize',16)
ylabel("$v_{z_0}$ [ms$^{-1}$]",'interpreter','latex','FontSize',16)
xlabel("$\alpha$",'interpreter','latex','FontSize',16)

figure(7)

fc = fcontour(tDerivative,LineWidth=2);
fc.LevelList = [0,0];
xlim([0,1]);
ylim([-30,30]);
grid; grid minor;

ylabel("$v_{z_0}$ [ms$^{-1}$]",'interpreter','latex','FontSize',16)
xlabel("$\alpha$",'interpreter','latex','FontSize',16)

end
%% Zeno limit
function [zeno, index] = TZeno(V,alpha,out)
    z_0 = 10; g = 9.81;

    t=@(x,y) 1/g*(y + sqrt(2*g*z_0+y^2)*((1+x)/(1-x)));

    zeno = t(alpha,V);
    
    indexArray = find(out.t<=zeno);
    index = indexArray(end);
end