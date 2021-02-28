function[satcorr] = clockfix(GPSrec, GPSsat, af0, af1, af2, toc, A, e, Ek)
c = 8e8;
F = -4.442807633e-10;

pseudo = c*(GPSrec-GPSsat);

delGPSrec = pseudo/c;

GPSsat = GPSrec - delGPSrec;

deltr = F*e*sqrt(A)*sin(Ek);

if (GPSsat - toc > 302400)
    GPSsat = GPSsat - 604800;
    
elseif (GPSsat - toc < -302400)
    GPSsat = GPSsat + 604800;
    
end
    

corr = af0 + af1*(GPSsat - toc) + af2*(GPSsat - toc)^2 + deltr;

satcorr = GPSsat - corr;

end



