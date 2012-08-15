function [ out ] = subtractArousal( in )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

boo = ksrlin(1:length(in),in);
figure(1)
plot(boo.x,boo.f,1:length(in),in)

out = zeros(length(in),1);
counter = 1;
for i=1:length(in)
    if(i<=boo.x(counter))
        out(i)= boo.f(counter);
    else
        counter=counter+1;
        out(i)= boo.f(counter);
    end
end
figure(2)
plot(out)
sizer = size(in)
sizer2 = size(out)
maxer= max(out)
out = in-out;
figure(3)
plot(out)
    

end

