function val = square_Root_Sequence(m, n)

val = 0;

%if n is odd
if mod(n,2)==1
    for i=1:n
        %if i is odd
        if mod(i,2)==1
            val = sqrt(m - val);
        %if i is even
        else
            val = sqrt(m + val);
        end
    end
%if n is even
else
    for i=1:n
        %if i is odd
        if mod(i,2)==1
            val = sqrt(m + val);
        %if i is even
        else
            val = sqrt(m - val);
        end
    end
end

%Limits for m=13, 31, and 43:
%m=13: converges to 3
%m=31: converges to 5
%m=43: converges to 6
    
    

