% Inputs Discenibility Matrix Outputs Tipical Testor function tt = TT(D) First ones in first column
    [b,i] = sort(D(1,:),'des');
    D = D(:,i)
    
    % Tipical Testors set of indexes
    tt = [];

    % Candidate 
    i = 1;
    %Not sure

    %where is the gap 
    j = i

    while i <= length(D)
        C = [];
        C1 = [];
        Cp = [];
        if D(1,i) == 0
            break
        end
        C = [C,D(:,i)];
        j = i + 1; 

        while j <= length(D)
  
            % Does it contribute?
            if sum(~any([C,D(:,j)],2) < sum(~any(C,2)))

                % Does it damage?
                Uo = find(sum(C,2)==1);
                Uc = find(sum([C,D(:,j)],2)==1);
                d = intersect(Uo,Uc);

                if(length(d) <= length(C))
                    C1 = [C,D(:,j)];
                    %check if is tt
                    if any(~any(C1,2))== 0
                        tt = [tt, C1];
                        j = j + 1;
                    else
                        Cp = [C]
                        C = [C,D(:,j)]; 
                        j = j + 1;
                    end
                    
                else
                    j = j+1;
                end 

            else 
                j=j+1;
            end

        end
        i = i+1;
    end
end


