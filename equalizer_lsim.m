%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

function equalizer_lsim(music_name, lp, gain_lp, hp, gain_hp, lp_hp, gain_lp_hp, rlc, gain_rlc,rlc_elements,plotting)
    % Part 1: Importing the Sound
    [music, fs_music] = audioread(music_name);
    length_of_sound = 0:length(music)-1;
    final_sound = music;
    total_filters = length(lp)+length(hp)+length(lp_hp)+length(rlc);
    individual_responses = zeros(total_filters,length(music));
    fft_by_band = zeros(total_filters,length(music));
    disp("Successful: Sound Length " + length(music));   

    if (~isempty(lp))
        for index = 1:length(lp)
            lp_sys = tf(lp(1,index), [1 lp(1,index)]);
            final_sound = gain_lp(1,index).*lsim(lp_sys,final_sound,length_of_sound);
            individual_responses(index,:) = gain_lp(1,index).*lsim(lp_sys,final_sound,length_of_sound);
        end
    end

    if (~isempty(hp))
        for index = 1:length(hp)
            hp_sys = tf([1 0],[1 a0]);
            final_sound = gain_hp(1,index).*lsim(hp_sys,final_sound,length_of_sound);
            individual_responses(length(lp)+index,:) = gain_lp(1,index).*lsim(hp_sys,final_sound,length_of_sound);
        end
    end

    if (plotting == true)
        legend_labels = create_legend(lp,hp,lp_hp,rlc);
        figure;
        for index = 1:length(lp)
            bode_data = calculate_bode_data(music,"lp",gain_lp(1,index));
            subplot(1,2,1);
            plot(abs(bode_data));

            subplot(1,2,1);
            plot(angle(bode_data));
        end
    end


    sound(final_sound, fs_music);
end




