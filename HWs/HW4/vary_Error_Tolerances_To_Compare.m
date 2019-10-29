function vary_Error_Tolerances_To_Compare()

for i=1:12
    errTolVec(i) = 1/(10^i);
end

golden_search = [];
parabolic = [];

for i=1:12
    golden_search(i) = golden_Search(errTolVec(i));
    parabolic(i) = successive_Parabolic_Interpolation(errTolVec(i));
end

%semilogx plot:
figure(1);
semilogx(errTolVec,golden_search,'b','LineWidth',5);
hold on
semilogx(errTolVec,parabolic,'r','LineWidth',5);
title('Semilogx Plot');
xlabel('Tolerance');
ylabel('N (# Iterations)');
legend('Golden Search','Succ. Para. Interp.');
hold off

%loglog plot:
figure(2);
loglog(errTolVec,golden_search,'b','LineWidth',5);
hold on
loglog(errTolVec,parabolic,'r','LineWidth',5);
title('loglogx Plot');
xlabel('Tolerance');
ylabel('N (# Iterations)');
legend('Golden Search','Succ. Para. Interp.');
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
% a.) In both plots, for the less accurate tolerances, the parabolic method
% takes a lower number of iterations to converge to the minimum. Therefore,
% the parabolic method seems to converge quicker for the lower error
% tolerances.
% b.) As we increase the accuracy threshold, the golden search algorithm
% remains steady (actually improves a bit relative to the threshold) in the 
% number of iterations it takes to converge to the minimum. But for the 
% parabolic method, it quickly/exponentially increases the number of 
% iterations necessary to converge to the minimum as the tolerance 
% increases. After a tolerance of about 1e-11, the parabolic method starts 
% to converge extremely slow - much slower than the golden search method. 
% 
% For the parabolic method, as the points approach the minimum, the slope
% of the function approaches 0. Thus, when continually replacing x-values, 
% it takes longer for the x-values to get closer to the minimum as they get
% closer to it. The golden search method is not affected by the slope of
% the function near the minimum, so its behavior is not affected.
