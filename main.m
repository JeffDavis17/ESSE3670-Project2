%% Main run file - ESSE3670 Project 2
% Jeff Davis (214238414) | Ryan Nguyen (216334336)
clear; close all; clc


% Read in Navigation File
input = 'brdc0030.21n';
[h,d] = read_nav(input);


% Which Set of Observations
n = 3;
n = n + (n-1)*9;
block = d(n:n+9,:);


% Satellite Observations 
observ = obs(block);


% Find Position
[x,y,z] = coordinate(observ);


