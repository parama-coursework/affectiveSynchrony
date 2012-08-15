function [ inter ] = sessionMarkers( ses )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

soln = ones(max(ses)+1,2);
soln(max(ses)+1,2) = length(ses);

for i=5:length(ses)
    if ses(i)>ses(i-1)
        soln(ses(i)+1,1)=i;
        soln(ses(i-1)+1,2)=i-1;
    end
end
soln = unique(soln,'rows');
inter = soln;
