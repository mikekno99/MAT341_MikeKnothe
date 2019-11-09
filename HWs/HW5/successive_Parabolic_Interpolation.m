function N = successive_Parabolic_Interpolation(tol)

x1 = 0;
x2 = 0.6;
x3 = 1.2;

errtol = x3 - x1;

%keep track of number of iterations
count = 0;

while errtol > tol
    
    A = [x1^2 x1 1 f(x1); x2^2 x2 1 f(x2); x3^2 x3 1 f(x3)];
    A = rref(A);
    
    %find the vertex using -b/2a
    xmin = (-1)*A(2,4)/(2*A(1,4));

    x3 = x2;
    x2 = x1;
    x1 = xmin;
   
    errtol = abs(max([(x3 - x1),(x2-x1),(x3-x2)]));
    
    count = count + 1;

end

N = count;

end

function yval = f(x)

yval = 0.5 - x*exp(-x^2);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
% a.) It takes 6 iterations to achieve 1e-8 accuracy with the initial
% guesses of 0, 0.6, and 0.9.
% b.) After changing the initial x3 value to x3 = 2, the number of
% iterations changed to 9. MATLAB did not issue any warnings.

