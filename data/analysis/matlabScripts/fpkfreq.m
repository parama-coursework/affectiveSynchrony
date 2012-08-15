function [ out ] = fpkfreq(table,len,window)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

tally = 0;
mat = zeros(len-window,1);
%count how many peaks there are in selected window
for i=window:len-window
    for j=1:size(table,1)
        if(table(j,2)<i+window)
            if(table(j,2)>i)
                tally=tally+1;
            end
        end
        mat(i)=tally;
    end
    tally=0;
end

out = mat;

