


function create_impulse_graph(final_impulse_response_individual,final_impulse_response,range_of_omega,sum_of_impulse_responses,legend_labels)
        figure;
        subplot(1,2,1);
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

        subplot(1,2,2);
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