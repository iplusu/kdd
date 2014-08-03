function [dist, distRatio ]= trust1Distribution(trust)

dist = zeros(10, 14);
distRatio = zeros(10, 14);
size = length(trust);
for idx1 = 0:0.1:0.9
    for idx2 = 1:14
        % fprintf('idx1 = %d, idx2 = %d.\n', int8((idx1 * 10) + 1), idx2);
        if(idx1 == 0.9)
            dist(int8((idx1 * 10) + 1), idx2) = sum((trust(:, idx2) >= idx1) & (trust(:, idx2) <= (idx1 + 0.1)));
            distRatio(int8((idx1 * 10) + 1), idx2) = (sum((trust(:, idx2) >= idx1) & (trust(:, idx2) <= (idx1 + 0.1)))/size)*100;
            %fprintf('1. %d Left.\n', idx1);
        else
            dist(int8((idx1 * 10) + 1), idx2) = sum((trust(:, idx2) >= idx1) & (trust(:, idx2) <= (idx1 + 0.1)));
            distRatio(int8((idx1 * 10) + 1), idx2) = (sum((trust(:, idx2) >= idx1) & (trust(:, idx2) < (idx1 + 0.1)))/size)*100;
            %fprintf('2. %d Left.\n', idx1);
        end;
    end;
end;
