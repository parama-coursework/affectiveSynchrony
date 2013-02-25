function [ success ] = writeSubjectDataToJson(fileNames, fName )
%actually produces js arrays. makes columnwise data for the plots for the
%subjects and writes them to a javascript file for easy pickup by the
%visualizations.

% ceda, oeda, cbp, cdelay, odelay, coc, cwc, cpf, opf, x

rootDirectory = '/Users/parama/github/classes/affectiveSynchrony/data/analysis/matfiles/';
outputDirectory = '/Users/parama/github/classes/affectiveSynchrony/data/analysis/json/';

format shortG;

%fid = fopen(sprintf('%s%s.js',outputDirectory,fName),'w');            %# Open the file

%if fid ~= -1

    for j=1:length(fileNames) %for each subject
        fid = fopen(sprintf('%s%s%s.js',outputDirectory,'c',fileNames{j}),'w');

            load(sprintf('%s%s%s.mat',rootDirectory,'c',fileNames{j})) %load subject data
            
            %first data plot
            eval(sprintf('ceda = c%s;',fileNames{j})) %raw child eda data
            eval(sprintf('oeda = o%s;',fileNames{j})) %raw occupational therapist eda data
            eval(sprintf('cbp = c%sbp;',fileNames{j})) %band pass child eda data
            eval(sprintf('obp = o%sbp;',fileNames{j})) %band pass occupational therapist eda data

            % delay data
            eval(sprintf('cdelay = c%sdelay;',fileNames{j})) %child delay
            eval(sprintf('odelay = o%sdelay;',fileNames{j})) %ot delay            
            
            %correlation plot
            eval(sprintf('coc = c%socc;',fileNames{j})) %cumulative/overall correlation
            eval(sprintf('cwc = c%swc;',fileNames{j})) %sliding window of correlation
            
            %peak frequency plot
            eval(sprintf('cpf = c%spfa;',fileNames{j})) %peak frequency child eda data
            eval(sprintf('opf = o%spfa;',fileNames{j})) %peak frequency occupational therapist eda data
            
            %x coordinates
            eval('x = x;') %x coordinates
           
            

            %Construct child raw subject eda array (ceda)
            c_raw = 'ceda= [';  %DONT FORGET TO CLOSE THE CURLY BRACE AT THE END
            len = length(ceda)-1;
            for i=1:len
                c_raw = sprintf('%s%10.5f',c_raw,ceda(i));
                c_raw = strcat(c_raw,',');
            end
            c_raw = sprintf('%s %10.5f];',c_raw,ceda(len+1));
            
            %Construct occupational therapist raw subject eda array (oeda)
            o_raw = 'oeda= ['; 
            len = length(oeda)-1;
            for i=1:len
                o_raw = sprintf('%s%10.5f',o_raw,oeda(i));
                o_raw = strcat(o_raw,',');
            end
            o_raw = sprintf('%s %10.5f];',o_raw,oeda(len+1));
             
            %Construct child band pass subject eda array (cbp)
            c_bp = 'cbp = ['; 
            len = length(cbp)-1;
            for i=1:len
                c_bp = sprintf('%s%10.5f',c_bp,cbp(i));
                c_bp = strcat(c_bp,' , ');
            end
            c_bp = sprintf('%s %10.5f];',c_bp,cbp(len+1));
            
            %Construct occupational therapist band pass subject eda array (cbp)
            o_bp = 'obp= ['; 
            len = length(obp)-1;
            for i=1:len
                o_bp = sprintf('%s%10.5f',o_bp,obp(i));
                o_bp = strcat(o_bp,' , ');
            end
            o_bp = sprintf('%s %10.5f];',o_bp,obp(len+1));

            %Construct child peak frequency array (cpf)
            c_pf = 'cpf = ['; 
            len = length(cpf)-1;
            for i=1:len
                c_pf = sprintf('%s%10.5f',c_pf,cpf(i));
                c_pf = strcat(c_pf,' , ');
            end
            c_pf = sprintf('%s %10.5f];',c_pf,cbp(len+1));
            
            %Construct occupational therapist peak frequency array (opf)
            o_pf = 'opf = ['; 
            len = length(opf)-1;
            for i=1:len
                o_pf = sprintf('%s%10.5f',o_pf,opf(i));
                o_pf = strcat(o_pf,' , ');
            end
            o_pf = sprintf('%s %10.5f];',o_pf,opf(len+1));

            
            %Construct child delay array (cdelay)
            c_delay = 'cdelay = ['; 
            len = length(cdelay)-1;
            for i=1:len
                c_delay = sprintf('%s%10.5f',c_delay,cdelay(i));
                c_delay = strcat(c_delay,' , ');
            end
            c_delay = sprintf('%s %10.5f];',c_delay,cdelay(len+1));
            
            %Construct occupational therapist delay array (odelay)
            o_delay = 'odelay = ['; 
            len = length(opf)-1;
            for i=1:len
                o_delay = sprintf('%s%10.5f',o_delay,opf(i));
                o_delay = strcat(o_delay,' , ');
            end
            o_delay = sprintf('%s %10.5f];',o_delay,opf(len+1));
            
            %Construct overall correlation array (coc)
            c_oc = 'coc = ['; 
            len = length(coc)-1;
            for i=1:len
                c_oc = sprintf('%s%10.5f',c_oc,coc(i));
                c_oc = strcat(c_oc,' , ');
            end
            c_oc = sprintf('%s %10.5f];',c_oc,coc(len+1));
            
            %Construct sliding correlation window array (cwc)
            c_wc = 'cwc = ['; 
            len = length(cwc)-1;
            for i=1:len
                c_wc = sprintf('%s%10.5f',c_wc,cwc(i));
                c_wc = strcat(c_wc,' , ');
            end
            c_wc = sprintf('%s %10.5f];',c_wc,cwc(len+1));            

            %Construct sliding correlation window array (x)
            x_s = 'x = ['; 
            len = length(x)-1;
            for i=1:len
                x_s = sprintf('%s%10.5f',x_s,x(i));
                x_s = strcat(x_s,' , ');
            end
            x_s = sprintf('%s %10.5f];',x_s,x(len+1)); 
            %x_s = strcat(x_s,' } ');

            
            spacer = '   ';
            
            
%             %Construct messages array
%             messagestring = strcat(fileNames{j},'anotes = [');
%             len = length(notes)-1;
% 
%             for i=1:len
%                 messagestring = sprintf('%s"%s"',messagestring,notes{i});
%                 messagestring = strcat(messagestring,' , ');
%             end
% 
%             messagestring = sprintf('%s "%s"',messagestring,notes{len+1});
%             messagestring = strcat(messagestring,' ]');


                fprintf(fid,'%s\n',c_raw);
                fprintf(fid,'%s\n',o_raw);
                fprintf(fid,'%s\n',c_bp);
                fprintf(fid,'%s\n',o_bp);                
                fprintf(fid,'%s\n',c_delay);
                fprintf(fid,'%s\n',o_delay);
                fprintf(fid,'%s\n',c_oc);
                fprintf(fid,'%s\n',c_wc);                   
                fprintf(fid,'%s\n',c_pf);
                fprintf(fid,'%s\n',o_pf);
                fprintf(fid,'%s\n',x_s);
                
                fprintf(fid,'%s\n',spacer);
                
                success = 1;
                
                fclose(fid)
    end
    
    %fclose(fid)

%end


end

