function U = combinatoryMerge(A,B)
    A_ = [] 
    B_ = []
    for i:size(A,1)
        A_ = [A;A(i);A(i)]
    end 
    B_ = [B;B]
    U = [A_,B_]
return





