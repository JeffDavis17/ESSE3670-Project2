%% Main run file
clear; close all; clc


% Temporary time of reception and pseudorange - Ta
PRN = 3;
y = 2021;
mn = 1;
day = 03;
hr = 20;
m=30;
s=0;
pseudo = 24322423.803; % Pseudorange 



% Read in Rinex File
input = 'brdc0030.21n';
[h,d] = read_nav(input);

%{
% Read in Pseudoranges and Time of Reception 
tab = readtable('Code input - group 3.xlsx','range','A5:C11');
PRNs = table2array(tab(:,1));
rt = table2array(tab(:,2));
rt_hr(:) = floor(rt*24);
rt_min(:) = (rt(:)*24 - rt_hr(:))*60;
rt_sec(:) = (rt_min(:) - floor(rt_min(:)))*60;
pseudos(:) = str2double(table2array(tab(:,3)));
y = 2021;
mn = 1;
day = 03;
%}

    % Find Closest Set of Observations based on time
    %{
    PRN = PRNs(i);
    pseudo = pseudos(i);
    hr = rt_hr(i);
    m = rt_min(i);
    s = rt_sec(i);
    %}
    block = closest(d,hr,PRN);


    % Satellite Observations - Assign Variables
    observ = obs(block);


    % GPS time
    Ta = convert(y,mn,day,hr,m,s);
    Ts = Ta - pseudo/3e8;
    Toc = convert(block(2),block(3),block(4),block(5),block(6),block(7));


    % Find Postion
    % Time correction runs in coordinate.m
    [x, y, z] = coordinate(observ,Ts,Toc)
    %pos = [pos;x,y,z];


