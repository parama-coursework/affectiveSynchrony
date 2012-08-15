load('A0.xls.mat');
foo = Child_EDA_Foot_1_0;
for i=1:10 
    figure(); 
    plot(foo(i*500:(i+1)*500-1)) 
end