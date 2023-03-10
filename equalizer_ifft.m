%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

function equalizer_ifft(music,lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc,gain_rlc,rlc_elements,volume,plotting)    
    % Part 1: Importing the Sound
    [input, Fs_music] = audioread(music);
    disp("Successful: Sound Length " + length(input));

    % Part 2: Calculating the FFT
    fft_of_sound = fft(input);
    disp("Successful: FFT Length " + length(fft_of_sound));

    % Part 3: Calculating the impulse responses with RC and RLC Filters
    range_of_omega = 1:length(fft_of_sound);
    sum_of_impulse_responses = length(lp)+length(hp)+length(lp_hp)+length(rlc);
    final_impulse_response = zeros(1,length(fft_of_sound));
    final_impulse_response_individual = zeros(sum_of_impulse_responses, length(fft_of_sound));

    if (~isempty(lp))
        for index = 1:length(lp)
            final_impulse_response_individual(index,:) = gain_lp(1,index).*((lp(1,index))./((1i.*range_of_omega) + lp(1,index)));
            final_impulse_response=final_impulse_response+final_impulse_response_individual(index,:);
        end
    end

    if (~isempty(hp))
        for index = 1:length(hp)
            final_impulse_response_individual(index+length(lp),:) = gain_hp(1,index).*(1i.*range_of_omega)./((1i.*range_of_omega) + hp(1,index));
            final_impulse_response=final_impulse_response+final_impulse_response_individual(index+length(lp),:);
        end
    end

    if (~isempty(lp_hp))
        for index = 1:length(lp_hp)
            final_impulse_response_individual(index+length(lp)+length(hp),:) = gain_lp_hp(1,index).*((lp_hp(1,index))./((1i.*range_of_omega) + lp_hp(1,index))).*(1i.*range_of_omega)./((1i.*range_of_omega) + lp_hp(1,index));
            final_impulse_response=final_impulse_response+final_impulse_response_individual(index+length(lp)+length(hp),:);
        end
    end

     if (~isempty(rlc))
        for index = 1:length(rlc)
            r = rlc_elements(1,1);
            l = rlc_elements(1,2);
            c = rlc_elements(1,3);
            inverse_l_c = 1/(l*c);
            final_impulse_response_individual(index+length(lp)+length(hp)+length(lp_hp),:) = gain_rlc(1,index).*(inverse_l_c)./((1i.*range_of_omega).^2 + (r/l).*(1i.*range_of_omega) + inverse_l_c);
            final_impulse_response=final_impulse_response+final_impulse_response_individual(index+length(lp)+length(hp),:);
        end
     end

    % Part 4: Multiplying the Impulse Response and the FFT of Input &
    % Finding the Inverse Fast Fourier Transform
    impulse_and_input_product = final_impulse_response.*fft_of_sound(range_of_omega)'.*volume;
    final_output = flip(abs(ifft(impulse_and_input_product)));
    disp("Successful: Length of Output " + length(final_output));

    % Part 5: Playing the Sound
    sound(final_output,Fs_music);
    disp("Successful: Sound has been played")

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
        spectrogram(input);
        title("Spectrogram of Original " + music);
        subplot(2,1,2);
        spectrogram(final_output)
        title("Spectrogram of Processed " + music);
    end  
end


