%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/1/2023

function create_bode_plot(data,Fs)
    figure;
    %subplot(1,2,1);
    L = length(data);
    P2 = abs(data/L);
    P1 = P2(1:L/2+1);
    P1(2:(length(P1)-1)) = 2*P1(2:(length(P1)-1));
    f = Fs*(0:(L/2))/L;
    plot(f,P1) 
    title("Single-Sided Amplitude Spectrum of the Music")
    xlabel("f (Hz)")
    ylabel("Magnitude of Fast Fourier Transform")

%     subplot(1,2,2);
%     L = length(data);
%     P2 = angle(data/L);
%     P1 = P2(1:L/2+1);
%     P1(2:(length(P1)-1)) = 2*P1(2:(length(P1)-1));
%     f = Fs*(0:(L/2))/L;
%     plot(f,P1) 
%     title("Single-Sided Amplitude Spectrum of the Music")
%     xlabel("f (Hz)")
%     ylabel("Phase of Fast Fourier Transform")

end