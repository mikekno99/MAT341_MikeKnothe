function vary_StepSize_Gamma_To_Optimize()

%array of gamma values
%gammaVec = [0.1:0.1:3.0];
gammaVec = [0.1:0.02:1.9];
%array of number of iterations, N, with each gamma value
gradient_desc = [];

for i=1:length(gammaVec)
    gradient_desc(i) = Gradient_Descent_1(1e-10,gammaVec(i));
end

figure(1);
semilogx(gammaVec,gradient_desc,'b','LineWidth',5);
title('Gamma Size vs Number of Iterations');
xlabel('Gamma');
ylabel('N (# Iterations)');
legend('Fixed Step');

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions %
%
% a.) Looking at the plot generated, the best step-size for this function
% is a gamma value of 1.0.
