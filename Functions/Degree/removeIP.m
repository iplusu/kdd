function [sIP, dIP] = removeIP(sIP, dIP, tIP)

[r, c, v] = find(sIP == tIP);

[sIP, PS] = removerows(sIP, 'ind', r');
[dIP, PS] = removerows(dIP, 'ind', r');

[r, c, v] = find(dIP == tIP);

[sIP, PS] = removerows(sIP, 'ind', r');
[dIP, PS] = removerows(dIP, 'ind', r');

% keepLoop = true;
% 
% while (keepLoop)
%     [T, I] = ismember(sIP, tIP);
%     all = sum(T == 1);
%     if mod(all, 100) == 0
%         fprintf('%d Left.\n', all);    
%     end;
%     
%     [T, I] = ismember(tIP, sIP);
%     if T == 1
%         [sIP, PS] = removerows(sIP, 'ind', I);
%         [dIP, PS] = removerows(dIP, 'ind', I);
%     else
%         keepLoop = false;
%     end;
% end;
