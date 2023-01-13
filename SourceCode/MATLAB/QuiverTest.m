g = 9.81;

[X,Y] = meshgrid(0:2:38,-19:2:19);
xTresh = 0.1;
yTresh = -0.1;
U = Y;
V = zeros(length(U),length(U)) -g;

xacceptIndex = X >= xTresh;
yacceptIndex = Y >= yTresh;

quiver(Y(yacceptIndex),X(yacceptIndex),V(yacceptIndex),U(yacceptIndex),LineWidth=0.01, Color = 'b'); hold on;
quiver(Y(xacceptIndex),X(xacceptIndex),V(xacceptIndex),U(xacceptIndex),LineWidth=0.01, Color='b');

ylim([-4 13]); xlim([-20 20]);