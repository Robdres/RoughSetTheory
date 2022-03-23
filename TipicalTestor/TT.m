% Inputs
% Discenibility Matrix

% Outputs 
% Tipical Testor

function tt = TT(D) 
    % First ones in first column
    [b,i] = sort(D(1,:),'des');
    D = D(:,i);
    
    % Tipical Testors set of indexes
    tt = [];

    % Candidate 
    i = 1;
    while i< lenght()
        C = [];
        C = (C,D(:,i)); 
        checkINdi

        

        
    end
end


