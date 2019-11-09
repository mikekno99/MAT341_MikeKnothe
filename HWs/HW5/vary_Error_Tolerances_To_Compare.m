function vary_Error_Tolerances_To_Compare()

for i=1:12
    errTolVec(i) = 1/(10^i);
end

golden_search = [];
parabolic = [];
newtons = [];

for i=1:12
    golden_search(i) = golden_Search(errTolVec(i));
    parabolic(i) = successive_Parabolic_Interpolation(errTolVec(i));
    newtons(i) = Newtons_1D_Opt(errTolVec(i));
end

%semilogx plot:
figure(1);
semilogx(errTolVec,golden_search,'b','LineWidth',5);
hold on
semilogx(errTolVec,parabolic,'r','LineWidth',5);
hold on
semilogx(errTolVec,newtons,'k','LineWidth',5);
title('Semilogx Plot');
xlabel('Tolerance');
ylabel('N (# Iterations)');
legend('Golden Search','Succ. Para. Interp.','Newton Method');
hold off

%loglog plot:
figure(2);
loglog(errTolVec,golden_search,'b','LineWidth',5);
hold on
loglog(errTolVec,parabolic,'r','LineWidth',5);
hold on
loglog(errTolVec,newtons,'k','LineWidth',5);
title('loglogx Plot');
xlabel('Tolerance');
ylabel('N (# Iterations)');
legend('Golden Search','Succ. Para. Interp.','Newton Method');
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
% a.) For less accurate tolerances, successive parabolic interpolation and
% Newton's Method converge at around the same speed (up until about 10^-2).
% b.) As the accuracy threshold is increased, Newton's method by far
% converges the quickest. Successive parabolic interpolation approached the
% same speed of convergence as golden search, and then gets slower than
% golden search after 10^-12 tolerance.
% c.) The convergence rates could change based on the starting x-value. 
