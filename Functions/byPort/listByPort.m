function [ pState ] = listByPort( from, to )
%SEPERATEBYPORT Summary of this function goes here
%   Detailed explanation goes here
unsIP = extractSIP();
pState = sparse(length(unsIP), 14);

for idx = from:to
    load(['idetproject/data_may0' int2str(idx) '.mat']);
    udsIP = unique(sIP);
    [t,i] = ismember(unsIP, udsIP);
    in_List = find(t==1);
    for inner = 1:length(in_List)
        %fprintf('i(in_List(inner)):%d\t in_List(inner):%d \n', i(in_List(inner)), in_List(inner));
        %dState(i(in_List(inner)), idx) = d_Gb(in_List(inner));
        pState(in_List(inner), idx) = dPort(i(in_List(inner)));
    end;
end;

pState = full(pState);
end

