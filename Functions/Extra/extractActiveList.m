function mat = extractActiveList(from, to)

[unsIP, action, summation] = getActiveList(from, to);
findResult = find(summation >= from & summation <=to);
mat = [unsIP(findResult,:) action(findResult,:) summation(findResult,:)];