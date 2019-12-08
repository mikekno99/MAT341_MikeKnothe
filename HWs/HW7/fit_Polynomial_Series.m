function fit_Polynomial_Series()

N = 250;
xVals = linspace(-2*pi,2*pi,N);
yVals = cos(xVals)';

for i=1:N
    for j=1:13
        A(i,j) = xVals(i)^(j-1);
    end
end

%Beta values
B = inv(A'*A)*A'*yVals

%what we'll plot for the line of best fit
for a=1:N
    bestFitVals(a) = 0;
    for b=1:13
        bestFitVals(a) = bestFitVals(a) + B(b)*xVals(a)^(b-1);
    end
end

%Print out the l^2-norm of the residual
r_norm = sqrt((yVals - A*B)'*(yVals - A*B))

figure(1);
plot(xVals,yVals,'b','LineWidth',6);
hold on;
plot(xVals,bestFitVals,'r','LineWidth',4);
legend('Data','Best Poly Fit');
xlabel('x');
ylabel('y');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
% 
% a.) When N=10, the residual is 0.7318. When N=50, residual is 5.1501e-04.
% When N=250, the residual is 0.0011. Thus, with 12 beta values, the
% residual is very good for around 50 data points, but is not as good for
% either low or high amounts of data points. 
% b.) We've seen this as the Taylor Series polynomial of cos(x). The beta
% values in the Taylor expansion of cosine were only nonzero on even 
% powers, and they were 1, -1/2!, 1/4!, etc.
% c.) When N=250, the beta coefficients were 1, 0, -0.5, 0, 0.04, 0, etc. 
% d.) Thus, the coefficients from N=250 are basically the same as the
% coefficients of the Taylor Series polynomial of cosx. Thus, we basically
% just found the Taylor Series expansion of cosx through our model.  