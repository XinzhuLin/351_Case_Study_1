%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/1/2023

%%
clear;
close all;

lp = [100 200];
gain_lp = [5 0];
 
hp = [];
gain_hp = [];

lp_hp = [4000 5000];
gain_lp_hp = [6 3];

rlc = [100];
gain_rlc = 7;
rlc_elements = [1 1 1];

equalizer_final("violin_w_siren.wav", lp, gain_lp, hp, gain_hp, lp_hp, gain_lp_hp, rlc, gain_rlc,rlc_elements,true)




