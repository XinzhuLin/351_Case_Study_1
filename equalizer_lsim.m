%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

function equalizer_lsim(music,lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc_elements,gain_rlc,volume,plotting)    
    % Part 1: Importing the Sound
    [original_music, fs_music] = audioread(music);
    disp("Successful: Imported Sound")

    % Part 2: Setting Up Parameters for the Impulse Response Bands & Input
    time_vector = 0:(length(original_music)-1);
    sum_of_impulse_responses = length(lp)+length(hp)+length(lp_hp)+(length(rlc_elements)/3);
    final_impulse_response_individual = zeros(sum_of_impulse_responses, length(original_music));
    transfer_function_list = [];
    final_music = original_music;
    disp("Successful: Created Parameters")

    % Part 3: Using LSIM to convolute the final sound
    if (~isempty(lp))
        for column = 1:size(final_music,2)
            for index = 1:length(lp)
                transfer_function_list = [transfer_function_list tf(lp(1,index), [1 lp(1,index)])];
                final_impulse_response_individual(index,:) = gain_lp(1,index).*lsim(transfer_function_list(end),original_music(:,column),time_vector); 
                final_music(:,column) = gain_lp(1,index).*lsim(transfer_function_list(end),final_music(:,column),time_vector);
            end
        end
    end
    disp("Successful: Implemented Low Pass Filters")

    if (~isempty(hp))
        for column = 1:size(final_music,2)
            for index = 1:length(hp)
                transfer_function_list = [transfer_function_list tf([1 0],[1 hp(1,index)])];
                final_impulse_response_individual(length(lp)+index,:) = gain_hp(1,index).*lsim(transfer_function_list(end),original_music(:,column),time_vector);
                final_music(:,column) = gain_hp(1,index).*lsim(transfer_function_list(end),final_music(:,column),time_vector);
            end
        end
    end
    disp("Successful: Implemented High Pass Filters")

    if (~isempty(lp_hp))
        for column = 1:size(final_music,2)
            for index = 1:length(lp_hp)
                transfer_function_list = [transfer_function_list (tf(lp_hp(1,index), [1 lp_hp(1,index)])*tf([1 0],[1 lp_hp(1,index)]))];
                final_impulse_response_individual(length(lp)+length(hp)+index,:) = gain_lp_hp(1,index).*lsim(transfer_function_list(end),original_music(:,column),time_vector);
                final_music(:,column) = gain_lp_hp(1,index).*lsim(transfer_function_list(end),final_music(:,column),time_vector);
            end
        end
    end
    disp("Successful: Low Pass and High Pass Filters")   

    if (~isempty(rlc_elements))
        for column = 1:size(final_music,2)
            for index = 0:((length(rlc_elements)/3)-1)
                r = rlc_elements(1,3*index+1);
                l = rlc_elements(1,3*index+2);
                c = rlc_elements(1,3*index+3);
                transfer_function_list = [transfer_function_list tf(1/(l*c),[1,r/l,1/(l*c)])];
                final_impulse_response_individual(length(lp)+length(hp)+length(lp_hp)+index+1,:) = gain_rlc(1,index+1).*lsim(transfer_function_list(end),original_music(:,column),time_vector);
                final_music(:,column) = gain_rlc(1,index+1).*lsim(transfer_function_list(end),final_music(:,column),time_vector);
            end
        end
    end
    disp("Successful: RLC Filters")

    % Part 4: Play the Sound
    if volume ~= 0
        final_music = final_music.*volume;
    end
    sound(final_music, fs_music);
    fft_of_final_music = fft(final_music);
    fft_of_original_music = fft(original_music);
    disp("Successful: Played Sound")

    % Part 5: Plotting
    if plotting == true
        legend_labels = create_legend(lp,hp,lp_hp,rlc_elements,true);

        % Plot the FFT
        create_fft_plot(fft_of_original_music,fs_music,music)
        create_fft_plot(fft_of_final_music,fs_music,music)

        % Plot the Spectrogram of the Music
        for column = 1:size(original_music,2)
            figure;
            spectrogram(original_music(:,column))
            title("Original Music Column " + column)
        end
        for column = 1:size(original_music,2)
            figure;
            spectrogram(final_music(:,column))
            title("Final Music Column " + column)
        end

        % Bode Plot by Band
        figure;
        cumulative_response = 0;
        hold on;
        for index = 1:sum_of_impulse_responses
            cumulative_response = cumulative_response+transfer_function_list(index);
        end
        bode(cumulative_response);
        for index = 1:sum_of_impulse_responses
            bode(transfer_function_list(index),time_vector);
        end
        hold off;
        legend(legend_labels);
        title("Bode Plot by User Inputted Filter");
    end
end




