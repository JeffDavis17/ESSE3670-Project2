%% This function Returns receiver time for satellite positioning

function [hr,m,s,pseudo] = get_time(tab,i)
    rt = table2array(tab(:,2)); % Receiver Times
    rt_hr(:) = floor(rt*24);
    rt_min(:) = (rt(:)*24 - rt_hr(:))*60;
    rt_sec(:) = (rt_min(:) - floor(rt_min(:)))*60;
    pseudos = table2array(tab(:,3)); % Pseudoranges
    
    hr = rt_hr(i);
    m = rt_min(i);
    s = rt_sec(i);
    pseudo = str2double(pseudos(i));
end



