function [ ] = drawHeatmapCC( )
%DRAWHEATMAPCC Summary of this function goes here
%   Detailed explanation goes here
    load(['TempData/kmeans3GroupsCC.mat']);
    [s,idx] = sort(classAll);
    figure;
    imagesc(allCC(idx,:));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title(['All 14 days Clustering Coefficient Heatmap - 3 Groups'], 'FontSize', 20);
    
    load(['TempData/kmeans3Groups.mat']);
    [s,idx] = sort(classAll);
    figure;
    imagesc(log(allDegree(idx,:)));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title(['All 14 days Degree Heatmap - 3 Groups'], 'FontSize', 20);
    
    tmp = [allCCGrp1;allCCGrp3];
    figure;
    imagesc(tmp);
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title(['All 14 days Clustering Coefficient Heatmap - 2 Groups w/ 0'], 'FontSize', 20);
    
    load(['TempData/kmeans3GroupsCC.mat']);
    i=find(allCC==0);
    allCC(i)=1.04;
    [s,idx] = sort(classAll);
    figure;
    imagesc(allCC(idx,:));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title(['All 14 days Clustering Coefficient Heatmap - 3 Groups w/o 0'], 'FontSize', 20);
    colormapeditor;
    
    tmp = [allCCGrp1;allCCGrp3];
    i=find(tmp==0);
    tmp(i)=1.04;
    figure;
    imagesc(tmp);
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title(['All 14 days Clustering Coefficient Heatmap - 2 Groups w/o 0'], 'FontSize', 20);
    colormapeditor;
end

