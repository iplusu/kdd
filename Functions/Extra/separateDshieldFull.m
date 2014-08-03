function [nonIP, nonDshield, inIP, inDshield] = separateDshieldFull(usIP, matrix)
% Load all the data
load('idetproject/dshield_list_full.mat');

nonDshield = [];
nonIP = [];
inDshield = [];
inIP = [];

[t, i] = ismember(usIP, dshIP);

for idx = 1:length(usIP)
    if t(idx) == 1
        inDshield = [inDshield; matrix(idx,:)];
        inIP = [inIP; usIP(idx)];
    else
        nonDshield = [nonDshield; matrix(idx,:)];
        nonIP = [nonIP; usIP(idx)];
    end;
end;