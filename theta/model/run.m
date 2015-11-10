close all;
clear all;
clc;

init_state = [-5;0.6*pi];
init_state_dot = [0;0];


a=0.4;
w=pi/5;
simtime=12;
sim 'p_c.slx'

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


a=0.4;
w=pi/10;
sim 'p_c.slx'


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

a=0.4;
w=pi/50;
sim 'p_c.slx'


subplot(4,1,1)
plot(sim_abg_theta.time, sim_abg_theta.signals.values)
hold on
title('$\theta$','Interpreter','latex')
legend('w=\pi/5', 'w=\pi/10','w=\pi/50')
subplot(4,1,2)
plot(sim_abg_theta_dot.time, sim_abg_theta_dot.signals.values)
hold on
title('$  \dot{ \bf \theta}$','Interpreter','latex')
legend('w=\pi/5', 'w=\pi/10','w=\pi/50')
subplot(4,1,3)
plot(sim_abg_theta_ddot.time, sim_abg_theta_ddot.signals.values)
hold on
title(' \bf $\ddot{\theta}$','Interpreter','latex')
legend('w=\pi/5', 'w=\pi/10','w=\pi/50')
subplot(4,1,4)
plot(u.time, u.signals.values)
hold on
title('u')
legend('w=\pi/5', 'w=\pi/10','w=\pi/50')








figure(2)

simtime=4;
a=0.4;
w=pi/5;
sim 'p_c.slx'
subplot(3,1,1)
path_plot_x_p=sim_state.signals.values(:,1)+sin(sim_state.signals.values(:,2));
path_plot_y_p=cos(sim_state.signals.values(:,2));
plot(path_plot_x_p, path_plot_y_p);
title('w=\pi/5')
xlabel('$x_{p}$','Interpreter','latex')
ylabel('$y_{p}$','Interpreter','latex')


a=0.4;
w=pi/10;
sim 'p_c.slx'
subplot(3,1,2)
path_plot_x_p=sim_state.signals.values(:,1)+sin(sim_state.signals.values(:,2));
path_plot_y_p=cos(sim_state.signals.values(:,2));
plot(path_plot_x_p, path_plot_y_p);
title('w=\pi/10')
xlabel('$x_{p}$','Interpreter','latex')
ylabel('$y_{p}$','Interpreter','latex')


a=0.4;
w=pi/50;
sim 'p_c.slx'
subplot(3,1,3)
path_plot_x_p=sim_state.signals.values(:,1)+sin(sim_state.signals.values(:,2));
path_plot_y_p=cos(sim_state.signals.values(:,2));
plot(path_plot_x_p, path_plot_y_p);
title('w=\pi/50')
xlabel('$x_{p}$','Interpreter','latex')
ylabel('$y_{p}$','Interpreter','latex')








figure(3)
simtime=10;

a=0.4;
w=pi/5;
sim 'p_c.slx'
plot(sim_abg_theta.signals.values,sim_abg_theta_dot.signals.values);
hold on


a=0.4;
w=pi/10;
sim 'p_c.slx'
plot(sim_abg_theta.signals.values,sim_abg_theta_dot.signals.values);


a=0.4;
w=pi/50;
sim 'p_c.slx'
plot(sim_abg_theta.signals.values,sim_abg_theta_dot.signals.values);


xlabel('$\theta$','Interpreter','latex')
ylabel('$\dot{\theta}$','Interpreter','latex')
title('phaseplot')
legend('w=\pi/5', 'w=\pi/10','w=\pi/50')









