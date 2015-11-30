close all;
clear all;
clc;



a=1;
b=0;
w=pi/5;
p=0;

init_x_p=-9.9;
init_x_p_dot=1;






simtime=10.0;
sim 'abg_x_p1.slx'


%plotting
figure(1)
subplot(3,1,1)
plot(sim_abg_x_p.time, sim_abg_x_p.signals.values)
subplot(3,1,2)
plot(sim_abg_x_p_dot.time, sim_abg_x_p_dot.signals.values)
subplot(3,1,3)
plot(sim_abg_x_p_ddot.time, sim_abg_x_p_ddot.signals.values);


figure(2)
plot(sim_abg_x_p.signals.values,sim_abg_x_p_dot.signals.values);
