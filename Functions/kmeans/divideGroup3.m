function [ grp1, grp1IP, grp2, grp2IP, grp3, grp3IP ] = divideGroup3( group_data, degree, IP )
%DIVIDEGROUP Summary of this function goes here
%   Detailed explanation goes here
    grp1 = []; grp2 = []; grp3 = [];
    grp1IP = []; grp2IP = []; grp3IP = [];
    for idx = 1:length(group_data)
        if (group_data(idx) == 1)
            grp1 = [grp1; degree(idx, :)];
            grp1IP = [grp1IP; IP(idx, :)];
        elseif (group_data(idx) == 2)
            grp2 = [grp2; degree(idx, :)];
            grp2IP = [grp2IP; IP(idx, :)];
        elseif (group_data(idx) == 3)
            grp3 = [grp3; degree(idx, :)];
            grp3IP = [grp3IP; IP(idx, :)];
        else
            print('error in divideGroup3');
            break;
        end;
    end;
end

