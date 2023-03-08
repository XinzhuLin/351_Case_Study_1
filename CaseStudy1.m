%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/1/2023

%%
clear;
close all;

%% Part 1A - Treble Equalizer

gain = [1 1 1 1 1 1];
frequencies = [391.995 783.991 1567.982 3135.963 6271.927 12543.854];
equalizer("violin_w_siren.wav", gain, frequencies, false);

%% Part 1A - Treble Equalizer

gain = [1 1 1 1 1 1];
frequencies = [391.995 783.991 1567.982 3135.963 6271.927 12543.854];
equalizer("violin_w_siren.wav", gain, frequencies, false);


%% Testing
[music, Fs] = audioread("violin_w_siren.wav");
frequencies = fft(music);
new_music = ifft(frequencies);
new_music = abs(new_music);
%%
sound(music, Fs);
%%
sound(new_music,Fs);
%%

clear;
close all;

lp = [100];
gain_lp = [5];

hp = [];
gain_hp = [];

lp_hp = [];
gain_lp_hp = [];

rlc = [100];
gain_rlc = 7;
rlc_elements = [1 1 1];

equalizer_final("violin_w_siren.wav", lp, gain_lp, hp, gain_hp, lp_hp, gain_lp_hp, rlc, gain_rlc,rlc_elements,true)





