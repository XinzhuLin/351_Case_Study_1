%% Case Study 1
% Authors: Lauren Lynch
% Class: Signals and Systems
% Date: 3/17/2023

% Parameter Description
% data -- matrix -- a sound wave in continuous time
% fs -- real number -- sampling frequency
% music_title -- string -- name of the song

function create_fft_plot(data,fs,music_title)
    % The following sets up the parameters for plotting as seen in the
    % documentation for the fft function
    title_of_fft = "Single-Sided Amplitude Spectrum of " + music_title;

    data = fft(data);
    L = length(data);
    P2 = abs(data/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs*(0:(L/2))/L;
    
    % The following code plots the fft
    plot(f,P1);
    title(title_of_fft);
    xlabel("f (Hz)");
    ylabel("Magnitude of Fast Fourier Transform");
end