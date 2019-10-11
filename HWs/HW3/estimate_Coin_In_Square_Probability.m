%2a.)
%Different from the case we did in class because we had an error
%threshold that we wanted to reach for those problems. For this, we do
%not have a threshold, so we need to use judgment for determining what
%an acceptable amount of error is.
%N=1e5 does seem like a reasonable amount of trials because the results are
%consistent around a probability of 0.64. However, if we wanted more
%decimals of accuracy, we should use a higher value of N.

function prob = estimate_Coin_In_Square_Probability(r,N)

%Count the # of times the coin crosses the boundaries of the square 
countOutOfSquare = 0;

for i=1:N
    
    %x and y coordinates of the CENTER of the coin upon landing
    x=rand();
    y=rand();
    
    %If either the x or y coordinate is less than r distance away from
    %the edge of the square, then the coin is out of the square
    if ( (x<r) || (abs(1-x) < r) || (y<r) || (abs(1-y) < r) )
        countOutOfSquare = countOutOfSquare + 1;
    end
    
end

%Number of times the coin was fully inside the square 
countInsideSquare = N - countOutOfSquare;
%Return the probability:
prob = countInsideSquare/N;
    