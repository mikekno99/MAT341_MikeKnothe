function N = Gradient_Descent_2(tol)

%create x0 vector as a matrix
xVec = [1.0; 1.5];

%starting step size
gamma = 0.5;

%set starting error for loop
err = 1;

count = 0;

while err > tol
    
    gradf = [fx(xVec); fy(xVec)];
    
    newxVec = xVec - gamma*gradf;
    
    err = sqrt((newxVec - xVec)' * (newxVec - xVec));
    
    %borzlai-borwein step size
    gradf_1 = [fx(newxVec); fy(newxVec)];
    gamma = abs((newxVec - xVec).'*(gradf_1 - gradf))/((gradf_1 - gradf)'*(gradf_1 - gradf));
    
    xVec = newxVec;
    count = count + 1;

end

%[xVec(1,1) xVec(2,1)];
N = count;

end

%f
function output = f(x)
    output = (-1)*(sin(x(1)) + cos(x(2)));
end

%partial f wrt. x
function output = fx(x)
    output = -cos(x(1));
end

%partial f wrt. y
function output = fy(x)
    output = sin(x(2));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
%
% a.) It takes 6 iterations to achieve 1e-6 accuracy using the
% Barzilai-Borwein step-size.
% b.) It takes 7 iterations to achieve 1e-10 accuracy using the
% Barzilai-Borwein step-size.