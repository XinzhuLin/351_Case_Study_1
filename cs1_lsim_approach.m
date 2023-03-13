%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/1/2023




%%

[music,fs_music] = audioread("blue_in_green_with_siren.wav");

sound(music,fs_music);

%%
[u,t] = gensig("square",4,12);