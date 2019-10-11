%2b.)
%r = 0.15 gives an estimated probability of 0.5,
%r = 0.35 gives an estimated probability of 0.1, and
%r = 0.45 gives an estimated probability of 0.01

function vary_Radii_Plot()

rVec = [0.01:0.005:0.10 0.1:0.01:0.5];
probability = [];

for i=1:length(rVec)
    
    probability(i) = estimate_Coin_In_Square_Probability(rVec(i),1e5);
    
end

plot(rVec,probability);
xlabel("r");
ylabel("Probability In Square");

end