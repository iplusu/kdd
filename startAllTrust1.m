[allDegreeIP, allDegree, allDegree_summation] = getDegreeList(1, 14, 80);
[allUnsIP, allTrust1] = calcTrust1(allDegreeIP, allDegree, 80);

[allDist, allDistRatio] = trust1Distribution(allTrust1);