function [TP, FP, TH] = calcTrustRoc(threshold)

format longG
% Initialize the return data
TP = [];
FP = [];
TH = [];

% Calcuate the Trusts.
load('TempData/DegreeData.mat');
%[dshieldDegreeIP, dshieldDegree, dshieldDegree_summation] = getDshieldDegreeList(1, 14, threshold);
%[nonDshieldDegreeIP, nonDshieldDegree, nonDshieldDegree_summation] = getNonDshieldDegreeList(1, 14, threshold);
[dshieldUnsIP, dshieldTrust1] = calcTrust1(dshieldDegreeIP, dshieldDegree, threshold);
[nonDshieldUnsIP, nonDshieldTrust1] = calcTrust1(nonDshieldDegreeIP, nonDshieldDegree, threshold);

% Count the number of nodes in the DShield data on the day (TPi)
% Count the number of nodes not in the DShield data on the day (FPi)
%Pi = length(dshieldDegreeIP);
%Ni = length(nonDshieldDegreeIP);

for idx = 0:0.01:1.0
%     % Count the number of degrees that are greater than or equal to a unique degree.
%     TPi = sum(dshieldTrust1(:,14) <= idx);
%     % Count the number of degrees that are lesser than a unique degree.
%     FPi = sum(nonDshieldTrust1(:,14) <= idx);

    TPi = sum(dshieldTrust1(:,14) <= idx);
    FPi = sum(nonDshieldTrust1(:,14) <= idx);
    FNi = sum(dshieldTrust1(:,14) > idx);
    TNi = sum(nonDshieldTrust1(:,14) > idx);
    
    Pi = TPi + FNi;
    Ni = TNi + FPi;
%      Pi = TPi + FPi;
%      Ni = TNi + FNi;
    
    fprintf('TPi:%d\t FPi:%d\t FNi:%d\t TNi:%d\t Pi:%d\t Ni:%d\n', TPi, FPi, FNi, TNi, Pi, Ni);
    % Prevent zero divisions.
    if Pi == 0
        TP = [TP TPi];
    else
        TP = [TP TPi/Pi];
    end;
    
    if Ni == 0
        FP = [FP FPi];
    else
        FP = [FP FPi/Ni];
    end;
    TH = [TH idx];
end;
TH = full(TH);