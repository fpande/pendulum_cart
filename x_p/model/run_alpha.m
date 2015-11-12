clc
clear all
w=pi/5;


x_p = -10:0.1:10;
dust = 1:length(x_p);

for mg = 1:length(x_p);
    alf(mg)=alpha(x_p(mg),w);
end

plot(x_p(dust), alf);
title('$\alpha(x_p)$','Interpreter','latex');
xlabel('x_p');