%% Case Study 1
% Authors: Lauren Lynch, Xinzhu Lin, and Chinh Mach
% Class: Signals and Systems
% Date: 3/17/2023

% Parameter Description
% L

function labels = create_legend(lp,hp,lp_hp,rlc,include_first)
        
        legend_labels = ["Combination of Impulse Responses"];
        
        % The following code creates the legend labels for each of the
        % filters that the user has implemented
        if (~isempty(lp))
           for index_label = 1:length(lp)
               name = "HLP" + index_label;
               legend_labels = [legend_labels name];
           end
        end       
        if (~isempty(hp))
            for index_label = 1:length(hp)
               name = "HHP" + index_label;
               legend_labels = [legend_labels name];
           end
        end
        if (~isempty(lp_hp))
           for index_label = 1:length(lp_hp)
               name = "HLPHP" + index_label;
               legend_labels = [legend_labels name];
           end
        end
        if (~isempty(rlc))
            for index_label = 1:length(rlc)
                name = "HRLC" + index_label;
                legend_labels = [legend_labels name];
            end
        end
        
        if include_first
           labels = legend_labels;    
        else
           if length(legend_labels) == 2
              labels = legend_labels(1,2);
           else
              labels = legend_labels(1,2:end);
           end
        end
end