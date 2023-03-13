%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

function equalizer_lsim(music,lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc,gain_rlc,rlc_elements,volume,plotting)    
    % Part 1: Importing the Sound
    [original_music, fs_music] = audioread(music);
    disp("Successful: Imported Sound")

    % Part 2: Setting Up Parameters for the Impulse Response Bands & Input
    time_vector = 0:(length(original_music)-1);
    sum_of_impulse_responses = length(lp)+length(hp)+length(lp_hp)+length(rlc);
    final_impulse_response_individual = zeros(sum_of_impulse_responses, length(original_music));
    final_music = original_music;
    disp("Successful: Created Parameters")

    % Part 3: Calculate the Impulse Response
    if (~isempty(lp))
        for index = 1:length(lp)
            lp_sys = tf(lp(1,index), [1 lp(1,index)]);
            final_impulse_response_individual(index,:) = gain_lp(1,index).*lsim(lp_sys,original_music,time_vector); 
            final_music = gain_lp(1,index).*lsim(lp_sys,final_music,length_of_sound);
        end
    end
    disp("Successful: Implemented Low Pass Filters")

    if (~isempty(hp))
        for index = 1:length(hp)
            hp_sys = tf([1 0],[1 hp(1,index)]);
            final_impulse_response_individual(length(lp)+index,:) = gain_hp(1,index).*lsim(hp_sys,original_music,time_vector);
            final_music = gain_hp(1,index).*lsim(hp_sys,final_music,time_vector);
        end
    end
    disp("Successful: Implemented High Pass Filters")

    if (~isempty(lp_hp))
        for index = 1:length(lp_hp)
            lp_sys = tf(lp_hp(1,index), [1 lp_hp(1,index)]);
            hp_sys = tf([1 0],[1 lp_hp(1,index)]);
            final_impulse_response_individual(length(lp)+length(hp)+index,:) = gain_lp_hp(1,index).*lsim(lp_sys,hp_sys,original_music,time_vector);
            final_music = gain_lp_hp(1,index).*lsim(lp_sys,hp_sys,final_music,time_vector);
        end
    end
    disp("Successful: Low Pass and High Pass Filters")   

    % Part 4: Play the Sound
    final_music = final_music.*volume;
    sound(final_music, fs_music);

    % Part 5: Plotting
    if plotting
        disp("plotting here")
    end
   
end




