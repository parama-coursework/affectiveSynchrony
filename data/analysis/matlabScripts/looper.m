function [data]= looper(start,ender)
%UNTITLED2 Summary of this function goes here
% 
[s,v]=checkSubs(start,ender);

for i=start:ender
    if s(i)
        data{i}=plotRegs(i)
        close all hidden;
    end
end

