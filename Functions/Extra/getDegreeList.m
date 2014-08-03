function [unsIP, dState, summation] = getDegreeList(from, to, th)

unsIP = extractSIP();
dState = sparse(length(unsIP), 14);

for idx = from:to
    [udsIP, d_Gb] = oneDayR(idx);
    [t,i] = ismember(unsIP, udsIP);
    in_List = find(t==1);
    for inner = 1:length(in_List)
        %fprintf('i(in_List(inner)):%d\t in_List(inner):%d \n', i(in_List(inner)), in_List(inner));
        %dState(i(in_List(inner)), idx) = d_Gb(in_List(inner));
        dState(in_List(inner), idx) = d_Gb(i(in_List(inner)));
    end;
end;

dState = full(dState);
summation = sum(dState, 2);
