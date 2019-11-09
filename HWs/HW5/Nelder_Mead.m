function N = Nelder_Mead(tol)

%counter for number of iterations
count = 0;

%create x,y vectors
%If randomized:
%x1 = [(6*rand() - 1) (6*rand() - 1)];
%x2 = [(6*rand() - 1) (6*rand() - 1)];
%x3 = [(6*rand() - 1) (6*rand() - 1)];

x1 = [0.35 2.8];
x2 = [4 4];
x3 = [4.5 4.5];

%while greater than error tolerance
%while min(abs(f(x1)-f(x2)),abs(f(x1)-f(x3)),abs(f(x2)-f(x3))) > tol
while abs(f(x1)-f(x3)) > tol

    %make matrix of pts
    %need matrix so that you have a x column and a y column
    xVec = [x1; x2; x3];

    %create vector of function values
    fVec = [f(xVec(1,:)) f(xVec(2,:)) f(xVec(3,:))];

    %sort function value vector
    [fNew,indsVec] = sort(fVec);

    %remake x1 x2 and x3 to be least to greatest in terms of function
    %values
    x1 = xVec(indsVec(1),:);
    x2 = xVec(indsVec(2),:);
    x3 = xVec(indsVec(3),:);

    %midpoint vector
    xm = (1/2)*(x1 + x2);

    %reach vector
    xr = xm + (xm - x3);

    if f(xr) < f(x3)
        x3 = xr;
    elseif f(xr) >= f(x3)
        xc = (1/2)*(xm + x3);
        if f(xc) < f(x3)
            x3 = xc;
        else
            x2 = (1/2)*(x1 + x2);
            x3 = (1/2)*(x1 + x3);
        end
    end
    
    count = count + 1;
    
end

N = count;

end

function output = f(x)

output = (-1)*(sin(x(1)) + cos(x(2)));

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions 
%
% a.) It takes 29 iterations to achieve 1e-8 accuracy.
% b.) It appears to converge to (1.5715...,0.0008...). However, the true
% (x,y) point is (1.5707...,0), so this does not look like 1e-8 accuracy in
% terms of the point we're converging to since it's only a couple
% decimal points of accuracy.
% c.) It now took 58 iterations to achieve 1e-8 accuracy. It located the
% same minima, but as stated, it is a bit closer to the actual minima.
% However, the number of iterations is double that of the previous number.
% Before the change, each of the points were to the left of the minima in
% the x-direction, but after the change, there is now a point to the right
% of the minima when we start. Thus, it might take longer for the points to
% converge to the minima because they're more spread out around the minima
% at the start.
% d.) The algorithm found the minima (3pi/2, 0), and the result was the
% coordinate (-4.7123,-0.0003).
