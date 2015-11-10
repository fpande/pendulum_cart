close all;
clear all;
clc;

init_state = [-5;0.6*pi];
init_state_dot = [0;0];
a=0.4;
w=pi/5;

simtime=12;
sim 'p_c.slx'


out=[sim_state.time(:) sim_state.signals.values(:,1) sim_state.signals.values(:,2)];

fileID = fopen('sim_pc_visual.dat','w');
formatSpec = '%d %d %d\n';
for sample = 1:length(sim_state.time)
    fprintf(fileID, formatSpec, out(sample,:));
end
fclose(fileID);

