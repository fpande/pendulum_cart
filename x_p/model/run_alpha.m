clc
clear all
close all




a=0.5;
b=0;
p=-2.5;
w=pi/10;

x_p = -20:0.001:20;
dust = 1:length(x_p);

for mg = 1:length(x_p);
    alf1(mg)=alpha1(x_p(mg),a,b,p,w);
    alf2(mg)=alpha2(x_p(mg),a,b,p,w);
end


subplot(2,1,1)
plot(x_p(dust), alf1);
line([x_p(1);x_p(end)],[0;0],'Color','r');
title('version 1 (+)')
xlabel('x_p');
ylabel('\alpha')



subplot(2,1,2)
plot(x_p(dust), alf2);
title('version 2 (-)')
line([x_p(1);x_p(end)],[0;0],'Color','r');
xlabel('x_p');
ylabel('\alpha')




