function mat = oneDayTimeLine(idx)
% Load all the data
load(['idetproject/data_may0' int2str(idx) '.mat']);
mat = [sIP dIP sTime];
mat = sortrows(mat, 3);