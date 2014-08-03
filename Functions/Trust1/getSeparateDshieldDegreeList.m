function [nonDshIP, dState, summation] = getSeparateDshieldDegreeList(from, to, th)

[allDegreeIP, allDegree, allDegree_summation] = getDegreeList(1, 14, 100);

[nonDshIP, dState, inIP, inDshield] = separateDshieldFull(allDegreeIP, allDegree);
summation = sum(dState, 2);
