function [udsIP, ccState] = getCCList(from, to)

udsIP = extractSIP();
ccState = sparse(length(udsIP), 14);

for idx = from:to
    %load(['TempData/degreeDay' int2str(idx) '.mat']);
    load(['TempData/ccfsDay' int2str(idx) '.mat']);
    [t,i] = ismember(udsIP, unsIP);
    in_List = find(t==1);
    for inner = 1:length(in_List)
        %fprintf('i(in_List(inner)):%d\t in_List(inner):%d \n', i(in_List(inner)), in_List(inner));
        %dState(i(in_List(inner)), idx) = d_Gb(in_List(inner));
        ccState(in_List(inner), idx) = ccfs(i(in_List(inner)));
    end;
end;

ccState = full(ccState);

