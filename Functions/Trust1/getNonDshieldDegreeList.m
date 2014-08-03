function [ndshIP, dState, summation] = getDshieldDegreeList(from, to, th)

load('idetproject/dshield_list_full.mat');
unsIP = extractSIP();
[t,i] = ismember(unsIP, dshIP);
notIn_Dshield = find(t==0);
ndshIP = [];
for inner = 1:length(notIn_Dshield)
    %fprintf('inner:%d\t notIn_Dshield(inner):%d unsIP:%d \n', inner, notIn_Dshield(inner), unsIP(notIn_Dshield(inner)));
    %ndshIP(inner,1) = unsIP(notIn_Dshield(inner));
    ndshIP = [ndshIP; unsIP(notIn_Dshield(inner))];
end;

dState = sparse(length(ndshIP), 14);

for idx = from:to
    [udsIP, d_Gb] = oneDayR(idx);
    [t,i] = ismember(ndshIP, udsIP);
    notIn_Dshield = find(t==1);
    for inner = 1:length(notIn_Dshield)
        %fprintf('i(in_Dshield(inner)):%d\t in_Dshield(inner):%d \n', i(in_Dshield(inner)), in_Dshield(inner));
        %dState(i(in_Dshield(inner)), idx) = d_Gb(in_Dshield(inner));
        dState(notIn_Dshield(inner), idx) = d_Gb(i(notIn_Dshield(inner)));
    end;
end;

dState = full(dState);
summation = sum(dState, 2);
dState = dState(find(summation > 0), :);
ndshIP = ndshIP(find(summation > 0), :);
summation = sum(dState, 2);
