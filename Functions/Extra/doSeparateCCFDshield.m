function [inDSIP, inDShieldDegree, inDShieldCCF] = doSeparateCCFDshield()
    allSIP = extractSIP();
    
    [inDSIP, inDSIP] = separateDshieldIPFull(allSIP);
    inDShieldDegree = sparse(length(inDSIP), 14);
    inDShieldCCF = sparse(length(inDSIP), 14);
    for day = 1:14
        load(['TempData/ccfsDay' int2str(day) '.mat']);
        load(['TempData/degreeDay' int2str(day) '.mat']);
        [nonCCFIP, nonCCFDshield, inCCFIP, inCCFDshield] = separateCCFDshieldFull(unsIP, ccfs, inDSIP);
        [nonDegreeIP, nonDegreeDshield, inDegreeIP, inDegreeDshield] = separateDshieldFull(unsIP, d_Gb);
        [CCFT, CCFI] = ismember(inDSIP, inCCFIP);
        [degreeT, degreeI] = ismember(inDSIP, inDegreeIP);
        
        if ~isequal(CCFT, degreeT) || ~isequal(CCFI, degreeI)
            fprintf('IP does not match.\n');
        end;
        
        for idx = 1:length(CCFI)
            %fprintf('idx = %d\n', idx);
            if CCFT(idx) == 1
                inDShieldDegree(idx, day) = inDegreeDshield(CCFI(idx));
                inDShieldCCF(idx, day) = inCCFDshield(CCFI(idx));
            end;
        end;
    end;
    inDShieldDegree = full(inDShieldDegree);
    inDShieldCCF = full(inDShieldCCF);
end