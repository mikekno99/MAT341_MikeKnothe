function lcm_val = calculate_LCM(x,y)

%Keep multiplying x and y by 1,2,3,... until a certain combination
%makes x=y

%The following two variables are the multiples of 1,2,3,... that we
%multiply by x and y until we get the LCM
x_multiplier = 2;
y_multiplier = 2;

%The following two variables are the current value of x and y that we're at
current_x = x;
current_y = y;

while current_x ~= current_y
    
    %Only multiply x if current_x < current_y
    if current_x < current_y
        
        current_x = x * x_multiplier;
        x_multiplier = x_multiplier + 1;
        
    end
    
    %Only multiply y if current_y < current_x
    if current_y < current_x
        
        current_y = y * y_multiplier;
        y_multiplier = y_multiplier + 1;
        
    end
    
end

%return the LCM:
lcm_val = current_x;
    
    
    