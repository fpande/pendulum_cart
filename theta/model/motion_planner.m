close all;
clear all;
clc;


init_theta=pi;
init_theta_d=-12;

%[a c w]
motion_parameters=[-20 0.3 3];

simtime=10;


sim motion_generator.slx


%TODO
%need path visulazation with configurations and alpha (a segment may be sufficient)


figure(1)
plot(mg_simout_theta.signals.values, mg_simout_theta_d.signals.values)
title('\bf phaseplot [\boldmath $\theta$, \boldmath $\dot{\theta}$ ]','Interpreter','latex','FontSize',16)
xlabel('\boldmath $\theta$','Interpreter','latex','FontSize',16)
ylabel('\boldmath $\dot{\theta}$','Interpreter','latex','FontSize',16);


figure(2)
subplot(4,1,1) 
plot(mg_simout_theta.time, mg_simout_theta.signals.values)
ylabel('\boldmath $\theta$','Interpreter','latex','FontSize',16)
xlabel('t','FontSize',16);

subplot(4,1,2)
plot(mg_simout_theta_d.time, mg_simout_theta_d.signals.values)
ylabel(' \boldmath $\dot{\theta}$','Interpreter','latex','FontSize',16)
xlabel('t','FontSize',16);

subplot(4,1,3)
plot(mg_simout_theta_dd.time, mg_simout_theta_dd.signals.values);
ylabel(' \boldmath $\ddot{\theta}$','Interpreter','latex','FontSize',16)
xlabel('t','FontSize',16);

subplot(4,1,4)
plot(mg_simout_u.time, mg_simout_u.signals.values);
ylabel(' \boldmath $u$','Interpreter','latex','FontSize',16)
xlabel('t','FontSize',16);


















