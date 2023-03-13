%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

function create_bode_plot(final_impulse_response_individual,final_impulse_response,range_of_omega,sum_of_impulse_responses,legend_labels)
        figure;
        
        % The following code calculates the magnitude of the bode plot for
        % each of the bands
        subplot(2,1,1);
        hold on;
        loglog(range_of_omega,abs(final_impulse_response));
        for index = 1:sum_of_impulse_responses
            loglog(range_of_omega,abs(final_impulse_response_individual(index,:)));
        end
        hold off;
        title("User Defined Impulse Response Magnitude")
        xlabel("Frequency (Hz)")
        ylabel("Magnitude of Impulse Response")
        legend(legend_labels);
        xlim([1 size(final_impulse_response_individual,2)])
        set(gca,'XScale','log');

        % The following code calculates the phase of the bode plot for
        % each of the bands
        subplot(2,1,2);
        hold on;
        loglog(range_of_omega,angle(final_impulse_response));
        for index = 1:sum_of_impulse_responses
            loglog(range_of_omega,angle(final_impulse_response_individual(index,:)));
            disp(index);
        end
        disp(legend_labels);
        title("User Defined Impulse Response Phase")
        xlabel("Frequency (Hz)")
        ylabel("Phase of Impulse Response")
        legend(legend_labels);
        xlim([1 size(final_impulse_response_individual,2)])
        set(gca,'XScale','log');  