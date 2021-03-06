%% This Function finds the closest time and gathers observations from the
% Rinex file


function [block] = closest(d,hr,PRN)

% Closest time in the Rinex File
if mod(hr,2)
   hr_var = hr+1;
else
    hr_var = hr;
end


% Find closest time
for i = 1:10:(length(d))
    if d(i,1) == PRN
        if d(i+4,1) == hr_var
            block = d(i:i+9,:); % Data 
       end
    end
end

end
