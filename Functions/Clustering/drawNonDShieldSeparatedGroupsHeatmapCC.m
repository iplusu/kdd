function [ myFigure1, myFigure2, myFigure3 ] = drawNonDShieldSeparatedGroupsHeatmapCC( dayIdx )
%DRAWSEPARATEDGROUPSHEATMAP Summary of this function goes here
%   Detailed explanation goes here
    [ group1ND, group1NCC, group2ND, group2NCC, group3ND, group3NCC ] = separateNonDShieldCCGroups( );
    
    figure;
    d_GbLog = log(group1ND(:, dayIdx) + 1);
    pairs = [group1NCC(:, dayIdx) d_GbLog(:)];
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
    myFigure1 = title(['NonDShield Heatmap Day - ' int2str(dayIdx) ' Group ' int2str(length(group1ND))], 'FontSize', 20);
    
    figure;
    d_GbLog = log(group2ND(:, dayIdx) + 1);
    pairs = [group2NCC(:, dayIdx) d_GbLog(:)];
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
    myFigure2 = title(['NonDShield Heatmap Day - ' int2str(dayIdx) ' Group ' int2str(length(group2ND))], 'FontSize', 20);
    
    figure;
    d_GbLog = log(group3ND(:, dayIdx) + 1);
    pairs = [group3NCC(:, dayIdx) d_GbLog(:)];
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
    myFigure3 = title(['NonDShield Heatmap Day - ' int2str(dayIdx) ' Group ' int2str(length(group3ND))], 'FontSize', 20);
end

