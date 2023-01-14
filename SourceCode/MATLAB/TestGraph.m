%% P4 - 3dPlot
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables
Altura = 10;
V = 1;
K = -0.8;

%% run Sim
out = sim('P4simulink2022a',21);
%%
j(1) = 0;

for i = 2:1:length(out.t)
    if out.Altura(i) == 0 || out.vy(i) == -out.vy(i-1)
        j(i) = j(i-1) + 1; 
    else
        j(i) = j(i-1);
    end
end

out.Altura(out.Altura==0) = NaN;

plot3(j,out.y,out.Altura,LineWidth=2, Color="#2C73D2"); hold on;

indexArray = find(isnan(out.Altura));

plot3([0 0], [0 out.y(indexArray(1))], [0 0],LineWidth=2,Color='#845EC2');hold on;
plot3([1 1], [out.y(indexArray(1)) out.y(indexArray(2))], [0 0],LineWidth=2,Color='#845EC2'); hold on
plot3([2 2], [out.y(indexArray(2)) 10], [0 0],LineWidth=2,Color='#845EC2'); hold on
plot3([3 3], [10 out.y(indexArray(3))], [0 0],LineWidth=2,Color='#845EC2'); hold on
plot3([4 4], [out.y(indexArray(3)) out.y(indexArray(4))], [0 0],LineWidth=2,Color='#845EC2'); hold on
plot3([5 5], [out.y(indexArray(4)) out.y(indexArray(5))], [0 0],LineWidth=2,Color='#845EC2'); hold on
plot3([6 6], [out.y(indexArray(5)) out.y(indexArray(6))], [0 0],LineWidth=2,Color='#845EC2'); hold on

xlabel("Jump",'interpreter','latex','FontSize',16);
ylabel("$y$ [m]",'interpreter','latex','FontSize',16)
zlabel("$z$ [m]",'interpreter','latex','FontSize',16);
xlim([0 6]);

grid on;