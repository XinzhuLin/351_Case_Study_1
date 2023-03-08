%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/1/2023

function equalizer(music,gain,inverse_tau,plotting)    
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
    H1 = gain(1,1).*((1i.*range_of_omega)./((1i.*range_of_omega) + inverse_tau(1,1))).*((inverse_tau(1,1))./((1i.*range_of_omega) + inverse_tau(1,1)));
    H2 = gain(1,2).*((1i.*range_of_omega)./((1i.*range_of_omega) + inverse_tau(1,2))).*((inverse_tau(1,2))./((1i.*range_of_omega) + inverse_tau(1,2)));
    H3 = gain(1,3).*((1i.*range_of_omega)./((1i.*range_of_omega) + inverse_tau(1,3))).*((inverse_tau(1,3))./((1i.*range_of_omega) + inverse_tau(1,3)));
    H4 = gain(1,4).*((1i.*range_of_omega)./((1i.*range_of_omega) + inverse_tau(1,4))).*((inverse_tau(1,4))./((1i.*range_of_omega) + inverse_tau(1,4)));
    H5 = gain(1,5).*((1i.*range_of_omega)./((1i.*range_of_omega) + inverse_tau(1,5))).*((inverse_tau(1,5))./((1i.*range_of_omega) + inverse_tau(1,5)));
    H6 = gain(1,6).*((1i.*range_of_omega)./((1i.*range_of_omega) + inverse_tau(1,6))).*((inverse_tau(1,6))./((1i.*range_of_omega) + inverse_tau(1,6)));

    % Part 4: Multiplying the Impulse Response and the FFT of Input &
    % Finding the Inverse Fast Fourier Transform
    final_inpulse_response = H1 + H2 + H3 + H4 + H5 + H6;
    impulse_and_input_product = final_inpulse_response.*fft_of_sound(range_of_omega)';
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
        xlabel("f (Hz)")
        ylabel("|P1(f)|")

        % Plotting the Impulse Response
        figure;
        hold on;
        loglog(range_of_omega,abs(H1));
        loglog(range_of_omega,abs(H2));
        loglog(range_of_omega,abs(H3));
        loglog(range_of_omega,abs(H4));
        loglog(range_of_omega,abs(H5));
        loglog(range_of_omega,abs(H6));
        hold off;
        title("Impulse Respones")
        legend("H1","H2","H3","H4","H5","H6");
        set(gca,'XScale','log');
    end
end

