function N = Newtons_1D_Opt(tol)

%Initial guess
xn = 0.25;

%Initial error going into loop
err = 1;

count = 0;

while err > tol
    
    %x_n+1
    xn_1 = xn - (fp(xn)/fpp(xn));
    
    err = abs(f(xn_1) - f(xn));
    
    xn = xn_1;

    count = count + 1;
    
end

N = count;

end

function yval = f(x)

yval = 0.5 - x*exp(-x^2);

end

%fprime
function yval = fp(x)

yval = (2*x^2 - 1)*exp(-x^2);

end

%f double prime
function yval = fpp(x)

yval = -(4*x^3 - 6*x)*exp(-x^2);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions
%
% a.) It takes 5 iterations to achieve 1e-8 accuracy.
% b.) The number of iterations changed to 15 iterations, and it found a
% different minima. This all depends on the initial guess because the slope
% of the graph you're using Newton's method on might lead you to a
% different x-intercept (in our case, the graph is f-prime and we're
% finding an x-intercept of f-prime. 