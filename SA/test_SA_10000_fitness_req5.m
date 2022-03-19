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

% Run SA 30 times with the best parameters' values
% but set maximum iterations to 10,000 
tMax = 10000; % Maximum temperature value
coolingRate = 0.99; % Decrease the temperature
max_k = 500; % Maximum number of iterations before cooling

% With the current parameters, the algorithm is much slower if enable
plot_flag = false; % enable/disable plotting

% Overwrite if an old version of the diary exist
dfile ='OutputTest_SA_req5.txt';
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
            
            [best_path, best_distance, sa_iterations] = simulated_annealing(cities, tMax, coolingRate, max_k, plot_flag);

            best_distance
            sum_distance = sum_distance + best_distance;
            std_distance(i) = best_distance
                  
        end
        
        disp(" ")
        disp("------------Final Results----------------")
        average = sum_distance/30
        standard_deviation = std(std_distance)
    
    disp(['Elapsed time: ' num2str(round(toc/60,1)) ' minutes']) % Stop stopwatch timer

diary off % Stop: Store the command window results in a diary file
