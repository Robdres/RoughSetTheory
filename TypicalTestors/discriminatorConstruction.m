function S = discriminatorConstruction(basicMatrix,N,maxIter,alpha,typ,numberOfSolutions,minFitnessValue) 
    if nargin == 2
        alpha = 0.2;
        typ = 0.80; %TODO
        maxIter = 100;
        numberOfSolutions = 100;
        minFitnessValue = 0.95;
    end 
    % Creation of the initial population
    P = [];
    i = 0;
    while i<N
        r = randi([0,1],[1,size(basicMatrix,2)]); 
        if(any(r)==0)
            continue
        end
        i = i+1;
        P = [P; r];
    end
    %Declare HP
    HP = [];
    %Solution list
    S = [];
    k = 0;
    State = 1;

    %Setup objective function
    function s = O(chr,basicMatrix,alpha,St)
        if St ==1
            % typicality.m
            s = typicality(chr,basicMatrix,alpha);
        else
            s = -1;
        end
    end
    j = 0;
    while size(S,1) < numberOfSolutions && k<maxIter
        k = k + 1; 
        j = j + 1;
        i = 1 ;

        HP = [HP; P(i,:) O(P(i,:),basicMatrix,alpha,State)];
        while i < size(P,1) 
            i = i+1;
            fv = O(P(i,:),basicMatrix,alpha,State);
            if fv > alpha && all(fv > HP(:,end))
                HP = [HP; P(i,:) fv];
                if size(HP,1) > size(P,1)
                    m = find(HP(:,end)==min(HP(:,end)));
                    HP(m,:) = [];
                end
            end
            if fv >= minFitnessValue
                S = unique(S,'rows');
                S = [S ; P(i,:) fv];
            end
        end
        mfv = mean(HP(:,end));
        if(mfv>typ)
            State = 0;
        end
        BP = [HP; S];
        HP = [];

        % frecuencyM.m
        [mf,P] = frecuencyM(BP,size(P,1));
    end
end

%TODO
%Neural networks
%Matlab -> to C
%base de datos fonts
