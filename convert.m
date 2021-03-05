%% This is a function that converts the time of signal reception by the GNSS Receiver to GPS time

function[GPS] = convert(year, month, day, hour, min, sec)

%datenum gives approximately # of julian days since year 0
start = datenum(1980, 1, 6, 0, 0, 0);%start epoch
now = datenum(year, month, day, hour, min, sec); %current time for satellite

%GPS time the # of seconds in the week coming from cycle, week, then day
%how many seconds up to that current day in week
%cycle is 1024 weeks = 7168 julian days

%divide the days, hours, minutes, to get to seconds
%carry fractional number to next unit

%days to cycle
delday = now - start; 
cycle = delday / 7168;
fullcycle = floor(cycle);
fraccycle = cycle - fullcycle;

%leftover cycle back to weeks
week = fraccycle * 1024;
fullweek = floor(week);
fracweek = week - fullweek;

%conversion from days to seconds
day = fracweek*7;
fullday = floor(day);
fracday = day - fullday;

hour = fracday*24;
fullhour = floor(hour);
frachour = hour - fullhour;

min = frachour*60;
fullmin = floor(min);
fracmin = min - fullmin;

sec = round(fracmin*60);

%converting days, hours, minutes to seconds
daysec = fullday*86400;
hoursec = fullhour*3600;
minsec = fullmin*60;

%all the seconds in the week after subtracting the cycles and previous
%weeks

GPS = daysec + hoursec + minsec + sec;
end