function [ timestring, messagestring ] = makeJsonArray( fileNames, fName )

rootDirectory = '/Users/parama/github/classes/affectiveSynchrony/data/analysis/notes/';

fid = fopen(sprintf('%s%s.txt',rootDirectory,fName),'w');            %# Open the file

if fid ~= -1

    for j=1:length(fileNames)
        

            load(sprintf('%s%snotes.mat',rootDirectory,fileNames{j}))
            eval(sprintf('notes = %s.note;',fileNames{j}))
            eval(sprintf('timevals = %s.time;',fileNames{j}))
            

            %Construct time array
            timestring = strcat(fileNames{j},'atimes = [');
            len = length(timevals)-1;
            for i=1:len
                timestring = sprintf('%s%d%',timestring,timevals(i));
                timestring = strcat(timestring,' , ');
            end
            timestring = sprintf('%s %d]',timestring,timevals(len+1));


            %Construct messages array
            messagestring = strcat(fileNames{j},'anotes = [');
            len = length(notes)-1;

            for i=1:len
                messagestring = sprintf('%s"%s"',messagestring,notes{i});
                messagestring = strcat(messagestring,' , ');
            end

            messagestring = sprintf('%s "%s"',messagestring,notes{len+1});
            messagestring = strcat(messagestring,' ]');


                fprintf(fid,'%s\n',timestring);
                fprintf(fid,'%s\n',messagestring);


    end
    
    fclose(fid)

end
    

end