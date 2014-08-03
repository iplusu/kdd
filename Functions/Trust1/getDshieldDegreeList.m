function [dshIP, dState, summation] = getDshieldDegreeList(from, to, th)

load('idetproject/dshield_list_full.mat');
dState = sparse(length(dshIP), 14);

for idx = from:to
    [udsIP, d_Gb] = oneDayR(idx);
    [t,i] = ismember(dshIP, udsIP);
    in_Dshield = find(t==1);
    for inner = 1:length(in_Dshield)
        %fprintf('i(in_Dshield(inner)):%d\t in_Dshield(inner):%d \n', i(in_Dshield(inner)), in_Dshield(inner));
        %dState(i(in_Dshield(inner)), idx) = d_Gb(in_Dshield(inner));
        dState(in_Dshield(inner), idx) = d_Gb(i(in_Dshield(inner)));
    end;
end;

dState = full(dState);
summation = sum(dState, 2);
dState = dState(find(summation > 0), :);
dshIP = dshIP(find(summation > 0), :);
summation = sum(dState, 2);
