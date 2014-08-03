function mat = extractDegreeList(from, to, th)

[unsIP, degree, summation] = getDegreeList(from, to, th);
findResult = find(summation >= from & summation <=to);
mat = [unsIP(findResult,:) degree(findResult,:) summation(findResult,:)];