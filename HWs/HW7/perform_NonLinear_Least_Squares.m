function perform_NonLinear_Least_Squares()

N = 2500;
coords = give_NonLinear_Least_Squares_Data(N);
xVals = coords(:,1);
yVals = coords(:,2);
plot(xVals,yVals,'.');
%there does appear to be nonlinear trend in the data

%Beta values on the 0th iteration
B = [1 0.5 0.3]';

tol = 1e-3;
err = 1;

count = 0;

%Parts to use in the psuedo-inverse
J = zeros(N,3);
Delta_y = zeros(N,1);

while err > tol    
    
    count = count+1;
    
    %Form J
    for i=1:N 
        J(i,1) = fB0(xVals(i),B);
        J(i,2) = fB1(xVals(i),B);
        J(i,3) = fB2(xVals(i),B);   
    end
    
    %Now form Delta_y
    for i=1:N
        x = xVals(i);
        y = yVals(i);
        Delta_y(i,1) = y - f(xVals(i),B);
    end
    
    %Calculate pseudo-inverse
    %B_Vec = ((J'*J)^(-1))*J'*Delta_y;
    Delta_B = inv(J'*J)*J'*Delta_y;
    
    %Next Beta values, same as B_(k+1)
    B_k_1 = B + Delta_B;
    
    err = sqrt((B_k_1 - B)' * (B_k_1 - B));
    
    B = B_k_1;
      
end

%calculate approximated y_values using model
for i = 1:N
    bestFitVals(i) = f(xVals(i),B);
end

%l-2 norm of residuals
r_norm = sqrt((yVals - bestFitVals')' * (yVals - bestFitVals'))

%print betas and count
B
count

figure(1);
plot(xVals,yVals,'b','MarkerSize',20);
hold on;
plot(xVals,bestFitVals,'r','LineWidth',4);
legend('Data','Model Fit');
xlabel('x');
ylabel('y');
hold off;

end

%f
function val = f(x,B)
    val = B(1)*exp(-(x-B(2))^2/(2*B(3)^2));
end

%partial f wrt B0
function val0 = fB0(x, B)
    val0 = exp(-(x-B(2))^2/(2*B(3)));
end

%partial f wrt B1
function val1 = fB1(x, B)
    val1 = (B(1)*(x-B(2))/B(3)^2)*exp(-(x-B(2))/(2*B(3)^2));
end

%partial f wrt B2
function val2 = fB2(x, B)
    val2 = B(1) * exp(-(x-B(2))^2/(2*B(3))) * ((-(x-B(2))^2)/2) * (-2/B(3)^3);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
%
% The beta values the solver converged to with the specified tolerance of
% 1e-5 is B0 = 0.8308, B1 = 0.5000, B2 = 0.2365. The residual with this
% betas set is 10.5436.
            
    
