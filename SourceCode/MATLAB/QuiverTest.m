g = 9.81;

[X,Y] = meshgrid(0:2:38,-19:2:19);
% xTresh = 0.1;
% yTresh = -0.1;
U = Y;
V = zeros(length(U),length(U)) -g;

set(gcf, 'Position',  [100, 100, 660, 500])

% xacceptIndex = X >= xTresh;
% yacceptIndex = Y >= yTresh;

% quiver(Y(yacceptIndex),X(yacceptIndex),V(yacceptIndex),U(yacceptIndex),LineWidth=0.01, Color = "#5AA4FF"); hold on;
% quiver(Y ,X ,V ,U ,LineWidth=0.01, Color="#5AA4FF"); 

quiver(Y, X, V, U, LineWidth=1.5, Color="#5AA4FF"); 

set(gca,'Visible','off')
h=gca; h.XAxis.TickLength = [0 0];
h=gca; h.YAxis.TickLength = [0 0];

ylim([-4 13]); xlim([-20 20]);