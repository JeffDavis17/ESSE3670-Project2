%% This is a Function that computed the time correctrion for system transmission time


function t = correction(Ts, Toc, af0, af1, af2, A, e, Ek)

F = -4.442807633e-10;
deltr = F*e*sqrt(A)*sin(Ek); % relativistic correction


if (Ts - Toc > 302400)
    Ts = Ts - 604800;
    
elseif (Ts - Toc < -302400)
    Ts = Ts + 604800;

end


% Sat Clock Correction
dt = af0 + af1*(Ts - Toc)  + af2*(Ts - Toc)^2 + deltr;

t = Ts - dt;
end

