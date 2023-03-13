%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/1/2023

lp = [1 10];
gain_lp = [10 2];
 
hp = [];
gain_hp = [];

lp_hp = [];
gain_lp_hp = [];

rlc = [];
gain_rlc = [];
rlc_elements = [1 1 1];

equalizer_final("violin_w_siren.wav", lp, gain_lp, hp, gain_hp, lp_hp, gain_lp_hp, rlc, gain_rlc,rlc_elements,true)


%%

[music,fs_music] = audioread("blue_in_green_with_siren.wav");

sound(music,fs_music);

%%
[u,t] = gensig("square",4,12);