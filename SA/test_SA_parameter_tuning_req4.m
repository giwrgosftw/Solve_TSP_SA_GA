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

% tMax = [20, 50, 100]; % Maximum temperature value
tMax = [100, 1000, 10000]; % Tested with 100000 too, no such difference

% Decrease the temperature
% coolingRate = [0.2, 0.4, 0.6, 0.8];
coolingRate = [0.95, 0.96, 0.97, 0.99];

% Maximum number of iterations before cooling
% max_k = [10, 30, 50];
max_k = [100, 500, 1000]; % Tested with 10000 too, no such difference

% With the current parameters, the algorithm is much slower if enable
plot_flag = false; % enable/disable plotting
min_distance = 10^6; % Set a min for keeping best distance

% Overwrite if an old version of the diary exist
dfile ='OutputTest_SA_req4.txt';
if exist(dfile, 'file')
    delete(dfile); 
end

diary(dfile) % Set the file as diary

trial_runs = 0; % Counter for trial runs

diary on % Start: Store the command window results in the diary file

    startLoops = tic; % Start stopwatch timer
    
        for t = 1:length(tMax)

            for c = 1:length(coolingRate)
                
                for k = 1:length(max_k)
                    
                    startToc = tic;
                    disp("---------------------------------------")
                    trial_runs = trial_runs + 1

                    [best_path, best_distance, sa_iterations] = simulated_annealing(cities, tMax(t), coolingRate(c), max_k(k), plot_flag);

                    sa_iterations
                    best_distance
                    combo = [tMax(t) coolingRate(c) max_k(k)]
                    
                    endToc = toc(startToc); % Stop stopwatch timer
                    disp(['Elapsed time: ' num2str(endToc) ' seconds']) % Stop stopwatch timer
        
                    if best_distance < min_distance
                        min_distance = best_distance;
                        best_trial_run = trial_runs;
                        % best_combo = [tMax(t) coolingRate(c) max_k(k)];
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
    disp(['Overall elapsed time: ' num2str(round(stopLoops/60,1)) ' minutes']) % Stop stopwatch timer

diary off % Stop: Store the command window results in a diary file
