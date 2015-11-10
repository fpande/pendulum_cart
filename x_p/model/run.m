close all;
clear all;
clc;

%init_[x_c,theta]
init_state = [-5;pi];
init_state_dot = [0;0];

%init x_p
init_x_p=-5;
init_x_p_dot=0;


a=1;
b=-1;
w=0.5;

simtime=2;
init_xp=-5;
init_xp_d=0;
sim 'p_c.slx'


%plotting
figure(1)
subplot(4,1,1)
plot(sim_abg_x_p.time, sim_abg_x_p.signals.values)
title('$x_{p}$','Interpreter','latex')
subplot(4,1,2)
plot(sim_abg_x_p_dot.time, sim_abg_x_p_dot.signals.values)
title('$\dot{x}_{p}$','Interpreter','latex')
subplot(4,1,3)
plot(sim_abg_x_p_ddot.time, sim_abg_x_p_ddot.signals.values)
title('$\ddot{x}_{p}$','Interpreter','latex')
subplot(4,1,4)
plot(u.time, u.signals.values);
title('$u$','Interpreter','latex')


figure(2)
plot(sim_state.signals.values(:,1)+sin(sim_state.signals.values(:,2)), cos(sim_state.signals.values(:,2)))
hold on
plot(sim_state.signals.values(:,1)+sin(sim_state.signals.values(:,2)), tanh(0.5*(sim_state.signals.values(:,1)+sin(sim_state.signals.values(:,2))-b)))
legend('path','desired path','Location','northwest')
xlabel('x_p')
ylabel('y_p')




%write to file



out=[sim_state.time(:) sim_state.signals.values(:,1) sim_state.signals.values(:,2)];

fileID = fopen('sim_pc_visual.dat','w');
formatSpec = '%d %d %d\n';
for sample = 1:length(sim_state.time)
    fprintf(fileID, formatSpec, out(sample,:));
end
fclose(fileID);




