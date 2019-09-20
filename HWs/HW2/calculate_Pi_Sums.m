function calculate_Pi_Sums()
    
a_err = 1;
b_err = 1;
tol = 10^(-6);

%vector to keep track of sequence values
a = [];
b = [];

%current value of n for both a and b
n_a = -1;
n_b = -1;

%keep track of value of summation during for loop
%reset every iteration of the while loop
a_n = 0;
b_n = 0;

while a_err>tol
    
    a_n = 0;
    n_a = n_a + 1;
    for k=0:n_a
        a_n = a_n + (6/sqrt(3))*((-1)^k)/((3^k)*(2*k+1)); 
    end
    a_err = abs(a_n - pi);
    %put this a_n value in "a" sequence
    %remember that indices need to start at 1
    a(n_a+1) = a_n;
end

while b_err>tol
    
    b_n = 0;
    n_b = n_b + 1;
    for k=0:n_b
        b_n = b_n + 16*((-1)^k)/(5^(2*k+1)*(2*k+1))-4*((-1)^k)/(239^(2*k+1)*(2*k+1));
    end
    b_err = abs(b_n - pi);
    %put this b_n value in "b" sequence
    %remember that indices need to start at 1
    b(n_b+1) = b_n;
end

a = a'
b = b'
N_a = n_a
N_b = n_b

