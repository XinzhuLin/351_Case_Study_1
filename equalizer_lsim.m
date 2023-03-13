%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

function equalizer_lsim(music,lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc,gain_rlc,rlc_elements,volume,plotting)    
    % Part 1: Importing the Sound
    [original_music, Fs_music] = audioread(music);
    disp("Successful: Imported Sound")

    % Part 2: Setting Up Parameters for the Impulse Response Bands & Input
    time_vector = 1:length(original_music);
    sum_of_impulse_responses = length(lp)+length(hp)+length(lp_hp)+length(rlc);
    final_impulse_response = zeros(1,length(original_music));
    final_impulse_response_individual = zeros(sum_of_impulse_responses, length(original_music));
    final_sound = original_music;
    disp("Successful: Created Parameters")

    % Part 3: Calculate the Impulse Response
    if (~isempty(lp))
        for index = 1:length(lp)
            lp_sys = tf(lp(1,index), [1 lp(1,index)]);
            final_impulse_response_individual(index,:) = gain_lp(1,index).*lsim(lp_sys,original_music,time_vector); 
            final_sound = gain_lp(1,index).*lsim(lp_sys,final_sound,length_of_sound);
        end
    end
    disp("Successful: Implemented Low Pass Filters")

    if (~isempty(hp))
        for index = 1:length(hp)
            hp_sys = tf([1 0],[1 hp(1,index)]);
            final_impulse_response_individual(length(lp)+index,:) = gain_hp(1,index).*lsim(hp_sys,original_music,time_vector);
            final_sound = gain_hp(1,index).*lsim(hp_sys,final_sound,length_of_sound);
        end
    end
    disp("Successful: Implemented High Pass Filters")

    if (~isempty(lp_hp))
        for index = 1:length(lp_hp)
            lp_sys = tf(lp_hp(1,index), [1 lp_hp(1,index)]);
            hp_sys = tf([1 0],[1 lp_hp(1,index)]);
            final_impulse_response_individual(length(lp)+length(hp)+index,:) = gain_lp_hp(1,index).*lsim(lp_sys,hp_sys,original_music,time_vector);
            final_sound = gain_lp_hp(1,index).*lsim(lp_sys,hp_sys,final_sound,time_vector);
        end
    end
    disp("Successful: Low Pass and High Pass Filters")

    final_sound = final_sound.*volume;
    sound(final_sound,Fs_music);

    % Part 4: Optional Plottig
    if (plotting == true)    
        legend_labels = create_legend(lp,hp,lp_hp,rlc);
        
        % 
        figure;
        for index = 1:length(lp)
            bode_data = calculate_bode_data(music,"lp",gain_lp(1,index));
            subplot(2,1,1);
            plot(abs(bode_data));

            subplot(2,1,1);
            plot(angle(bode_data));
        end
    end


    % Part 5: Play the Sound
    sound(final_sound, fs_music);

    % Part 6: Optional Plotting 
    if plotting == true
        % Legend Labels to be Used in the Following Graphs
        legend_labels = create_legend(lp,hp,lp_hp,rlc);

        % FFT Plot of the Original Sound 
        create_fft_plot(fft_of_sound,Fs_music, "Orignal " + music)

        % FFT Plot of the Processed Sound
        create_fft_plot(impulse_and_input_product,Fs_music, "Processed " + music)

        % Magnitude and Phase by Band Plots
        create_bode_plot(final_impulse_response_individual,final_impulse_response,range_of_omega,sum_of_impulse_responses,legend_labels)

        % Spectrogram Plots
        figure;
        subplot(2,1,1);
        spectrogram(original_music);
        title("Spectrogram of Original " + music);
        subplot(2,1,2);
        spectrogram(final_output)
        title("Spectrogram of Processed " + music);
    end  
end




