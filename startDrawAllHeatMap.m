for idx = 1:14
    figure;
    [ res ] = drawHeatmap( idx );
    colormap('hot');imagesc(res);colorbar;axis off;
    xlabel('Clustering Coefficient', 'FontSize', 20);
    ylabel('Degree', 'FontSize', 20);
    myFigure = title(['All HeatMap Day - ' int2str(idx)], 'FontSize', 20);
end;