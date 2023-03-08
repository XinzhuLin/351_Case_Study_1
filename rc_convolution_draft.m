%% Case Study 1
% Authors: Lauren Lynch
% Class: Signals and Systems
% Date: 3/1/2023

function output = rc_convolution_draft(frequencies, a0, plot, discretized_input)
    [H_lp, W_lp] = freqs(a0, [1, a0], frequencies);
    [H_hp, W_hp] = freqs([1 0], [1 a0], frequencies);

    product_filters = abs(H_lp).*abs(H_hp);
    magnitude_discretized_input = abs(discretized_input(frequencies))';
    product_filters_input = product_filters.*magnitude_discretized_input;

    if plot == true
        disp("Successful: HLP " + length(H_lp))
        disp("Successful: HHP " + length(H_hp))
        disp("Successful: WLP " + length(W_lp))
        disp("Successful: WHP " + length(W_hp))
        disp("Successful: PF  " + length(product_filters))
        disp("Successful: PFI " + length(product_filters_input))

        figure;
        subplot(1,2,1);
        hold on;
        plot(W_lp', abs(H_lp));
        plot(W_hp,abs(H_hp));
        plot(W_hp,product_filters);
        hold off;
        title("Complex Frequency Response of the Filter");
        legend("Low Pass Filter","High Pass Filter","Product of Filters");
        xlim([band_length_array(1,1) band_length_array(1,2)]);

        subplot(1,2,2);
        plot(W_lp, product_filters_input_1);
        title("First Band: Input");
        xlim([band_length_array(1,1) band_length_array(1,2)]);
    end

    output = product_filters_input;
end
    