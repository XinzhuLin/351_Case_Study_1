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
% frequency of 800 hertz with a gain of 5.

% The volume parameter adds an additional gain to all of the filters
% in case the combination of the filters brings the volume of the speaker
% down too drastically.

% The boolean parameter at the end of the function determines whether the
% user would like the associated plots with their code

lp = {};
gain_lp = {};
 
hp = {800};
gain_hp = {5};

lp_hp = {};
gain_lp_hp = {};

rlc_elements = {};
gain_rlc = {};

volume = [100];
plotting = false;
spectogram = [];

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 1B: Bass Boost Example

% The same approach would be used to implement a low pass filter in the
% code. In the following example, we have implemented a low pass filter
% with a cutoff frequency of 500 hertz and a gain of 2.

lp = {[500*ones(1)]};
gain_lp = {[2*length(lp{1})]};
 
hp = {};
gain_hp = {};

lp_hp = {};
gain_lp_hp = {};

rlc_elements = {};
gain_rlc = {};

volume = [1];
plotting = false;
spectogram = [];

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 1C: Unity Boost Example

% To amplify a signal frequency, we can implement a low pass and a high
% pass filter with the same cutoff frequency and add a gain.

lp = {};
gain_lp = {};
 
hp = {};
gain_hp = {};

lp_hp = {[783]};
gain_lp_hp = {[10]};

rlc_elements = {};
gain_rlc = {};

volume = [100];
plotting = true;
spectogram = [];

equalizer_lsim("m-violin-and-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 2A: Processing Giant Steps By John Coltrane

lp = ones(10);
gain_lp = ones(length(lp));
 
hp = {};
gain_hp = {};

lp_hp = {};
gain_lp_hp = {};

rlc_elements = {};
gain_rlc = {};

volume = [1];
plotting = true;
spectogram = [];

equalizer_lsim("m-giant-steps-bass-cut.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 2B: Processing Space Station by Art Farmer

lp = {};
gain_lp = {};
 
hp = {[700.*ones(2)]};
gain_hp = {[1000000.*ones(length(hp))]};

lp_hp = 800.*ones(2);
gain_lp_hp = 1000000.*ones(length(lp_hp));

rlc_elements = {};
gain_rlc = {};

volume = [30];
plotting = true;
spectogram = [];

equalizer_lsim("m-space-station-treble-cut.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 3A: Processing Blue in Green by Miles Davis

lp = {[10000.*ones(10)]};
gain_lp = {[ones(length(lp))]};
 
hp = {};
gain_hp = {};

lp_hp = {};
gain_lp_hp = {};

rlc_elements = {};
gain_rlc = {};

volume = [5];
plotting = true;
spectogram = [];

equalizer_lsim("m-blue-in-green-with-siren.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%% Part 4A: Creative Portion

lp = {[1600.*ones(20)]};
gain_lp = {[ones(length(lp))]};
 
hp = {};
gain_hp = {};

lp_hp = {};
gain_lp_hp = {};

rlc_elements = {};
gain_rlc = {};

volume = [1];
plotting = true;
spectogram = [3200];

equalizer_lsim("m-mr-postman.wav",lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting,spectogram)

%%

[a,b] = audioread("m-mr-postman.wav");

sound(a,b)

spectrogram(a(:,1),3000)

% for index = 15:25
%     figure;
%     spectrogram(a,(index*100))
%     title("Spectrograph " + (index*100))
% end

%%
a = tf(5, [1 5]);

b = 8*a;
c = a^8;

figure;
hold on;
bode(a);
bode(b);
bode(c);
hold off;


%%

s = {[1 2 ], 1, [1 2 5 5]};



%%
if 3 < 5
    disp("hi");
else
    disp("bye")
end



