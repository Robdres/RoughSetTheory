function mf = frecuencyM(BP) 
    r = sum(BP,1)
    mf = r/size(BP,1)
end 


