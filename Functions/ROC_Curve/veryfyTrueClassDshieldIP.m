function [T, i] = veryfyTrueClassDshieldIP(usIP, idx)
% Load all the data
%load(['idetproject/dshield_may0' int2str(idx) '.mat']);
load('idetproject/dshield_list_full.mat');

[T, i] = ismember(usIP, dshIP);
