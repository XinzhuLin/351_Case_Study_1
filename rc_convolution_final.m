%% Case Study 1
% Authors: Lauren Lynch
% Class: Signals and Systems
% Date: 3/1/2023

function output = rc_convolution_final(frequency_spike, angular_frequency_range)
    
    a0 = frequency_spike;
    [H_lp] = freqs(a0, [1, a0], angular_frequency_range);
    [H_hp] = freqs([1 0], [1 a0], angular_frequency_range);
    impulse_response = H_lp.*H_hp;
    output = impulse_response;

end