function [ xZone, yZone ] = findZone( x, y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    x = single(x);  y = single(y);
    if x == 1.0
        xZone = 10;
    else
        for idx = 0:0.1:0.9
            %fprintf('%f <= %f < %f\n', idx, x, (idx+0.1));
            if (x >= idx) && (x < (idx + 0.1))
                %fprintf('%f <= %f < %f\n', idx, x, (idx+0.1));
                xZone = (idx + 0.1) * 10;
            end;
        end;
    end;
    
    if y == 10.0
        yZone = 1;
    else
        for idx = 0:9
            %fprintf('%f <= %f < %f\n', idx, y, (idx+1));
            if y >= idx && y < (idx + 1)
                %fprintf('%f <= %f < %f\n', idx, y, (idx+1));
                yZone = 10 - idx;
            end;
        end;
    end;
end

