%Answer: The probability is 0.25.

function prob = estimate_Triangle_Center_Circle_Probability(N)

%Keep count of # of times the center is contained in the triangle.
count_is_contained = 0;

for i=1:N
    
    %Get x coordinates of the three points.
    x1 = 4*rand() - 2;
    x2 = 4*rand() - 2;
    x3 = 4*rand() - 2;
    
    %Randomly assign the signs of the y-coordinates 
    if rand()<0.5
        ysign1 = -1;
    else 
        ysign1 = 1;end
    if rand()<0.5
        ysign2 = -1;
    else 
        ysign2 = 1;end
    if rand()<0.5
        ysign3 = -1;
    else 
        ysign3 = 1;end
    
    %Get the y-coordinates of the three points
    y1 = ysign1*sqrt(4 - x1^2);
    y2 = ysign2*sqrt(4 - x2^2);
    y3 = ysign3*sqrt(4 - x3^2);
    
    %Calculate the equations for the diameter for each of the points with
    %the center. Since each line goes through (0,0), the y=mx+b equation
    %will just be y=mx. Therefore, we only need to calculate the slope of 
    %each line and we'll have each full equation.
    
    m1 = y1/x1;
    m2 = y2/x2;
    m3 = y3/x3;
    
    %For each point, calculate whether the other two points are on 
    %opposite sides of that diameter. If the other two points are on
    %opposite sides of the diameter for each of the three diameters, then
    %the center of the circle is contained in the triangle.
    
    %If point is above line, then above = 1. Else above = -1:
    
    %Diameter for point 1:
    y2_on_line1 = m1*x2;
    if y2 > y2_on_line1
        above2 = 1;
    else above2 = -1; end
    
    y3_on_line1 = m1*x3;
    if y3 > y3_on_line1
        above3 = 1;
    else above3 = -1; end
    
    %If on same side of the line, then center is not contained. Skip to
    %next iteration.
    if above2 == above3
        continue;
    end
    
    %Diameter for point 2:
    y1_on_line2 = m2*x1;
    if y1 > y1_on_line2
        above1 = 1;
    else above1 = -1; end
    
    y3_on_line2 = m2*x3;
    if y3 > y3_on_line2
        above3 = 1;
    else above3 = -1; end
    
    if above1 == above3
        continue;
    end
    
    %Diameter for point 3:
    y1_on_line3 = m3*x1;
    if y1 > y1_on_line3
        above1 = 1;
    else above1 = -1; end
    
    y2_on_line3 = m3*x2;
    if y2 > y2_on_line3
        above2 = 1;
    else above2 = -1; end
    
    if above1 == above2
        continue;
    end
    
    %If we're still in the loop, then the center is contained in the 
    %triangle!
    
    count_is_contained = count_is_contained + 1;
    
end

prob = count_is_contained/N;

    
    