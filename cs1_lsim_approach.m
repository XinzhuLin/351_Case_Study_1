%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

%% Part 0: Reset Matlab

clear;
close all;

%% Part 1A: Treble Boost Example

% Our group has attempted to design our equalizer to be as adaptable and 
% user friendly as possible, though we assume that the user is familiar 
% with signals and systems content. 

% The numbers in the brackets refer to the cutoff frequency of the filter. 
% In our example, we have implemented a high pass filter with a cutoff 
% frequency of 2000 hertz with a gain of 2.

% The volume parameter adds an additional gain to all of the filters
% in case the combination of the filters brings the volume of the speaker
% down too drastically.

% The boolean parameter at the end of the function determines whether the
% user would like the associated plots with their code

lp = [];
gain_lp = [];
 
hp = [1000];
gain_hp = [3];

lp_hp = [];
gain_lp_hp = [];

rlc_elements = [];
gain_rlc = [];

volume = [300];
plotting = true;

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)

%% Part 1B: Bass Boost Example

% The same approach would be used to implement a low pass filter in the
% code. In the following example, we have implemented a low pass filter
% with a cutoff frequency of 100 hertz and a gain of 3.

lp = [100];
gain_lp = [3];
 
hp = [];
gain_hp = [];

lp_hp = [];
gain_lp_hp = [];

rlc_elements = [];
gain_rlc = [];

volume = [2];
plotting = true;

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)

%% Part 1C: Unity Boost Example

% To amplify a signal frequency, we can implement a low pass and a high
% pass filter with the same cutoff frequency and add a gain.

lp = [100];
gain_lp = [5];
 
hp = [500];
gain_hp = [2];

lp_hp = [1500];
gain_lp_hp = [5];

rlc = [];
gain_rlc = [];
rlc_elements = [];

volume = [1000];
plotting = false;

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)

%% Part 1C: Unity Boost Example

% To amplify a signal frequency, we can implement a low pass and a high
% pass filter with the same cutoff frequency and add a gain.

lp = [];
gain_lp = [];
 
hp = [];
gain_hp = [];

lp_hp = [1500];
gain_lp_hp = [5];

rlc = [];
gain_rlc = [];
rlc_elements = [];

volume = [300];
plotting = false;

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)

%% Part 2A: Processing Giant Steps By John Coltrane

lp = [];
gain_lp = [];
 
hp = [];
gain_hp = [];

lp_hp = [];
gain_lp_hp = [];

rlc = [];
gain_rlc = [];
rlc_elements = [];

volume = [];
plotting = true;

equalizer_lsim("m-giant-steps-bass-cut.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)

%% Part 2B: Processing Space Station by Art Farmer

lp = [];
gain_lp = [];
 
hp = [];
gain_hp = [];

lp_hp = [];
gain_lp_hp = [];

rlc = [];
gain_rlc = [];
rlc_elements = [];

volume = [];
plotting = false;

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)

%% Part 2B: Processing Space Station by Art Farmer

lp = [];
gain_lp = [];
 
hp = [];
gain_hp = [];

lp_hp = [];
gain_lp_hp = [];

rlc = [];
gain_rlc = [];
rlc_elements = [];

volume = [];
plotting = false;

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)

%% Part 3A: Processing Blue in Green by Miles Davis

lp = [];
gain_lp = [];
 
hp = [];
gain_hp = [];

lp_hp = [];
gain_lp_hp = [];

rlc = [];
gain_rlc = [];
rlc_elements = [];

volume = [];
plotting = false;

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)

%% Part 4A: Creative Portion

lp = [];
gain_lp = [];
 
hp = [];
gain_hp = [];

lp_hp = [];
gain_lp_hp = [];

rlc = [];
gain_rlc = [];
rlc_elements = [];

volume = [];
plotting = false;

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)
