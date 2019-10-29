function N = golden_Search(tol)

%starting interval [a,b]
a = 0;
b = 2;

%step size tau
tau = (sqrt(5)-1)/2;

%count number of iterations
count = 0;

while (b-a) > tol
    
    %two bars in between a and b that keep shrinking
    x = a + (1 - tau)*(b-a);
    y = a + tau*(b-a);
    
    if f(x) >= f(y)
        a = x;
    elseif f(x) < f(y)
        b = y;
    end
    
    count = count + 1;
    
end

%Final x-value of the minimum:
%xstar = a+(b-a)/2;

N = count;

end

function yval = f(x)

yval = 0.5 - x*exp(-x^2);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
% a.) To achieve 1e-8 accuracy, the golden search algorithm takes 40
%     iterations