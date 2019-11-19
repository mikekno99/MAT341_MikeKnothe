function N = Gradient_Descent_1(tol,gamma)

%create x0 vector as a matrix
xVec = [1.0; 1.5];

%starting step size
%step = 0.9;

%set starting error for loop
err = 1;

count = 0;

while err > tol
    
    gradf = [fx(xVec); fy(xVec)];
    
    newxVec = xVec - gamma*gradf;
    
    err = sqrt((newxVec - xVec)' * (newxVec - xVec));
    
    %borzlai-borwein step size
    %gradf_1 = [fx(newxVec); fy(newxVec)];
    %step = abs((newxVec - xVec).'*(gradf_1 - gradf))/((gradf_1 - gradf)'*(gradf_1 - gradf));
    
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
%
% a.) Takes 35 iterations using gamma = 0.5.
% b.) Takes 12 iterations using gamma = 0.9.
% c.) Takes 34 iterations using gamma = 1.5.

