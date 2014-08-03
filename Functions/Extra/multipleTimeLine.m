function mat = multipleTimeLine(idxStart, idxEnd)
mat = [];
for idx = idxStart:idxEnd
    tmp = oneDayTimeLine(idx);
    tmp = [tmp(:,1) tmp(:,2) tmp(:,3)+((idx-1)*86400)];
    mat = [mat ; tmp];
end;