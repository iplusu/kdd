load('TempData\kmeans3Groups.mat');
allDegree = [dshieldDegree;nonDshieldDegree];

[DShieldGrp1Mini, DShieldGrp1Median, DShieldGrp1Mean, DShieldGrp1Max, DShieldGrp1Std] = stats(DShieldGrp1);
[DShieldGrp2Mini, DShieldGrp2Median, DShieldGrp2Mean, DShieldGrp2Max, DShieldGrp2Std] = stats(DShieldGrp2);
[DShieldGrp3Mini, DShieldGrp3Median, DShieldGrp3Mean, DShieldGrp3Max, DShieldGrp3Std] = stats(DShieldGrp3);

[nonDShieldGrp1Mini, nonDShieldGrp1Median, nonDShieldGrp1Mean, nonDShieldGrp1Max, nonDShieldGrp1Std] = stats(nonDShieldGrp1);
[nonDShieldGrp2Mini, nonDShieldGrp2Median, nonDShieldGrp2Mean, nonDShieldGrp2Max, nonDShieldGrp2Std] = stats(nonDShieldGrp2);
[nonDShieldGrp3Mini, nonDShieldGrp3Median, nonDShieldGrp3Mean, nonDShieldGrp3Max, nonDShieldGrp3Std] = stats(nonDShieldGrp3);

[allGrp1Mini, allGrp1Median, allGrp1Mean, allGrp1Max, allGrp1Std] = stats(allGrp1);
[allGrp2Mini, allGrp2Median, allGrp2Mean, allGrp2Max, allGrp2Std] = stats(allGrp2);
[allGrp3Mini, allGrp3Median, allGrp3Mean, allGrp3Max, allGrp3Std] = stats(allGrp3);