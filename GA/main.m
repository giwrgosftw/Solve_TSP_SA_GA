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

% Run GA with the best parameters' values
population_length = 70; % Number of individuals/chromosomes in the population
max_t = 1000; % Maximum iterations
crossover_rate = 0.9; % Probability of Crossover
mutation_rate = 0.1; % Probability of Mutation

tic % Start stopwatch timer

best_distance = genetic_algorithm(cities, population_length, max_t, crossover_rate, mutation_rate)

toc % Stop stopwatch timer
