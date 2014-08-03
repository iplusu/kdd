function [ inIP, inDshield, nonIP, nonDshield ] = extractByPort( day, port )
%extractByPort
%   Extract the degrees by port.
    load(['idetproject/data_may0' int2str(day) '.mat']);
    eSIP = [];
    eDIP = [];
    portList = find(dPort == port);

    for idx = 1:length(portList)
        eSIP = [eSIP; sIP(portList(idx))];
        eDIP = [eDIP; dIP(portList(idx))];
    end;

    %[eSIP, eDIP] = removeIP(eSIP, eDIP, 2439063451);
    %[eSIP, eDIP] = removeIP(eSIP, eDIP, 2439063452);
    
    unsIP = unique(eSIP);
    undIP = unique(eDIP);
    [t, nsIP] = ismember(eSIP, unsIP);
    [t, ndIP] = ismember(eDIP, undIP);
    
    tmpA = sparse(nsIP, ndIP, 1);
    d_Gb = sum(tmpA > 0, 2);
    d_Gb = full(d_Gb);
    
    load('idetproject/dshield_list_full.mat');

    nonIP = []; nonDshield = [];
    inIP = [];  inDshield = [];

    [t, i] = ismember(unsIP, dshIP);

    for idx = 1:length(unsIP)
        if t(idx) == 1
            inIP = [inIP; unsIP(idx)];
            inDshield = [inDshield; d_Gb(idx)];
        else
            nonIP = [nonIP; unsIP(idx)];
            nonDshield = [nonDshield; d_Gb(idx)];
        end;
    end;
end

