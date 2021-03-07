%% Main run file - ESSE3670 Project 2
% Jeff Davis (214238414) | Ryan Nguyen (216334336)
clear; close all; clc


% Read in Rinex File
file = 'Code input - group 3.xlsx';
input = 'brdc0030.21n';
[h,d] = read_nav(input);


% File information
[~,doy] = xlsread(file,1,'A1');
doy = doy{1};
yr = str2double(doy(10:13));
doy = str2double(doy(5:7));
date = datetime('1-Jan-2021')+(doy-1);
date = yyyymmdd(date);
date = sprintf('%d',date);
mn = str2double(date(5:6));
day = str2double(date(7:end));


% Get time information for each satellite
tab = readtable(file,'range','A5:C11');
PRNs = table2array(tab(:,1));


% Compute Satellite Positions and Write to Text File
pos = [];
fileID = fopen('sat_pos.txt','wt');
for i= 1:length(PRNs)

    % Satellite Values
    PRN = PRNs(i);
    [hr,m,s,pseudo] = get_time(tab,i);
    
    
    % Find Closest Set of Observations based on time
    block = closest(d,hr,PRN);


    % Satellite Observations - Assign Variables
    observ = obs(block);


    % GPS time
    Ta = convert(yr,mn,day,hr,m,s);
    Ts = Ta - pseudo/3e8;
    Toc = convert(block(2),block(3),block(4),block(5),block(6),block(7));


    % Find Postion
    % Time correction runs in coordinate.m
    
    [x, y, z] = coordinate(observ,Ts,Toc);
    pos = [pos;x,y,z];

    % Format Text
    output = out_form(yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
    fprintf(fileID,'%s\n',output);
end
fclose(fileID);
