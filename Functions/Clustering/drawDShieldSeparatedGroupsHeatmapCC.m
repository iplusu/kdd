function [ myFigure1, myFigure2, myFigure3 ] = drawDShieldSeparatedGroupsHeatmapCC( dayIdx )
%DRAWSEPARATEDGROUPSHEATMAP Summary of this function goes here
%   Detailed explanation goes here
    [ group1D, group1CC, group2D, group2CC, group3D, group3CC ] = separateDShieldCCGroups( );
    
    figure;
    d_GbLog = log(group1D(:, dayIdx) + 1);
    pairs = [group1CC(:, dayIdx) d_GbLog(:)];
    res = zeros(10,10);
    
    for idx = 1:length(pairs)
        try
            [xZone, yZone] = findZone(pairs(idx, 1), pairs(idx,2));
            xZone = int64(xZone);
            yZone = int64(yZone);
%             if pairs(idx, 1) == 0 && pairs(idx, 2) == 0
%                 fprintf('x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
%             end;
            res(yZone, xZone) = res(yZone, xZone) + 1;
        catch
            fprintf('err - x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
            break;
        end;
    end;
    res = flipud(res);
    imagesc(res);
    xlabel('Clustering Coefficient', 'FontSize', 20);
    ylabel('Degree', 'FontSize', 20);
    colorbar;
    set(gca,'YDir','normal')
    myFigure1 = title(['DShield Heatmap Day - ' int2str(dayIdx) ' Group ' int2str(length(group1D))], 'FontSize', 20);
    
    figure;
    d_GbLog = log(group2D(:, dayIdx) + 1);
    pairs = [group2CC(:, dayIdx) d_GbLog(:)];
    res = zeros(10,10);
    
    for idx = 1:length(pairs)
        try
            [xZone, yZone] = findZone(pairs(idx, 1), pairs(idx,2));
            xZone = int64(xZone);
            yZone = int64(yZone);
%             if pairs(idx, 1) == 0 && pairs(idx, 2) == 0
%                 fprintf('x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
%             end;
            res(yZone, xZone) = res(yZone, xZone) + 1;
        catch
            fprintf('err - x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
            break;
        end;
    end;
    res = flipud(res);
    imagesc(res);
    xlabel('Clustering Coefficient', 'FontSize', 20);
    ylabel('Degree', 'FontSize', 20);
    colorbar;
    set(gca,'YDir','normal')
    myFigure2 = title(['DShield Heatmap Day - ' int2str(dayIdx) ' Group ' int2str(length(group2D))], 'FontSize', 20);
    
    figure;
    d_GbLog = log(group3D(:, dayIdx) + 1);
    pairs = [group3CC(:, dayIdx) d_GbLog(:)];
    res = zeros(10,10);
    
    for idx = 1:length(pairs)
        try
            [xZone, yZone] = findZone(pairs(idx, 1), pairs(idx,2));
            xZone = int64(xZone);
            yZone = int64(yZone);
%             if pairs(idx, 1) == 0 && pairs(idx, 2) == 0
%                 fprintf('x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
%             end;
            res(yZone, xZone) = res(yZone, xZone) + 1;
        catch
            fprintf('err - x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
            break;
        end;
    end;
    res = flipud(res);
    imagesc(res);
    xlabel('Clustering Coefficient', 'FontSize', 20);
    ylabel('Degree', 'FontSize', 20);
    colorbar;
    set(gca,'YDir','normal')
    myFigure3 = title(['DShield Heatmap Day - ' int2str(dayIdx) ' Group ' int2str(length(group3D))], 'FontSize', 20);
end

