%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

function bode_data = calculate_bode_data(music,lp_hp_rlc,inverse_tau)
    
    % Part 1: Sets up the parameters
    time_vector = logspace(1,4,100);
    sys_lp = ones(1,length(time_vector));
    sys_hp = ones(1,length(time_vector));

    if ((lp_hp_rlc == "lp") || (lp_hp_rlc == "lp_hp"))
        sys_lp = tf(inverse_tau, [1 inverse_tau]);
    end
    if ((lp_hp_rlc == "hp") || (lp_hp_rlc == "lp_hp"))
        sys_hp = tf([1 0],[1 inverse_tau]);
    end

    temp_output = lsim(sys_lp,lsim(sys_hp,music,time_vector),time_vector);

    bode_data = temp_output./music;
end