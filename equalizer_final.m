%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/1/2023

function equalizer_final(music,lp,gain_lp,hp,gain_hp,lp_hp,gain_lp_hp,rlc,gain_rlc,rlc_elements,plotting)    
    % Part 1: Importing the Sound
    [input, Fs_music] = audioread(music);
    disp("Successful: Sound Import Complete");
    disp("Successful: Sound Length " + length(input));

    % Part 2: Calculating the FFT
    fft_of_sound = fft(input);
    disp("Successful: FFT Calculated");
    disp("Successful: FFT Length " + length(fft_of_sound));

    % Part 3: Calculating the impulse responses with RC Filters
    range_of_omega = 1:length(fft_of_sound);
    final_impulse_response = zeros(1,length(fft_of_sound));
    sum_of_impulse_responses = length(lp)+length(hp)+length(lp_hp)+length(rlc);
    final_impulse_response_individual = zeros(sum_of_impulse_responses, length(fft_of_sound));

    if (~isempty(lp))
        for index = 1:length(lp)
            final_impulse_response_individual(index,:) = gain_lp(1,index).*((lp(1,index))./((1i.*range_of_omega) + lp(1,index)));
            final_impulse_response = final_impulse_response + final_impulse_response_individual(index,:);
        end
    end

    if (~isempty(hp))
        for index = 1:length(hp)
            final_impulse_response_individual(index+length(lp),:) = gain_hp(1,index).*(1i.*range_of_omega)./((1i.*range_of_omega) + hp(1,index));
            final_impulse_response = final_impulse_response + final_impulse_response_individual(index+length(lp),:);
        end
    end

     if (~isempty(lp_hp))
        for index = 1:length(lp_hp)
            final_impulse_response_individual(index+length(lp)+length(hp),:) = gain_lp_hp(1,index).*((lp_hp(1,index))./((1i.*range_of_omega) + lp_hp(1,index))).*(1i.*range_of_omega)./((1i.*range_of_omega) + lp_hp(1,index));
            final_impulse_response = final_impulse_response + final_impulse_response_individual(index+length(lp)+length(hp),:);
        end
     end

     if (~isempty(lp_hp))
        for index = 1:length(lp_hp)
            final_impulse_response_individual(index+length(lp)+length(hp),:) = gain_lp_hp(1,index).*((lp_hp(1,index))./((1i.*range_of_omega) + lp_hp(1,index))).*(1i.*range_of_omega)./((1i.*range_of_omega) + lp_hp(1,index));
            final_impulse_response = final_impulse_response + final_impulse_response_individual(index+length(lp)+length(hp),:);
        end
     end

     if (~isempty(rlc))
        for index = 1:length(rlc)
            r = rlc_elements(1,1);
            l = rlc_elements(1,2);
            c = rlc_elements(1,3);
            inverse_l_c = 1/(l*c);
            final_impulse_response_individual(index+length(lp)+length(hp)+length(lp_hp),:) = gain_rlc(1,index).*(inverse_l_c)./((1i.*range_of_omega).^2 + (r/l).*(1i.*range_of_omega) + inverse_l_c);
            final_impulse_response = final_impulse_response + final_impulse_response_individual(index+length(lp)+length(hp),:);
        end
     end

    % Part 4: Multiplying the Impulse Response and the FFT of Input &
    % Finding the Inverse Fast Fourier Transform
    impulse_and_input_product = final_impulse_response.*fft_of_sound(range_of_omega)';
    final_output = flip(abs(ifft(impulse_and_input_product)));
    disp("Successful: Length of Output " + length(final_output));

    % Part 5: Playing the Sound
    sound(final_output,Fs_music);
    disp("Successful: Sound has been played")

    % Part 6: Optional Plotting 
    if plotting == true
        % Plotting the FFT of the Sound
        figure;
        subplot(1,2,1);
        L = length(fft_of_sound);
        P2 = abs(fft_of_sound/L);
        P1 = P2(1:L/2+1);
        P1(2:(length(P1)-1)) = 2*P1(2:(length(P1)-1));
        f = Fs_music*(0:(L/2))/L;
        plot(f,P1) 
        title("Single-Sided Amplitude Spectrum of the Original Music")
        xlabel("f (Hz)")
        ylabel("|P1(f)|")

        % Plotting the FFT of the Sound after Impulse Respones
        subplot(1,2,2);
        L = length(impulse_and_input_product);
        P2 = abs(impulse_and_input_product/L);
        P1 = P2(1:L/2+1);
        P1(2:(length(P1)-1)) = 2*P1(2:(length(P1)-1));
        f = Fs_music*(0:(L/2))/L;
        plot(f,P1) 
        title("Single-Sided Amplitude Spectrum of Final Music")
        xlabel("Frequency (Hz)")
        ylabel("Magnitude of Fast Fourier Transform")

        % Plotting the Impulse Response

        legend_labels = ["Final Impulse Response"];

        figure;
        hold on;
        loglog(range_of_omega,abs(final_impulse_response));
        for index = 1:size(final_impulse_response_individual,1)
            loglog(range_of_omega,abs(final_impulse_response_individual));
            if (index <= length(lp))
                name = "HLP" + index;
                legend_labels = [legend_labels name];
            end
            if (index > length(lp) && index <= length(hp))
                name = "HHP" + index;
                legend_labels = [legend_labels name];
            end
            if (index > length(hp) && index <= length(lp_hp))
                name = "HLPHP" + index;
                legend_labels = [legend_labels name];
            end
            if (index > length(lp_hp) && index <= length(rlc))
                name = "HRLC" + index;
                legend_labels = [legend_labels name];
            end
        end
        hold off;
        title("User Defined Impulse Response")
        xlabel("Frequency (Hz)")
        ylabel("Magnitude of Impulse Response")
        legend(legend_labels);
        xlim([1 size(final_impulse_response_individual,2)])
        set(gca,'XScale','log');
    end
end

