function vary_Error_Tolerances_To_Compare()

for i=1:12
    errTolVec(i) = 1/(10^i);
end

grad_desc1 = [];
grad_desc2 = [];

for i=1:12
    grad_desc1(i) = Gradient_Descent_1(errTolVec(i),0.5);
    grad_desc2(i) = Gradient_Descent_2(errTolVec(i));
end

%semilogx plot
figure(1);
semilogx(errTolVec,grad_desc1,'b','LineWidth',5);
hold on;
semilogx(errTolVec,grad_desc2,'r','LineWidth',5);
title('Semilogx Plot');
xlabel('Tolerance');
ylabel('N (# Iterations)');
legend('Fixed Step-Size','Barzilai-Borwein Step-Size');
hold off

%loglogx plot
figure(2);
loglog(errTolVec,grad_desc1,'b','LineWidth',5);
hold on;
loglog(errTolVec,grad_desc2,'r','LineWidth',5);
title('loglogx Plot');
xlabel('Tolerance');
ylabel('N (# Iterations)');
legend('Fixed Step-Size','Barzilai-Borwein Step-Size');
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
%
% a.) For every tolerance level, the fixed step-size using the "best" step
% size found in Problem 1 appears to converge the fastest to the minimum.
% b.) When changing the fixed step-size to gamma = 0.5, the fixed step-size
% method starts to converge significantly slower for the more accurate
% tolerance levels than for the less accurate tolerance levels. For all
% tolerances, the Barzilai-Borwein step-size converges faster.
% c.) An advantage of using the Barzilai-Borwein step-size is that it's
% guaranteed to work well and you don't need to find the "best" fixed
% step-size like how we did in Problem 1. However, a bigger advantage is
% that you can use the Barzilai-Borwein step-size for every function, not
% just the current function we're using, and it will produce a great
% result. That way, if you need to analyze many functions using gradient
% descent, you don't need to keep recalculating the "best" fixed step-size.
% d.) I would choose the Barzilai-Borwein step-size because it guarantees a
% good result, rather than randomly choosing a fixed step-size and hoping
% for the best, where slight changes in the fixed step-size chosen could 
% make a huge difference in the convergence speed. Using a fixed step-size
% without testing which fixed step-size is the best is far too
% unpredictable to be reliable.