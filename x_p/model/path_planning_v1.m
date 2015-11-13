clear all
clc


simming = 1;

a=1;
b=0;
p=0;
w=pi/5;

window=[-10 10 -1 1];

init_x_p=-6;
init_x_p_dot=10;






%----alpha, beta, gamma motion generation-------

simtime=0.55;
sim 'abg_x_p1.slx'


%plotting proposed path and alpha on that path
x_p_path=window(1):0.001:window(2);
y_p_path=a*cos(w*x_p_path + p) + b;
y_c_path=0;

figure(1)


subplot(2,1,1)
%the path
plot(x_p_path,y_p_path,'r');
axis(window)
title('path')
xlabel('x_p')
ylabel('y_p')
line([window(1);window(2)],[0;0]);
%config lines
for x_p_iter = window(1):0.5:window(2)
    x_c_path = x_p_iter + sqrt(1-(a*cos(w*x_p_iter + p) + b)^2);
    y_p_path=a*cos(w*x_p_iter + p) + b;
    line([x_p_iter;x_c_path],[y_p_path;y_c_path]);
end

subplot(2,1,2)
alpha_n = 1:length(x_p_path);
for alpha_iter = 1:length(x_p_path);
    alf1(alpha_iter)=alpha1(x_p_path(alpha_iter),a,b,p,w);
end
plot(x_p_path(alpha_n), alf1);
line([x_p_path(1);x_p_path(end)],[0;0],'Color','r');
xlabel('x_p');
ylabel('\boldmath $\alpha(x_p)$','Interpreter','latex');



%plotting simulation of abg with respect to time
figure(2)

subplot(4,1,1) 
plot(sim_abg_x_p.time, sim_abg_x_p.signals.values)
ylabel('\boldmath $x_{p}$','Interpreter','latex')
xlabel('t');

subplot(4,1,2)
plot(sim_abg_x_p_dot.time, sim_abg_x_p_dot.signals.values)
ylabel(' \boldmath $\dot{x}_{p}$','Interpreter','latex')
xlabel('t');

subplot(4,1,3)
plot(sim_abg_x_p_ddot.time, sim_abg_x_p_ddot.signals.values);
ylabel(' \boldmath $\ddot{x}_{p}$','Interpreter','latex')
xlabel('t');

subplot(4,1,4)
for mg = 1:length(sim_abg_x_p.signals.values)
    alf(mg)=alpha1(sim_abg_x_p.signals.values(mg),a,b,p,w);
end
plot(sim_abg_x_p.time, alf);
line([0;simtime],[0;0],'Color','r');
ylabel(' \boldmath $\alpha(t)$','Interpreter','latex');
xlabel('t');



%plotting phaseplot and alpha for simulation
figure(3)

subplot(2,1,1)
plot(sim_abg_x_p.signals.values,sim_abg_x_p_dot.signals.values)
title('\bf phaseplot [\boldmath $x_{p}$, \boldmath $\dot{x_{p}}$ ]','Interpreter','latex')
xlabel('\boldmath $x_{p}$','Interpreter','latex')
ylabel('\boldmath $\dot{x_p}$','Interpreter','latex');
subplot(2,1,2)
plot(sim_abg_x_p.signals.values,alf);
xlabel('\boldmath $x_{p}$','Interpreter','latex')
ylabel('\boldmath $\alpha(x_p)$','Interpreter','latex');
line([min(sim_abg_x_p.signals.values);max(sim_abg_x_p.signals.values)],[0;0],'Color','r');








%-----------------------












%-----run model--------


if simming 


%find initial conditions for model
init_x_c = init_x_p + sqrt(1-(a*cos(w*init_x_p + p) + b)^2)
y_p_init=a*cos(w*init_x_p + p) + b;
init_theta=atan2(init_x_p-init_x_c,y_p_init)

%init_[x_c,theta]
init_state = [init_x_c;init_theta];
init_state_dot = [0;0];

sim 'p_c_v1.slx'

figure(4)
plot(u.time, u.signals.values)
title('u')

%write to file
out=[sim_state.time(:) sim_state.signals.values(:,1) sim_state.signals.values(:,2)];
fileID = fopen('sim_pc_visual.dat','w');
formatSpec = '%d %d %d\n';
for sample = 1:length(sim_state.time)
    fprintf(fileID, formatSpec, out(sample,:));
end
fclose(fileID);

end




