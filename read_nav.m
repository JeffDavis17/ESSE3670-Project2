%% This is a function that reads in the Navigation file and returns
% respective Variables


function [header, data] = read_nav(input)
    file = fopen(input); % Open File
    
    % Seperate Header Section 
    header = textscan(file,'%s',8,'Delimiter','\n');
    
    % Data for Each Observation
    sat_n = [];
    sat_d = [];
    while (~feof(file))        
        
        sat_num = textscan(file,'%s',1,'Delimiter','\n');
        sat_num = sat_num{1};
        sat_num = char(sat_num);

        % If there is a single digit at the start of sat info line
        if sat_num(2) == " "
            sat_num = insertAfter(sat_num,59,",");
            sat_num = insertAfter(sat_num,40,",");
            sat_num = insertAfter(sat_num,21,",");
            sat_num = insertAfter(sat_num,16,",");
            sat_num = insertAfter(sat_num,13,",");
            sat_num = insertAfter(sat_num,10,",");
            sat_num = insertAfter(sat_num,7,",");
            sat_num = insertAfter(sat_num,4,",");
            sat_num = insertAfter(sat_num,1,",");

        % If there is a double digit at start of sat info line    
        else
            sat_num = insertAfter(sat_num,60,",");
            sat_num = insertAfter(sat_num,41,",");
            sat_num = insertAfter(sat_num,22,",");
            sat_num = insertAfter(sat_num,17,",");
            sat_num = insertAfter(sat_num,15,",");
            sat_num = insertAfter(sat_num,12,",");
            sat_num = insertAfter(sat_num,8,",");
            sat_num = insertAfter(sat_num,5,",");
            sat_num = insertAfter(sat_num,2,",");
        end

        sat_num = strrep(sat_num,"D","e");
        sat_num = split(sat_num,",");
        sat_num = double(sat_num);
        sat_n = [sat_n;sat_num];     
        
        
        % Values
        sat_data = textscan(file,'%s',7,'Delimiter','\n');
        sat_data = sat_data{1};
        
        for i = 1:length(sat_data)
            if strlength(sat_data{i}) > 75
                sat_data{i} = insertAfter(sat_data{i},57,",");
                sat_data{i} = insertAfter(sat_data{i},38,",");
                sat_data{i} = insertAfter(sat_data{i},19,",");    
            else
                sat_data{i} = insertAfter(sat_data{i},56,",");
                sat_data{i} = insertAfter(sat_data{i},37,",");
                sat_data{i} = insertAfter(sat_data{i},18,",");
            end
        end
        
        sat_data = strrep(sat_data,"D","e");
        sat_data = split(sat_data,",");
        sat_data = double(sat_data);
        sat_data = [sat_data;zeros(3,4)];
        sat_d = [sat_d;sat_data];
    end
    data = [sat_n,sat_d];
end





