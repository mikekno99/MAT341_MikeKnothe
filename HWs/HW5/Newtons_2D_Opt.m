function N = Newtons_2D_Opt(tol)

%create x0 vector as a matrix
xVec = [-4.5; 4.5];

%set error tolerance (and starting error for loop)
err = 1;

count = 0;

while err > tol
    
    %gradient of f, Hession of f, and inverse Hession of f
    gradf = [fx(xVec); fy(xVec)];
    Hessianf = [fxx(xVec) 0; 0 fyy(xVec)];
    inv_Hessianf = inv(Hessianf);
   
    newxVec = xVec - inv_Hessianf * gradf;
    
    err = sqrt((newxVec - xVec)' * (newxVec - xVec));
    
    xVec = newxVec;
    count = count + 1;
    
end

N = count;
[xVec(1,1) xVec(2,1)]

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

%2nd partial f wrt. x (2)
function output = fxx(x)
    output = sin(x(1));
end

%2nd partial f wrt. y (2)
function output = fyy(x)
    output = cos(x(2));
end

%Note the 2nd partial f wrt. xy is just 0 in this case

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
%
% a.) It took 5 iterations to find a minima. It found the minima at
% (x,y) = (-4.7124,0) = (-3pi/2,0).
% b.) It found the same minima at (x,y) = (-3pi/2,0), and it took 4
% iterations this time. 


