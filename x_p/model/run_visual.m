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



%write to file


out=[sim_state.time(:) sim_state.signals.values(:,1) sim_state.signals.values(:,2)];

fileID = fopen('sim_pc_visual.dat','w');
formatSpec = '%d %d %d\n';
for sample = 1:length(sim_state.time)
    fprintf(fileID, formatSpec, out(sample,:));
end
fclose(fileID);
