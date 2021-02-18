%% Main run file - ESSE3670 Project 2
% Jeff Davis (214238414) | Ryan Nguyen (216334336)
clear; close all; clc



%% Read in Navigation File
input = 'brdc0030.21n';
[h,d] = read_nav(input);



%% Which Set of Observations
block = d(1:10,1:5);



%% Satellite Observations 
observations = obs(block);



%% Find Position
%[x,y,z] = coordinate();


