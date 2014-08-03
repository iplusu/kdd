[actionIP, action, action_summation] = getDshieldActiveList(1, 14);
[degreeIP, degree, degree_summation] = getDshieldDegreeList(1, 14, 100);

meanOfDegree = mean2(degree);
stdOfDegree = std2(degree);