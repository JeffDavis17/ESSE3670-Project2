%% This function formats the output for satellite position
function str = out_form(yr,mn,day,hr,m,s,PRN,pseudo,x,y,z)
    if mn < 10
        if day < 10
            if hr<10
                if m < 10
                    if s < 10
                        str = sprintf('%d/0%d/0%d 0%d:0%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/0%d/0%d 0%d:0%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                else % m > 10    
                    if s < 10
                        str = sprintf('%d/0%d/0%d 0%d:%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/0%d/0%d 0%d:%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                end
            else % hr > 10
                if m < 10
                    if s < 10
                        str = sprintf('%d/0%d/0%d %d:0%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/0%d/0%d %d:0%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                else % m > 10    
                    if s < 10
                        str = sprintf('%d/0%d/0%d %d:%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/0%d/0%d %d:%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                end
            end
        else % day >10
            if hr<10
                if m < 10
                    if s < 10
                        str = sprintf('%d/0%d/%d 0%d:0%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/0%d/%d 0%d:0%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                else % m > 10    
                    if s < 10
                        str = sprintf('%d/0%d/%d 0%d:%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/0%d/%d 0%d:%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                end
            else % hr > 10
                if m < 10
                    if s < 10
                        str = sprintf('%d/0%d/%d %d:0%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/0%d/%d %d:0%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                else % m > 10    
                    if s < 10
                        str = sprintf('%d/0%d/%d %d:%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/0%d/%d %d:%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                end
            end
        end
    else % mn > 10
        if day < 10
            if hr<10
                if m < 10
                    if s < 10
                        str = sprintf('%d/%d/0%d 0%d:0%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/%d/0%d 0%d:0%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                else % m > 10    
                    if s < 10
                        str = sprintf('%d/%d/0%d 0%d:%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/%d/0%d 0%d:%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                end
            else % hr > 10
                if m < 10
                    if s < 10
                        str = sprintf('%d/%d/0%d %d:0%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/%d/0%d %d:0%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                else % m > 10    
                    if s < 10
                        str = sprintf('%d/%d/0%d %d:%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/%d/0%d %d:%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                end
            end
        else % day >10
            if hr<10
                if m < 10
                    if s < 10
                        str = sprintf('%d/%d/%d 0%d:0%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/%d/%d 0%d:0%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                else % m > 10    
                    if s < 10
                        str = sprintf('%d/%d/%d 0%d:%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/%d/%d 0%d:%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                end
            else % hr > 10
                if m < 10
                    if s < 10
                        str = sprintf('%d/%d/%d %d:0%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/%d/%d %d:0%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                else % m > 10    
                    if s < 10
                        str = sprintf('%d/%d/%d %d:%d:0%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z);
                    else
                        str = sprintf('%d/%d/%d %d:%d:%d %d %.3f %.3f %.3f %.3f',yr,mn,day,hr,m,s,PRN,pseudo,x,y,z); 
                    end
                end
            end
        end
    end
end