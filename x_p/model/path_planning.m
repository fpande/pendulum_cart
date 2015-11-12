clear all;
clc;

a=1;
b=-1.5;
w=pi/5;

y_c=0;

window=[-20 20 -2 2];

init_x_p=-9;
init_x_p_dot=0;

simtime=2;
sim 'abg_x_p.slx'

%plotting
figure(1)
subplot(4,1,1)
plot(sim_abg_x_p.time, sim_abg_x_p.signals.values)
title('$x_{p}$','Interpreter','latex')
subplot(4,1,2)
plot(sim_abg_x_p_dot.time, sim_abg_x_p_dot.signals.values)
title('$\dot{x}_{p}$','Interpreter','latex')
subplot(4,1,3)
plot(sim_abg_x_p_ddot.time, sim_abg_x_p_ddot.signals.values);
title('$\ddot{x}_{p}$','Interpreter','latex')

subplot(4,1,4)
for mg = 1:length(sim_abg_x_p.signals.values)
    alf(mg)=alpha(sim_abg_x_p.signals.values(mg),w);
end
plot(sim_abg_x_p.time, alf);
line([0;simtime],[0;0],'Color','r');
title('$\alpha(x_p)$','Interpreter','latex');
xlabel('x_p');



%creating proposed path 
x=window(1):5/100:window(2);
y=a*cos(w*x);

figure(2)
subplot(2,1,1)
plot(x,y,'r');
axis(window)
title('version1 (+)')
line([window(1);window(2)],[0;0]);


for x_p = window(1):0.5:window(2)
    x_c=x_p + sin((w)*x_p);
    y_p=cos((w)*x_p);
    line([x_p;x_c],[y_p;y_c]);
end

subplot(2,1,2)
plot(x,y,'r');
axis(window)
title('version2 (-)')
line([window(1);window(2)],[0;0]);

for x_p = window(1):0.5:window(2)
    x_c=x_p - sin((w)*x_p);
    y_p=cos((w)*x_p);
    line([x_p;x_c],[y_p;y_c]);
end


figure(3)
subplot(2,1,1)
plot(sim_abg_x_p.signals.values,sim_abg_x_p_dot.signals.values)
subplot(2,1,2)
plot(sim_abg_x_p.signals.values,alf);
line([sim_abg_x_p.signals.values(1);sim_abg_x_p.signals.values(end)],[0;0],'Color','r');



