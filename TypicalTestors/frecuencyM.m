function [mf,S] = frecuencyM(BP,N) 
    BP(:,end) = []
    r = sum(BP,1);
    n = size(BP,1);
    mf = r/size(BP,1)
    S = [];
    for i = 1:size(BP,2)
        r = rand([N,1])<mf(i);
        S = [S, r]; 
    end 
end 


