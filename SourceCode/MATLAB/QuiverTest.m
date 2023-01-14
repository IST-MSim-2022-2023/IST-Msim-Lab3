g = 9.81;

[X,Y] = meshgrid(0:2:38,-19:2:19);
xTresh = 0.1;
yTresh = -0.1;
U = Y;
V = zeros(length(U),length(U)) -g;

xacceptIndex = X >= xTresh;
yacceptIndex = Y >= yTresh;

set(gcf, 'Position',  [100, 100, 600, 480])


quiver(Y,X,V,U,LineWidth=0.01, Color = "#5AA4FF");


h=gca; h.XAxis.TickLength = [0 0];
h=gca; h.YAxis.TickLength = [0 0];
set(gca,'Visible','off');

ylim([-4 13]); xlim([-20 20]);