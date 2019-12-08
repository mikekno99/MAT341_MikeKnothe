function OpCount = go_Go_Gaussian_Elimination(N)

A = rand(N,N);

OpCount = 0;

%%%% ROW ECHELON FORM %%%%

%go through each row
for i=1:N

    %make leading entry (on diagonal) of current row = 1, and divide
    %the rest of the row by the leading entry as well
    old_leading_elt = A(i,i);
    for j=i:N
        A(i,j) = A(i,j)/old_leading_elt;
        OpCount = OpCount+1;
    end

    %make each entry below current leading entry = 0, and subtract the
    %rest of the kth row from the ith row
    for k=(i+1):N  %row
        temp = A(k,i);
        %sweep through the whole row
        for l=i:N  %column
            A(k,l) = A(i,l)*temp - A(k,l);
            OpCount = OpCount+2;
        end
    end
    
end

%%%% REDUCED ROW ECHELON FORM %%%%
    
%make entries above current diagonal entry = 0
for i=2:N  %row of current diagonal
    %sweep up from diagonal entry and make column 0s
    for j=i-1:-1:1  %current row above current diagonal entry
        temp = A(j,i);  
        %sweep across row
        for k = i:N  %column
            A(j,k) = temp*A(i,k) - A(j,k);
            OpCount = OpCount+2;
        end
    end
end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
%
% Questions answered in plot_Gaussian_Elimination_Scaling.m script
