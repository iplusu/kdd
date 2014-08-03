function [unsIP, d_Gb] = oneDayR(idx)
% Load all the data
load(['idetproject/data_may0' int2str(idx) '.mat']);

% sIP = removeIP(sIP, 2439063451);
% dIP = removeIP(dIP, 2439063451);
% sIP = removeIP(sIP, 2439063452);
% dIP = removeIP(dIP, 2439063452);

[sIP, dIP] = removeIP(sIP, dIP, 2439063451);
[sIP, dIP] = removeIP(sIP, dIP, 2439063452);

unsIP = unique(sIP);
undIP = unique(dIP);

%unsIP = removeIP(unsIP, 2439063451);
%undIP = removeIP(undIP, 2439063451);
%unsIP = removeIP(unsIP, 2439063452);
%undIP = removeIP(undIP, 2439063452);
  
[t, nsIP] = ismember(sIP, unsIP);
[t, ndIP] = ismember(dIP, undIP);

tmpA = sparse(nsIP, ndIP, 1);
%tmpA = removeMostFrequentIP(tmpA, nsIP, ndIP);
d_Gb = sum(tmpA > 0, 2);
d_Gb = full(d_Gb);
% tmpA = removeIP(tmpA, sIP, dIP, 2439063451);
% tmpA = removeIP(tmpA, sIP, dIP, 2439063452);

%Gp = 1 * (tmpA * tmpA') > 0;
%Sp = speye(length(unsIP));
%Gp = Gp - Sp; 
%Bp = 1*(tmpA>0);
%d_Gb = sum(tmpA > 0, 2);
%Bp = [unsIP Bp];
