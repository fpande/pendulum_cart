clc
clear all
y_c=0;


a=1;
w=pi/5;

window = [-10 10 -1 1];

%creating proposed path 
x=window(1):5/100:window(2);
y=a*cos(w*x);

figure(1)

subplot(4,1,1)
plot(x,y,'r');
axis(window)
title('version1 (+)')
line([window(1);window(2)],[0;0]);


for x_p = window(1):5/10:window(2)
    x_c=x_p + sin(w*x_p);
    y_p=cos(w*x_p);
    line([x_p;x_c],[y_p;y_c]);
end


x_p = window(1):0.001:window(2);
dust = 1:length(x_p);

for mg = 1:length(x_p);
    alf1(mg)=alpha0_v1(x_p(mg),w);
end

subplot(4,1,2)
plot(x_p(dust), alf1);
line([window(1);window(2)],[0;0],'Color','r');
title('version 1 (+)')
xlabel('x_p');
ylabel('\alpha')











subplot(4,1,3)
plot(x,y,'r');
axis(window)
title('version 2 (-)')
line([window(1);window(2)],[0;0]);


for x_p = window(1):5/10:window(2)
    x_c=x_p - sin(w*x_p);
    y_p=cos(w*x_p);
    line([x_p;x_c],[y_p;y_c]);
end


x_p = window(1):0.001:window(2);
dust = 1:length(x_p);

for mg = 1:length(x_p);
    alf2(mg)=alpha0_v2(x_p(mg),w);
end

subplot(4,1,4)
plot(x_p(dust), alf2);
line([window(1);window(2)],[0;0],'Color','r');
title('version 2 (-)')
xlabel('x_p');
ylabel('\alpha')




%-----run model--------


init_x_p=-5;
init_x_p_dot=1;

%find initial conditions for model
init_x_c = init_x_p + sin(w*init_x_p);
y_p_init=cos(w*init_x_p);
init_theta=atan2(init_x_c-init_x_p,y_p_init)

%init_[x_c,theta]
init_state = [init_x_c;init_theta];
init_state_dot = [0;0];
simtime=1.5;
sim 'p_c0_v2.slx'

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




