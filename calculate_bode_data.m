%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

function bode_data = calculate_bode_data(music,lp_hp_rlc,inverse_tau)
  
    % Part 1: Sets up the parameters
    time_vector = logspace(1,4,100);
    sys_lp = ones(1,length(time_vector));
    sys_hp = ones(1,length(time_vector));
    output = zeros(1,length(time_vector));
    
    if ((lp_hp_rlc == "lp") || (lp_hp_rlc == "lp_hp"))
        sys_lp = tf(inverse_tau, [1 inverse_tau]);
        output = lsim(sys_lp,music,time_vector);
    end
    if ((lp_hp_rlc == "hp") || (lp_hp_rlc == "lp_hp"))
        sys_hp = tf([1 0],[1 inverse_tau]);
        output = lsim(sys_hp,music,time_vector);
    end
    bode_data = output./music;
end