
clc
clear all
close all


p_tot=-5.8;

a_1=0.8;
p_1=-p_tot;
w_1=pi/5;

a_2=1;
p_2=0;
w_2=pi/5;


b=-0.2;

x_p = -5.5:0.001:2;
dust = 1:length(x_p);

for mg = 1:length(x_p);
    path1(mg)=path(x_p(mg),a_1,p_1,w_1,a_2,p_2,w_2,b);
    
end
plot(x_p(dust), path1)
line([x_p(1);x_p(end)],[0;0],'Color','r');