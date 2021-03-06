function [unsIP, Gp] = oneDayP(type, idx)
% Load all the data
load(sprintf('datasets/kdd1998%s%d.mat', type, idx));

[sIP, dIP] = removeIP(sIP, dIP, 2439063451);
[sIP, dIP] = removeIP(sIP, dIP, 2439063452);

unsIP = unique(sIP);
undIP = unique(dIP);

[t, nsIP] = ismember(sIP, unsIP);
[t, ndIP] = ismember(dIP, undIP);

tmpA = sparse(nsIP, ndIP, 1);
d_Gb = sum(tmpA > 0, 2);
d_Gb = full(d_Gb);

Gp = 1 * (tmpA * tmpA') > 0;
Sp = speye(length(unsIP));
Gp = Gp - Sp; 
Bp = 1*(tmpA>0);
%Bp = [unsIP Bp];
