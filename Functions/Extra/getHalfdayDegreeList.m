function [ unsIP, dState, summation ] = getHalfdayDegreeList( from, to )
%GETHALFDAYDEGREELIST Summary of this function goes here
%   Detailed explanation goes here
    unsIP = extractSIP();
    dState = sparse(length(unsIP), 28);

    for idx = from:to
        [ firstHalfsIP, firstHalfd_Gb, secondHalfsIP, secondHalfd_Gb ] = halfDay( idx );
        
        [t,i] = ismember(unsIP, firstHalfsIP);
        in_List = find(t==1);
        for inner = 1:length(in_List)
            %fprintf('i(in_List(inner)):%d\t in_List(inner):%d \n', i(in_List(inner)), in_List(inner));
            %dState(i(in_List(inner)), idx) = firstHalfd_Gb(in_List(inner));
            dState(in_List(inner), idx + (idx - 1)) = firstHalfd_Gb(i(in_List(inner)));
        end;
        
        [t,i] = ismember(unsIP, secondHalfsIP);
        in_List = find(t==1);
        for inner = 1:length(in_List)
            %fprintf('i(in_List(inner)):%d\t in_List(inner):%d \n', i(in_List(inner)), in_List(inner));
            %dState(i(in_List(inner)), idx) = secondHalfd_Gb(in_List(inner));
            dState(in_List(inner), idx + idx) = secondHalfd_Gb(i(in_List(inner)));
        end;
    end;

    dState = full(dState);
    summation = sum(dState, 2);

end

