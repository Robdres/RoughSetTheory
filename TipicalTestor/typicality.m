function s = UMDA(chromosome, BM, alpha) 
    r = sum(chromosome);
    chromosome = find(chromosome);
    t = sum(any(BM(:,chromosome),2));
    n = size(BM,1);
    h =sum(sum(BM(:,chromosome),2) == 1 );
    if( h > r)
        p = r;
    else 
        p = h;
    end
    s = alpha*(t/n) + (1-alpha)*(p/r);
end


