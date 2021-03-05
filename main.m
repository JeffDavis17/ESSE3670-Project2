%% Main run file - ESSE3670 Project 2
% Jeff Davis (214238414) | Ryan Nguyen (216334336)
clear; close all; clc

% Process
    % 1. Read File
    % 2. Find closest time and GRAB OBS
    % 3. Convert and Correct Transmission time to GPS
    % 4. Compute Position using those times and OBS

    
% Temporary - Will have to read the Excel File???
% Maybe set up a for loop that does this for each entry in the Excel File
PRN = 19;
y = 2021;
mn = 1;
day = 03;
hr = 3;
m=15;
s=0;

    
% Read in Navigation File %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Have to fix so that it searches for end of header instead of 8 lines
input = 'brdc0030.21n';
[h,d] = read_nav(input);


% Find Closest Set of Observations
if mod(hr,2)
   hr_var = hr+1;
end


% Which Set of Observations - Based on the Closest time
d_sets = [];
for i = 1:10:(length(d))
    if d(i,1) == PRN
        if d(i+4,1) == hr_var
            block = d(i:i+9,:); % Data 
       end
    end
end


% Satellite Observations - Assign variables 
%observ = obs(block);



% Convert to reciever time to GPS Time (Ta)
GPST_rec = convert(y,mn,day,hr,m,s);



% System Transmission Time. Need to get Ek and stuff like that?? 
pseudo = 21324698.809; % Pseudorange - TEMPORARY
af0 = block(8,1); % Satellite Clock Bias
af1 = block(9,1); % Satellite Drift 
af2 = block(10,1); % Satellite Drift Rate
toc = block(2,1); 

other_val = correction(GPST_rec,pseudo,af0,af1,af2,toc,A,E,Ek)




% Find Position
%[x,y,z] = coordinate(observ);


