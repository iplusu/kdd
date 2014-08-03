[nonDshieldDegreeIP, nonDshieldDegree, nonDshieldDegree_summation] = getNonDshieldDegreeList(1, 14, 80);
[nonDshieldUnsIP, nonDshieldTrust1] = calcTrust1(nonDshieldDegreeIP, nonDshieldDegree, 80);

[nonDshieldDist, nonDshieldDistRatio] = trust1Distribution(nonDshieldTrust1);