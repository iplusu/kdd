[dshieldDegreeIP, dshieldDegree, dshieldDegree_summation] = getDshieldDegreeList(1, 14, 80);
[dshieldUnsIP, dshieldTrust1] = calcTrust1(dshieldDegreeIP, dshieldDegree, 80);

[dshieldDist, dshieldDistRatio] = trust1Distribution(dshieldTrust1);