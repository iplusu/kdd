function [nonIPCC, nonDshieldCC, inIPCC, dshieldCC] = separateCCFDshieldFull(usIP, matrix, dshIP)
% Load all the data

nonIPCC = [];
nonDshieldCC = [];
inIPCC = [];
dshieldCC = [];

[t, i] = ismember(usIP, dshIP);

for idx = 1:length(usIP)
    %fprintf('idx = %d\n', idx);
    if t(idx) == 1
        inIPCC = [inIPCC; usIP(idx)];
        dshieldCC = [dshieldCC; matrix(idx,:)];
    else
        nonIPCC = [nonIPCC; usIP(idx)];
        nonDshieldCC = [nonDshieldCC; matrix(idx,:)];
    end;
end;