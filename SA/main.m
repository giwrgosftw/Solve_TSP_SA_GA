% Clear workspace
clear all

% Clear command window
clc

% Load ATT48.tsp if it has not already been loaded
if isfile('cities.mat')
    load cities;
else
    loadatt48();
    load cities;
end

% Run SA with the best parameters' values
tMax = 1000; % Maximum temperature value
coolingRate = 0.99; % Decrease the temperature
max_k = 500; % Maximum number of iterations before cooling

% With the current parameters, the algorithm is much slower if enable
plot_flag = true; % enable/disable plotting

tic % Start stopwatch timer

[best_route, best_distance, sa_iterations] = simulated_annealing(cities, tMax, coolingRate, max_k, plot_flag);

disp(['Elapsed time: ' num2str(round(toc/60,1)) ' minutes']) % Stop stopwatch timer
