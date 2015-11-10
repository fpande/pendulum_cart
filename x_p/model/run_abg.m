close all;
clear all;
clc;

a=1;
b=-1.5;
w=0.5;

init_x_p=-5;
init_x_p_dot=0;

simtime=1.8;
sim 'abg_x_p.slx'


%plotting
figure(1)
subplot(3,1,1)
plot(sim_abg_x_p.time, sim_abg_x_p.signals.values)
subplot(3,1,2)
plot(sim_abg_x_p_dot.time, sim_abg_x_p_dot.signals.values)
subplot(3,1,3)
plot(sim_abg_x_p_ddot.time, sim_abg_x_p_ddot.signals.values);
