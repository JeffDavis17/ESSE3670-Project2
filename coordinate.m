function[x, y, z] = earth(A, e, t, toe, deltan, M0, w, cus, cuc, crs, crc, cis, cic, i0, IDOT, omega0, omega) %earth-fixed coordinates
%A is semi major axis
%e is eccentricity
u = 3.986005e10; %WGS84 value of earth's universal gravitational parameter
omegae = 7.2921151467e-5; %WGS84 value of earth's rotation rate
A = sqrt(A.^2);
n0 = sqrt(u/A.^3); %computed mean motion rad/sec
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

vk = atan2(sqrt(1-e.^2)*sin(Ek)/(cos(Ek)-e)); %True anomaly
phik = vk + w; %argument of latitude

%second harmonic perturbations
deltauk = cus*sin(2*phik) + cuc*cos(2*phik); %argument of latitude correction
deltark = crs*sin(2*phik) + crc*cos(2*phik); %radius correction
deltaik = cis*sin(2*phik) + cic*cos(2*phik); %inclination correction

uk = phik + deltauk; %corrected argument of latitude
rk = A*(1-e*cos(Ek)+deltark); %corrected radius
ik = i0 + deltaik + IDOT*yk; %inclination correction

xkprime = rk*cos(uk);
ykprime = rk*sin(uk);

omegak = omega0 + (omega - omegae)*tk - omegae*toe;

x = xkprime*cos(omegak)-ykprime*cos(ik)*sin(omegak);
y = xkprime*sin(omegak)+ykprime*cos(ik)*cos(omegak);
z = ykprime*sin(ik);
end