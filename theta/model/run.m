close all;
clear all;
clc;

init_state = [-5;pi];
init_state_dot = [0;5];


w=pi/5;
simtime=20;
sim 'p_c.slx'


out=[sim_state.time(:) sim_state.signals.values(:,1) sim_state.signals.values(:,2)];
fileID = fopen('sim_pc_visual.dat','w');
formatSpec = '%d %d %d\n';
for sample = 1:length(sim_state.time)
    fprintf(fileID, formatSpec, out(sample,:));
end
fclose(fileID);


figure(1)
subplot(4,1,1)
plot(sim_abg_theta.time, sim_abg_theta.signals.values)
hold on
title('$\theta$','Interpreter','latex')
subplot(4,1,2)
plot(sim_abg_theta_dot.time, sim_abg_theta_dot.signals.values)
hold on
title('$  \dot{ \bf \theta}$','Interpreter','latex')
subplot(4,1,3)
plot(sim_abg_theta_ddot.time, sim_abg_theta_ddot.signals.values)
hold on
title(' \bf $\ddot{\theta}$','Interpreter','latex')
subplot(4,1,4)
plot(u.time, u.signals.values)
hold on
title('u')

figure(2)
path_plot_x_p=sim_state.signals.values(:,1)+sin(sim_state.signals.values(:,2));
path_plot_y_p=cos(sim_state.signals.values(:,2));
plot(path_plot_x_p, path_plot_y_p);
hold on
x_p_path=-5:0.01:4;
y_p_path=cos(3*x_p_path);
plot(x_p_path,y_p_path,'r');
xlabel('$x_{p}$','Interpreter','latex')
ylabel('$y_{p}$','Interpreter','latex')






