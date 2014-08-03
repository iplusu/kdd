function mat = validation(lst)

load('idetproject/dshield_list_full.mat');
mat = [];

[t, i] = ismember(dshIP, lst);
result = find(t == 1);
mat = [dshIP(result)];
