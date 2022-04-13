function S = discriminatorConstruction(basicMatrix,N,maxIter,alpha,typ,numberOfSolutions,minFitnessValue) 
    if nargin == 2
        alpha = 0.2;
        typ = 0.80; %TODO
        maxIter = 100;
        numberOfSolutions = 5;
        minFitnessValue = 0.9;
    end 

    % Creation of the initial population
    P = [];
    while size(P,1)<N
        r = randi([0,1],[1,size(basicMatrix,2)]); 
        if(any(r)==0)
            continue
        end
        P = [P; r];
    end
    P
    %Declare HP
    HP = [];
    %Solution list
    S = [];
    k = 0;

    %Setup objective function
    function s = O(chr,basicMatrix,alpha)
        s = typicality(chr,basicMatrix,alpha);
    end
    
    while k < maxIter
        k = k+1; 
        j = 0;
        while size(HP,1) < numberOfSolutions 
            j = j+1;
            i = 1 ;
            HP = [HP; P(i,:) O(P(i,:),basicMatrix,alpha)];
            while i < size(P,1) 
                i = i+1;
                fv = O(P(i,:),basicMatrix,alpha);
                if fv > alpha && all(fv > HP(:,end))
                    HP = [HP; P(i,:) fv];
                    if size(HP,1) > size(P,1)
                        m = find(HP(:,end)==min(HP(:,end)));
                        HP(m,:) = [];
                    end
                end
                if fv >= minFitnessValue

                    S = [S ; P(i,:) fv];
                end
            end
            mfv = mean(HP(:,end))
        end
    end 
end
%TODO
%Matlab -> to C
%base de datos fonts
