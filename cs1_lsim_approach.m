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
% frequency of 800 hertz with a gain of 50.

% The volume parameter adds an additional gain to all of the filters
% in case the combination of the filters brings the volume of the speaker
% down too drastically.

% The boolean parameter at the end of the function determines whether the
% user would like the associated plots with their code

lp = {};
gain_lp = {};

hp = {800};
gain_hp = {50};

lp_hp = {};
gain_lp_hp = {};

rlc_elements = {};
gain_rlc = {};

volume = [1];
plotting = false;
spectogram = [];

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 1B: Bass Boost Example

% The same approach would be used to implement a low pass filter in the
% code. In the following example, we have implemented a low pass filter
% with a cutoff frequency of 500 hertz and a gain of 2.

lp = {[ones(10)]};
gain_lp = {[0.1.*ones(length(lp))]};
 
hp = {};
gain_hp = {};

lp_hp = {};
gain_lp_hp = {};

rlc_elements = {};
gain_rlc = {};

volume = [1];
plotting = false;
spectogram = [2000];

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 1C: Unity Boost Example

% To amplify a signal frequency, we can implement a low pass and a high
% pass filter with the same cutoff frequency and add a gain.

lp = {};
gain_lp = {};
 
hp = {};
gain_hp = {};

lp_hp = {[0.1.*ones(20)]};
gain_lp_hp = {(5*10^5)*[ones(length(lp_hp{1}))]};

rlc_elements = {};
gain_rlc = {};

volume = [1];
plotting = false;
spectogram = [3000];

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 2A: Processing Giant Steps By John Coltrane -- Reducing Extra Noise

lp = {[ones(10)] [2.*ones(10)]};
gain_lp = {[ones(length(lp{1}))] [ones(length(lp{2}))]};

hp = {};
gain_hp = {};

lp_hp = {[1000.*ones(length(2))]};
gain_lp_hp = {[10000.*ones(length(lp_hp{1}))]};

rlc_elements = {[1 1 1] [10 10 10]};
gain_rlc = {[2] [1]};

volume = [1];
plotting = true;
spectogram = [1500];

equalizer_lsim("m-giant-steps-bass-cut.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 2B: Processing Space Station by Art Farmer -- Emphasize the Piano

lp = {[ones(10)] [2.*ones(10)]};
gain_lp = {[ones(length(lp{1}))] [ones(length(lp{2}))]};
 
hp = {[ones(5)]};
gain_hp = {[ones(length(hp))]};

lp_hp = {[0.05.*ones(5)]};
gain_lp_hp = {[(5*10^3)*ones(length(lp_hp))]};

rlc_elements = {{[1 1 1],[3]} [1 1 1]};
gain_rlc = {[1] [2]};

volume = [30];
plotting = true;
spectogram = [2000];

equalizer_lsim("m-space-station-treble-cut.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 3A: Processing Blue in Green by Miles Davis

lp = {[0.002.*ones(1)] [0.001.*ones(1)] [0.0001.*ones(1)]};
gain_lp = {[50.*ones(length(lp{1}))] [10.*ones(length(lp{2}))] [200.*ones(length(lp{3}))]};
 
hp = {};
gain_hp = {};

lp_hp = {[0.05.*ones(5)] [0.025.*ones(5)]};
gain_lp_hp = {[30*ones(length(lp_hp))] [30.*ones(5)]};

rlc_elements = {};
gain_rlc = {};

volume = [1];
plotting = true;
spectogram = [3000];

equalizer_lsim("m-blue-in-green-with-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 4A: Creative Portion -- Mr Postman -- Getting Rid of Claps and Amplifying the Alto

% Youtube Link Here: https://youtu.be/fXgw948RwYs

% Original Strategy
% lp = {[(1/829).*ones(1)] [(1/1140).*ones(1)]};
% gain_lp = {[ones(length(lp{1}))] [ones(length(lp{2}))]};
%  
% hp = {[(1/1657).*ones(1)] [(1/2390).*ones(1)]};
% gain_hp = {[ones(length(hp{1}))] [ones(length(hp{2}))]};
% 
% lp_hp = {[(1/1465).*ones(1)]};
% gain_lp_hp = {[20.*ones(length(lp_hp{1}))]};

lp = {1500 500};
gain_lp = {10 10};

hp = {};
gain_hp = {};

lp_hp = {[0.1.*ones(2)] [0.15.*ones(2)] [0.20.*ones(2)]};
gain_lp_hp = {[50*ones(2)] [ones(2)] [50*ones(2)]};

rlc_elements = {{[1 5 1],[2]}};
gain_rlc = {[0.001]};

volume = [1];
plotting = true;
spectogram = [4000];

equalizer_lsim("m-mr-postman.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)
