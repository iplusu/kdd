%function [ sTime, sIP, sPort, dIP, dPort ] = importKdd( path )
function [ sTime, sIP, dIP ] = importKdd( path )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    sTime = csvread(strcat(path, '/tcpdump.list_time.csv'));
    sIP = csvread(strcat(path, '/tcpdump.list_srcip_noperiod.csv'));
    %sPort = csvread(strcat(path, '/tcpdump.list_srcport.csv'));
    dIP = csvread(strcat(path, '/tcpdump.list_dstip_noperiod.csv'));
    %dPort = csvread(strcat(path, '/tcpdump.list_dstport.csv'));
end

