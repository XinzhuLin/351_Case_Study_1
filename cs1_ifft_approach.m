%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

%%
clear;
close all;

lp = [100];
gain_lp = [5];
 
hp = [];
gain_hp = [];

lp_hp = [];
gain_lp_hp = [];

rlc = [];
gain_rlc = [];
rlc_elements = [1 1 1];

equalizer_ifft("violin-and-siren.wav", lp, gain_lp, hp, gain_hp, lp_hp, gain_lp_hp, rlc, gain_rlc,rlc_elements,true)

