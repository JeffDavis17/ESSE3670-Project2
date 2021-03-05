%% This function applies the appropriate corrections and returns System Transmission Time

%function[satcorr] = correction(GPSrec, GPSsat, af0, af1, af2, toc, A, e, Ek)
function[satcorr] = correction(GPSrec, pseudo, af0, af1, af2, toc, A, e, Ek)
c = 8e8;
F = -4.442807633e-10;

% Pseudorange will be input from csv file i think?
%pseudo = c*(GPSrec-GPSsat);

delGPSrec = pseudo/c; % Signal Propogation Time

GPSsat = GPSrec - delGPSrec; % Transmission Time

deltr = F*e*sqrt(A)*sin(Ek); % Relativistic Correction


% System Transmission Time?
if (GPSsat - toc > 302400)
    GPSsat = GPSsat - 604800;
    
elseif (GPSsat - toc < -302400)
    GPSsat = GPSsat + 604800;

end


corr = af0 + af1*(GPSsat - toc) + af2*(GPSsat - toc)^2 + deltr; % Satellite Clock Correction
satcorr = GPSsat - corr; % System Transmission Time (use for OBS t)
end



