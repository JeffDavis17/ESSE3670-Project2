%% Main run file - ESSE3670 Project 2
% Jeff Davis (214238414) | Ryan Nguyen ()
clear; close all; clc


%% Read In Navigation File - Make Function later
input = 'brdc0030.21n';
file = fopen(input);
intro = textscan(file,'%s',8,'Delimiter','\n');
disp(intro{1})


% Data
%while (~feof(file))
for i = 1:12
    sat_num = textscan(file,'%s',1,'Delimiter','\n');
    sat_data = textscan(file,'%s',7,'Delimiter','\n');
end



% Insert Comma's
A = sat_data{1};
for i = 1:length(A)
    if strlength(A{i}) > 75
        A{i} = insertAfter(A{i},57,",");
        A{i} = insertAfter(A{i},38,",");
        A{i} = insertAfter(A{i},19,",");    
    else
        A{i} = insertAfter(A{i},56,",");
        A{i} = insertAfter(A{i},37,",");
        A{i} = insertAfter(A{i},18,",");
    end
end

% Split at Comma's
A = strrep(A,"D","e")
B = split(A,",")
C = double(B) % To double



