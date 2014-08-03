function mat = divideTimeLine(matrix , minimum, maximum)
minIdx = find(matrix(:,3) >= minimum, 1, 'first');
maxIdx = find(matrix(:,3) <= maximum, 1, 'last');
mat = matrix(minIdx:maxIdx,:);
%for idx=1:length(matrix)
%    tmp = matrix(idx,3);
%    if tmp >= minimum && tmp <= maximum
%        mat = [mat ; matrix(idx,:)];
%    elseif tmp > maximum
%        break;
%    end;
%end;