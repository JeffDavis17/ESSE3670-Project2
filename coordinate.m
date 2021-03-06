%% This is a Function that determines the ECEF Coordinate position of a satellite

function[x, y, z] = coordinate(observ,Ts,Toc) %earth-fixed coordinates

% Variables
observ = num2cell(observ);
[A, e, toe, deltan, M0, w, cus, cuc, crs, crc, cis, cic, i0, IDOT, omega0, OMEGADOT, af0, af1, af2] = deal(observ{:});


% WGS 84 Parameters
u = 3.986005e14; %WGS84 value of earth's universal gravitational parameter (m^3/s^2)
omegae = 7.2921151467e-5; %WGS84 value of earth's rotation rate 


% Observables
A = A^2;
n0 = sqrt(u/A^3);
n = n0 + deltan;
tk = Ts - toe;

if tk > 302400
    tk = tk - 604800;
elseif tk < -302400
    tk = tk + 604800;
end




% Determine Eccentric Anomaly Ek
Mk = M0 + n*tk; %Mean anomaly
E0 = Mk;
Ek = Mk + e*sin(E0);  %solving iteratively for Eccentric anomaly

c = abs(Ek-E0);
while c >= 10e-10 %iteration equation
    E0 = Ek;
    Ek = Mk + e*sin(E0);
    c = abs(Ek-E0);
end



% True Anomaly
vk = atan((sqrt(1-e^2)*sin(Ek))/(cos(Ek) - e));



% Arguement of Latitude
phik = vk + w;



% Second Harmonic Perturbations
duk = cus*sin(2*phik) + cuc*cos(2*phik);
drk = crs*sin(2*phik) + crc*cos(2*phik);
dik = cis*sin(2*phik) + cic*cos(2*phik);



uk = phik + duk; % Corrected arguement of Latitude
rk = A*(1 - e*cos(Ek)); % Corrected Radius
ik = i0 + dik + IDOT*drk;


xkprime = rk*cos(uk);
ykprime = rk*sin(uk);



% Correction for time
t = correction(Ts, Toc, af0, af1, af2, A, e, Ek);
tk = t-toe;

if tk > 302400
    tk = tk - 604800;
elseif tk < -302400
    tk = tk + 604800;
end


% Corrected Longitude of Ascending Node
omegak = omega0 + (OMEGADOT - omegae)*tk - omegae*toe;


% Earth-fixed Coordinates
x = xkprime*cos(omegak)-ykprime*cos(ik)*sin(omegak);
y = xkprime*sin(omegak)+ykprime*cos(ik)*cos(omegak);
z = ykprime*sin(ik);

end


