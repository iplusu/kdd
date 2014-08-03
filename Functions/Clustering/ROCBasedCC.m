function [ CCTPR, CCFPR, TH ] = ROCBasedCC( day )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    CCTPR = [];
    CCFPR = [];
    TH = [];

    load(['TempData/ccfsDay' int2str(day) '.mat']);
    %[ unsIP, ccfs ] = eleminateZero( unsIP, ccfs );
    [nonIP, nonDshield, inIP, inDshield] = separateDshieldFull(unsIP, ccfs);
    
    for cc_th = 0.0:0.01:1.0
        TPi = inDshield <= cc_th;
        TPi = sum(TPi, 2) >= 1;
        TPi = sum(TPi);
        
        FNi = inDshield <= cc_th;
        FNi = sum(FNi, 2) < 1;
        FNi = sum(FNi);
        
        FPi = nonDshield <= cc_th;
        FPi = sum(FPi, 2) >= 1;
        FPi = sum(FPi);

        TNi = nonDshield <= cc_th;
        TNi = sum(TNi, 2) < 1;
        TNi = sum(TNi);
        
        Pi = TPi + FNi;
        Ni = TNi + FPi;
    %      Pi = TPi + FPi;
    %      Ni = TNi + FNi;

        %fprintf('TPi:%d\t FPi:%d\t FNi:%d\t TNi:%d\t Pi:%d\t Ni:%d\n', TPi, FPi, FNi, TNi, Pi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            CCTPR = [CCTPR TPi];
        else
            CCTPR = [CCTPR TPi/Pi];
        end;

        if Ni == 0
            CCFPR = [CCFPR FPi];
        else
            CCFPR = [CCFPR FPi/Ni];
        end;
        TH = [TH cc_th];
    end;
    TH = full(TH);
end

