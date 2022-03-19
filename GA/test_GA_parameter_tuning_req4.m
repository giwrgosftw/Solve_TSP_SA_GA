% This script was created to execute a maximum 30 trial runs for each algorithm to tune the parameters for SA
% Except the command window, you can check also the output .txt file for the results
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

% Parameters for tuning
% The number of parameters was set in such a way that
% it does not exceed 30 repetitions as requested by the module's assignment
population_length = [70, 100]; % Number of individuals/chromosomes in the population
max_t = [100, 500, 1000]; % Maximum iterations
crossover_rate = [0.8, 0.9]; % Probability of Crossover
mutation_rate = [0.02, 0.1, 0.8]; % Probability of Mutation

min_distance = 10^6; % Set a min for keeping best distance

% Overwrite if an old version of the diary exist
dfile ='OutputTest_GA_req4.txt';
if exist(dfile, 'file')
    delete(dfile); 
end

diary(dfile) % Set the file as diary

trial_runs = 0; % Counter for trial runs

diary on % Start: Store the command window results in the diary file

    startLoops = tic; % Start stopwatch timer
    
        for p = 1:length(population_length)

            for t = 1:length(max_t)
                
                for c = 1:length(crossover_rate)

                    for m = 1:length(mutation_rate)
                    
                        startToc = tic;
                        disp("---------------------------------------")
                        trial_runs = trial_runs + 1
    
                        best_distance = genetic_algorithm(cities, population_length(p), max_t(t), crossover_rate(c), mutation_rate(m));
    
                        best_distance
                        combo = [population_length(p), max_t(t), crossover_rate(c), mutation_rate(m)]
                        
                        endToc = toc(startToc); % Stop stopwatch timer
                        disp(['Elapsed time: ' num2str(endToc) ' seconds']) % Stop stopwatch timer
            
                        if best_distance < min_distance
                            min_distance = best_distance;
                            best_trial_run = trial_runs;
                            % best_combo = [population_length(p), max_t(t), crossover_rate(c), mutation_rate(m)];
                        end
                    end
                end
            end
        end
        
         disp(" ")
         disp("------------Final Results----------------")
         best_trial_run
         min_distance
%         best_combo
    
    stopLoops = toc(startLoops);
    disp(['Overall elapsed time: ' num2str((stopLoops/60)*60) ' seconds']) % Stop stopwatch timer

diary off % Stop: Store the command window results in a diary file
