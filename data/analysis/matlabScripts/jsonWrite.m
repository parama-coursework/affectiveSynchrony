function [h]= jsonWrite(fileName, var,varname)
%UNTITLED3 Summary of this function goes here

fid = fopen(sprintf('%s.json',fileName), 'w');
v = sprintf('%s = %s',varname,var);
fprintf(fid, v);
fclose(fid);

h=0;
end

