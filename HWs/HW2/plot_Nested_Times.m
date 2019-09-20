%plot values from calculate_Nested_For_Loop_Time()
%plots log-log plot of N vs. Time
function plot_Nested_Times()

N = [1:1:10 20:10:100 125 150 175 200 225 250];
time = [];

for i=1:length(N)
    time(i) = calculate_Nested_For_Loop_Time(N(i));
end

loglog(N,time,'m','LineWidth',4);
xlabel('N');
ylabel('Time');
title('log-log Plot of N vs. Time');


    