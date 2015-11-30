clc
clear all
close all



w_1=pi/5;


x_p = -10:0.001:10;
dust = 1:length(x_p);

for mg = 1:length(x_p);
    alf1(mg)=alpha1(x_p(mg),w_1);
    
end


subplot(2,1,1)
plot(x_p(dust), alf1);
line([x_p(1);x_p(end)],[0;0],'Color','r');
title('version 1 (+)')
xlabel('x_p');
ylabel('\alpha')


for mg = 1:length(x_p);
    path1(mg)=path(x_p(mg),w_1); 
end
subplot(2,1,2)
plot(x_p(dust), path1)
line([x_p(1);x_p(end)],[0;0],'Color','r');




