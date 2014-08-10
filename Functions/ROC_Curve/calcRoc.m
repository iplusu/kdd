function [TP, FP, TH, d_Gb] = calcRoc(type, day)

format longG
% Initialize the return data
TP = [];
FP = [];
TH = [];

% Calcuate the degrees of the day.
% [unsIP, d_Gb] = oneDayR(day);
load(sprintf('TempData/degree%s%d.mat', type, day));

% Find and sort the unique degrees.
% uDegree = full(sort(unique(d_Gb)));
% uDegree = [0; uDegree];
% udLen = length(uDegree);

% Count the number of nodes in the DShield data on the day (TPi)
% Count the number of nodes not in the DShield data on the day (FPi)
% [T, i] = veryfyTrueClassDshieldIP(unsIP, day);
[T, i] = ismember(unsIP, malIP);
%Pi = sum(T);
%Ni = sum(T==0);

for idx = 1:max(d_Gb)
    TPi = 0;    FPi = 0;    FNi = 0;    TNi = 0;
    
    for idx2 = 1:length(T)
%         if d_Gb(idx2) > uDegree(idx)
%             Pi = Pi + 1;
%         else
%             Ni = Ni + 1;
%         end;
%         
%         if (T(idx2) == 1) && (d_Gb(idx2) > uDegree(idx))
%             TPi = TPi + 1;
%         elseif (T(idx2) == 0) && (d_Gb(idx2) > uDegree(idx))
%             FPi = FPi + 1;
%         end;

        if d_Gb(idx2) >= idx && T(idx2) == 1
            TPi = TPi + 1;
        end;
        
        if d_Gb(idx2) >= idx && T(idx2) == 0
            FPi = FPi + 1;
        end;
        
        if d_Gb(idx2) < idx && T(idx2) == 1
            FNi = FNi + 1;
        end;
        
        if d_Gb(idx2) < idx && T(idx2) == 0
            TNi = TNi + 1;
        end;
    end;
    fprintf('TPi:%d\t FPi:%d\t FNi:%d\t TNi:%d\n', TPi, FPi, FNi, TNi);
    Pi = TPi + FNi;
    Ni = FPi + TNi;
    % Prevent zero divisions.
    if Pi == 0
        TP = [TP 0];
    else
        TP = [TP TPi/Pi];
    end;
    
    if Ni == 0
        FP = [FP 0];
    else
        FP = [FP FPi/Ni];
    end;
    TH = [TH idx];
end;
TH = full(TH);