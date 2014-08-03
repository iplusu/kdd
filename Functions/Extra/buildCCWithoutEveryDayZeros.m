function [ nonIPCC, nonDshieldCC, inIPCC, dshieldCC ] = buildCCWithoutEveryDayZeros( )
    fNonIPCC = [];  fNonDshieldCC = [];	fInIPCC = [];   fDshieldCC = [];
    load('TempData/CCData.mat');
    
%     res = sum(nonDshieldCC == 0, 2);
%     res = find(res < 14);
%     for idx = 1:length(res)
%         fNonIPCC = [fNonIPCC; nonIPCC(res(idx))];
%         fNonDshieldCC = [fNonDshieldCC; nonDshieldCC(res(idx), :)];
%     end;
    
    res = sum(dshieldCC == 0, 2);
    res = find(res < 14);
    for idx = 1:length(res)
        fInIPCC = [fInIPCC; inIPCC(res(idx))];
        fDshieldCC = [fDshieldCC; dshieldCC(res(idx), :)];
    end;
    
    nonIPCC = fNonIPCC; nonDshieldCC = fNonDshieldCC;
    inIPCC = fInIPCC;   dshieldCC = fDshieldCC;
end

