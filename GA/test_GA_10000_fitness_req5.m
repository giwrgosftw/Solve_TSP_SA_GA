% This script was created to execute a maximum 30 trial runs for each algorithm to tune the parameters for SA
% Except the command window, you can also check the output .txt file for the results
% NOTE: DISABLING THE PLOT FUNCTION FROM THE "simulated_annealing.m" MAKES THE PROCESS MUCH FASTER

% Clear workspace
clear all

% Clear command window
clc

% Changes the output display format in the Command Window to the format
% displays numeric values in a compact form with 5 total digits
format shortG

% Load ATT48.tsp if it has not already been loaded
if isfile('cities.mat')
    load cities;
else
    loadatt48();
    load cities;
end

% Run GA 30 times with the best parameters
% but set 100 population size and 100 maximum iterations
population_length = 100; % Number of individuals/chromosomes in the population
max_t = 100; % Maximum iterations
crossover_rate = 0.9; % Probability of Crossover
mutation_rate = 0.1; % Probability of Mutation

% Overwrite if an old version of the diary exist
dfile ='OutputTest_GA_req5.txt';
if exist(dfile, 'file')
    delete(dfile);
end

diary(dfile) % Set the file as diary

trial_runs = 0; % Counter for trial runs
sum_distance = 0; % Sum all the best distances
std_distance = zeros(1,30); % for calculate standard deviation

diary on % Start: Store the command window results in the diary file

    tic % Start stopwatch timer
    
        for i = 1:30
            
            disp("---------------------------------------")
            disp(['Iteration no: ' num2str(i) '/30'])
            
            best_distance = genetic_algorithm(cities, population_length, max_t, crossover_rate, mutation_rate);

            best_distance
            sum_distance = sum_distance + best_distance;
            std_distance(i) = best_distance
                  
        end
        
        disp(" ")
        disp("------------Final Results----------------")
        average = sum_distance/30
        standard_deviation = std(std_distance)
    
   toc % Stop stopwatch timer

diary off % Stop: Store the command window results in a diary file
