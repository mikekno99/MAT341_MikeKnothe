function plot_Gaussian_Elimination_Scaling()

NVec = 2:1:100;

for i=1:length(NVec)
    OpCounts(i) = go_Go_Gaussian_Elimination(NVec(i));
end

%loglog plot
figure(1);
loglog(NVec,OpCounts,'b','LineWidth',5);
xlabel('Size of Matrix, N');
ylabel('Operation Count');

%standard plot
figure(2);
plot(NVec,OpCounts,'b','LineWidth',5);
xlabel('Size of Matrix, N');
ylabel('Operation Count');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
%
% a.) As the size of the matrix increases, the number of operations
% required to compute its corresponding reduced row echelon form
% exponentially increases as we scale N. It even forms a linear graph in 
% the loglog plot, so we can be sure it's exponential. This is because 
% every time we increase N, we have to do significantly more operations 
% because of each new row and column. Furthermore, there are three nested
% for loops at one point in the algorithm, so the operation count is
% actually related by a factor of order 3, which is a cubic.
