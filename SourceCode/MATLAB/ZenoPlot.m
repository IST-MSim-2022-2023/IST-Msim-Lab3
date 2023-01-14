%% P1
%% clear->erase workspace variables, clc->clean command window, close all-> close all currently open figures
clear; clc; close all;

%% variables
Altura = 10;
V = 0;
K = -0.8;

%% run Sim
out = sim('P4simulink2022a',10000);

%%
k = 1;
for i = 1:1:1245
    if(out.y(i)<=0 || out.y(i)>=2)
        indexArray(k) = i;
        k = k+1;
    end
end

for i = 1:1:(length(indexArray)-1)
    plot([out.t(indexArray(i)) out.t(indexArray(i+1))],[i i], LineWidth=2, Color="#2EC4B6"); hold on;
end

% 
% [zeno,~] = TZeno(V,-K,out);
%  xline(zeno, Color='r'); hold off;
% 
% %% Zeno limit
% function [zeno, index] = TZeno(V,alpha,out)
%     z_0 = 10; g = 9.81;
% 
%     t=@(x,y) 1/g*(y + sqrt(2*g*z_0+y^2)*((1+x)/(1-x)));
% 
%     zeno = t(alpha,V);
%     
%     indexArray = find(out.t<=zeno);
%     index = indexArray(end);
%end


