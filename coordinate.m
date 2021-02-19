%% This is a Function that determines the ECEF Coordinate position of a satellite


function[x, y, z] = coordinate(observ) %earth-fixed coordinates

% Variables
observ = num2cell(observ);
[A, e, t, toe, deltan, M0, w, cus, cuc, crs, crc, cis, cic, i0, IDOT, omega0, omega] = deal(observ{:});


% WGS 84 Parameters
u = 3.986005e14; %WGS84 value of earth's universal gravitational parameter (m^3/s^2)
omegae = 7.2921151467e-5; %WGS84 value of earth's rotation rate 


A = A^2; % Semi-Major Axis
n0 = sqrt(u/A^3); %computed mean motion rad/sec
tk = t - toe; %time from emphemeris reference epoch
n = n0 + deltan; %computed mean motion


Mk = M0 + n*tk; %Mean anomaly
E0 = Mk;
Ek = Mk - e*sin(E0);  %solving iteratively for Eccentric anomaly

c = abs(Ek-E0);
while c < 10e-10 %iteration equation
    E0 = Ek;
    Ek = Mk - e*sin(E0);
    c = abs(Ek-E0);
end

vk = atan2(sqrt(1-e^2)*sin(Ek)/(1 - e*cos(Ek)),(cos(Ek-e))/(1 - e*cos(Ek))); %True anomaly
phik = vk + w; %argument of latitude



%second harmonic perturbations
deltauk = cus*sin(2*phik) + cuc*cos(2*phik); %argument of latitude correction
deltark = crs*sin(2*phik) + crc*cos(2*phik); %radius correction
deltaik = cis*sin(2*phik) + cic*cos(2*phik); %inclination correction


uk = phik + deltauk; %corrected argument of latitude
rk = A*(1-e*cos(Ek)+deltark); %corrected radius
ik = i0 + deltaik + IDOT*tk; %inclination correction

% Positions in Orbital Plane
xkprime = rk*cos(uk);
ykprime = rk*sin(uk);

% Corrected longitude
omegak = omega0 + (omega - omegae)*tk - omegae*toe;

% Earth-fixed Coordinates
x = xkprime*cos(omegak)-ykprime*cos(ik)*sin(omegak);
y = xkprime*sin(omegak)+ykprime*cos(ik)*cos(omegak);
z = ykprime*sin(ik);
end