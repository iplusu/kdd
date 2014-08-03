function [ myFigure ] = drawSeparatedScatterWOLog( day )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    hold off;
    
    load(['TempData/ccfsDay' int2str(day) '.mat']);
    [nonCIP, nonCDshield, inCIP, inCDshield] = separateDshieldFull(unsIP, ccfs);
    
    load(['TempData/degreeDay' int2str(day) '.mat']);
    [nonDIP, nonDDshield, inDIP, inDDshield] = separateDshieldFull(unsIP, d_Gb);
    
    scatter(nonCDshield,nonDDshield, 25, 'Black', 'fill')
    hold on;
    scatter(inCDshield,inDDshield, 25, 'Red', 'fill'), grid on, grid minor;
    xlabel('Clustering Coefficient', 'FontSize', 20);
    ylabel('Degree', 'FontSize', 20);
    myFigure = title(['Day - ' int2str(day) ' Without Log'], 'FontSize', 20);
end

