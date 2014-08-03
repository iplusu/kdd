function [ res ] = drawHeatmap( day )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    load(['TempData/ccfsDay' int2str(day) '.mat']);
    load(['TempData/degreeDay' int2str(day) '.mat']);
    
    d_GbLog = log(d_Gb);
    pairs = [ccfs(:) d_GbLog(:)];
    res = zeros(10,10);
    cnt = 0;
    for idx = 1:length(pairs)
        try
            [xZone, yZone] = findZone(pairs(idx, 1), pairs(idx,2));
            xZone = int64(xZone);
            yZone = int64(yZone);
%              if pairs(idx, 1) == 0 && pairs(idx,2) == 0
%                  fprintf('x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
%                  cnt = cnt + 1;
%              end;
            res(yZone, xZone) = res(yZone, xZone) + 1;
        catch
            fprintf('err - x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
            break;
        end;
    end;
end

