function fit_Sine_Series()

N=500;
xVals = linspace(-pi,pi,N);
yVals = ( (0.25*xVals.^2).* cos(xVals).^4.* sin(xVals).^7 )';

M = 40;
for i=1:N
    for j=1:M
        A(i,j) = sin(j*xVals(i));
    end
end

%Beta values
B = ((A'*A)^(-1))*A'*yVals;

%computing the l-2 norm
r_norm = sqrt((yVals - A*B)'*(yVals - A*B))

for a=1:N
    bestFitVals(a) = 0;
    for b = 1:M
        bestFitVals(a) = bestFitVals(a) + B(b)*sin(b*xVals(a));
    end
end

figure(1);
plot(xVals,yVals,'b','LineWidth',6);
hold on;
plot(xVals,bestFitVals,'r','LineWidth',4);
legend('Data','Best Sine Series Fit');
xlabel('x');
ylabel('y');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Questions %
%
% a.) When M=5, the residual is 0.0813. When M=10, the residual is 0.0096.
% When M=20, the residual is 2.1412e-06. When M=40, the residual is
% 3.9199e-09.
% b.) This series is called a Fourier series.