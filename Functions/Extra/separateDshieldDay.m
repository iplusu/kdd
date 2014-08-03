function [nonIP, nonDshield, inIP, inDshield] = separateDshieldDay(usIP, matrix, idx)
% Load all the data
load(['idetproject/dshield_may0' int2str(idx) '.mat']);

nonDshield = [];
inDshield = [];

[t, i] = ismember(usIP, dshIP);

for idx = 1:length(usIP)
    if t(idx) == 1
        inDshield = [inDshield; matrix(idx)];
    else
        nonDshield = [nonDshield; matrix(idx)];
    end;
end;