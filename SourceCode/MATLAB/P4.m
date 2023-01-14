%% P4
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables

%init
Altura = 10;
V = 0;
K = -0.8;

%% run Sim
out = sim("P4simulink2022a", 20); %8.5

%% Plot
figure(1);
set(gcf, 'Position',  [100, 100, 680, 500])
plot(out.y,out.Altura,LineStyle='--', LineWidth=1.5, Color="#745296"); hold on

plot(out.y(end),out.Altura(end),'-o', LineWidth=3.5, Color="#D1B1CB", MarkerFaceColor="#D1B1CB"); hold on

xline(0, '-', 'Parede 1', 'interpreter','latex', 'LineWidth',2,'FontSize',9,"Color","#252323"); 
hold on
xline(5, '-', 'Parede 2', 'interpreter','latex', 'LineWidth',2,'FontSize',9,"Color","#252323"); 
hold off

xlabel('\textbf{$\mathbf{y}$ [m]}','interpreter','latex','FontSize',16)
ylabel('\textbf{$\mathbf{z}$ [m]}','interpreter','latex','FontSize',16);

%% Plot animated

figure(2)

xlabel('\textbf{$\mathbf{y}$ [m]}','interpreter','latex','FontSize',16)
ylabel('\textbf{$\mathbf{z}$ [m]}','interpreter','latex','FontSize',16);

xline(0, '-', 'Parede 1', 'interpreter','latex', 'LineWidth',2,'FontSize',9,"Color","#252323"); 
hold on
xline(5, '-', 'Parede 2', 'interpreter','latex', 'LineWidth',2,'FontSize',9,"Color","#252323"); 
hold on

Tfinal=20;
axis([-1 6 0 60])
hold on
p1 = plot(out.y(1),out.Altura(1),'-o', ...
    'EraseMode','background','MarkerSize',10,...
    'MarkerEdgeColor',"#D1B1CB",'MarkerFaceColor',"#D1B1CB");

curve=animatedline("Color","#745296","LineStyle","--","LineWidth",1.5);

set(gca,'Xlim',[-1 6])
for ii=2:length(out.y)

    set(p1,'XData',out.y(ii),'YData',out.Altura(ii));
    addpoints(curve,out.y(ii),out.Altura(ii));
    drawnow
    pause(0.03)
    
     frame = getframe(gcf); 
     exportgraphics(gcf,'testAnimated.gif','Append',true);
end
hold off

%% plot subplots

figure(3)
set(gcf, 'Position',  [100, 100, 680, 500])

subplot(2,1,1)
plot(out.t,out.y, Color="#2C73D2", LineWidth=1.5);

xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
ylabel('\textbf{$\mathbf{y}$ [m]}','interpreter','latex','FontSize',16);

xlim([0 11.7]);
grid on; grid minor;

subplot(2,1,2)
plot(out.t,out.vy,Color="#2C73D2",LineWidth=1.5);

xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
ylabel('\textbf{$\mathbf{v_y}$ [ms$^{-1}$]}','interpreter','latex','FontSize',16);

xlim([0 11.7]);
grid on; grid minor;


figure(4)
set(gcf, 'Position',  [100, 100, 680, 500])

subplot(2,1,1)
plot(out.t,out.Altura, Color="#2C73D2", LineWidth=1.5);

xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
ylabel('\textbf{$\mathbf{z}$ [m]}','interpreter','latex','FontSize',16);

xlim([0 11.7]);
grid on; grid minor;

subplot(2,1,2)
plot(out.t,out.velocidade,Color="#2C73D2",LineWidth=1.5);

xlabel('\textbf{$\mathbf{t}$ [s]}','interpreter','latex','FontSize',16)
ylabel('\textbf{$\mathbf{v_z}$ [ms$^{-1}$]}','interpreter','latex','FontSize',16);

xlim([0 11.7]);
grid on; grid minor;

