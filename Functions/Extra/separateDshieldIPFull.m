function [nonIP, inIP] = separateDshieldIPFull(usIP)
% Load all the data
load('idetproject/dshield_list_full.mat');

nonIP = [];
inIP = [];

[t, i] = ismember(usIP, dshIP);

for idx = 1:length(usIP)
    if t(idx) == 1
        inIP = [inIP; usIP(idx)];
    else
        nonIP = [nonIP; usIP(idx)];
    end;
end;