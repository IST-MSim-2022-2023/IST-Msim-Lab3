%% P1
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables
Altura = 10;
V = 15;
K = -0.8;

%% run Sim
out = sim('P4simulink2022a',172);

%%
k = 1;
for i = 1:1:length(out.Altura)
    if(out.y(i)<=0 || out.y(i)>=2)
        indexArray(k) = i;
        k = k+1;
    end
end

figure(1);
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(gcf, 'Position',  [100, 100, 680, 500])

for i = 1:1:(length(indexArray)-1)
    plot([out.t(indexArray(i)) out.t(indexArray(i+1))],[i-1 i-1], LineWidth=2, Color="#2EC4B6"); hold on;
    plot(out.t(indexArray(i)),i-1,'o',MarkerSize=5,MarkerFaceColor="#2EC4B6", MarkerEdgeColor="#2EC4B6"); hold on;
    plot(out.t(indexArray(i+1)),i-1,'o',MarkerSize=5,MarkerFaceColor="#2EC4B6", MarkerEdgeColor="#2EC4B6"); hold on;
end
hold off

for i = 1:1:length(indexArray)
    Ticks(i) = out.t(indexArray(i));
end

xticks(Ticks);
xticklabels({'$t_0$','','','','','','','', ...
    '','','$t_{final}$'});

ylabel("\textbf{\textit{Jump}}",'interpreter','latex','FontSize',16);
xlabel("\textbf{t [m]}",'interpreter','latex','FontSize',16)

grid; 
ylim([-0.3 10]);
xlim([-5 180])
%%

figure(2);
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(gcf, 'Position',  [100, 100, 680, 500])

indexArray = find(out.Altura==0);

plot([0 out.t(indexArray(1))],[0 0], LineWidth=2, Color="#2EC4B6"); hold on;
plot(0,0,'o',MarkerSize=5,MarkerFaceColor="#2EC4B6", MarkerEdgeColor="#2EC4B6"); hold on;
plot(out.t(indexArray(1)),0,'o',MarkerSize=5,MarkerFaceColor="#2EC4B6", MarkerEdgeColor="#2EC4B6"); hold on;

for i = 2:1:(length(indexArray)-1)
    plot([out.t(indexArray(i)) out.t(indexArray(i+1))],[i-1 i-1], LineWidth=2, Color="#2EC4B6"); hold on;
    plot(out.t(indexArray(i)),i-1,'o',MarkerSize=5,MarkerFaceColor="#2EC4B6", MarkerEdgeColor="#2EC4B6"); hold on;
    plot(out.t(indexArray(i+1)),i-1,'o',MarkerSize=5,MarkerFaceColor="#2EC4B6", MarkerEdgeColor="#2EC4B6"); hold on;
end
%xline()
hold off

Ticks(1) = 0;

for i = 2:1:length(indexArray)
    if(out.t(indexArray(i))>=20.34)
        break;
    end
    Ticks(i) = out.t(indexArray(i));
end

xticks(Ticks);
yticks([0,1,2,3,4,5,6,7,8,9,10,11]);
xticklabels({'$t_0$','','','','','','','', ...
    '','','','','','','','','','$T_{Zeno}$'});

xtickangle(0)

ylabel("\textbf{\textit{Jump}}",'interpreter','latex','FontSize',16);
xlabel("\textbf{t [m]}",'interpreter','latex','FontSize',16)

grid; 
ylim([-0.3 11.5]);
xlim([-0.3 21])







