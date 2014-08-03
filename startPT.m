load('TempData\kmeans3Groups.mat');
[ th10All ] = calcPT( allDegree, 10 );
[th10Alldist, th10AlldistRatio ]= trust1Distribution(th10All);
[ th10All1 ] = calcPT( allGrp1, 10 );
[th10All1dist, th10All1distRatio ]= trust1Distribution(th10All);
[ th10All2 ] = calcPT( allGrp2, 10 );
[th10All2dist, th10All2distRatio ]= trust1Distribution(th10All);
[ th10All3 ] = calcPT( allGrp3, 10 );
[th10All3dist, th10All3distRatio ]= trust1Distribution(th10All);
[ th50All ] = calcPT( allDegree, 50 );
[th50Alldist, th50AlldistRatio ]= trust1Distribution(th10All);
[ th50All1 ] = calcPT( allGrp1, 50 );
[th50All1dist, th50All1distRatio ]= trust1Distribution(th10All);
[ th50All2 ] = calcPT( allGrp2, 50 );
[th50All2dist, th50All2distRatio ]= trust1Distribution(th10All);
[ th50All3 ] = calcPT( allGrp3, 50 );
[th50All3dist, th50All3distRatio ]= trust1Distribution(th10All);
[ th100All ] = calcPT( allDegree, 100 );
[th100Alldist, th100AlldistRatio ]= trust1Distribution(th10All);
[ th100All1 ] = calcPT( allGrp1, 100 );
[th100All1dist, th100All1distRatio ]= trust1Distribution(th10All);
[ th100All2 ] = calcPT( allGrp2, 100 );
[th100All2dist, th100All2distRatio ]= trust1Distribution(th10All);
[ th100All3 ] = calcPT( allGrp3, 100 );
[th100All3dist, th100All3distRatio ]= trust1Distribution(th10All);

tmp0 = [th10All(:, 14), th50All(:, 14), th100All(:, 14)];
tmp1 = [th10All1(:, 14) th50All1(:, 14) th100All1(:, 14)];
tmp2 = [th10All2(:, 14) th50All2(:, 14) th100All2(:, 14)];
tmp3 = [th10All3(:, 14) th50All3(:, 14) th100All3(:, 14)];

% figure;hist(tmp0);grid on;
% xlabel('PT', 'FontSize', 20);ylabel('Nodes', 'FontSize', 20);
% title('Min:2 Max:3 All', 'FontSize', 20);hleg1 = legend('TH:10','TH:50','TH:100');set(hleg1,'Location','NorthWest');
% 
% figure;hist(tmp1);grid on;
% xlabel('PT', 'FontSize', 20);ylabel('Nodes', 'FontSize', 20);
% title('Min:5 Max:8 Group 1', 'FontSize', 20);hleg1 = legend('TH:10','TH:50','TH:100');set(hleg1,'Location','NorthWest');
% 
% figure;hist(tmp2);grid on;
% xlabel('PT', 'FontSize', 20);ylabel('Nodes', 'FontSize', 20);
% title('Min:5 Max:8 Group 2', 'FontSize', 20);hleg1 = legend('TH:10','TH:50','TH:100');set(hleg1,'Location','NorthWest');
% 
% figure;hist(tmp3);grid on;
% xlabel('PT', 'FontSize', 20);ylabel('Nodes', 'FontSize', 20);
% title('Min:5 Max:8 Group 3', 'FontSize', 20);hleg1 = legend('TH:10','TH:50','TH:100');set(hleg1,'Location','NorthWest');