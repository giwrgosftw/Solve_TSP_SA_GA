%% Calculates the finess of the two new offsprings/children
%% and creates a new population by replacing the worse individuals with them
function [population, fitness_distance] = evaluation_and_reproduction(cities, offspring1, offspring2, population, fitness_distance)

    %% Evaluation/Fitness calculation - Evaluate the fitness of new individuals
    % Calculate distance of offspring1
    offspring1_coordinates = cities(:, offspring1);
    offspring1_distance = distance(offspring1_coordinates);
    
    % Calculate distance of offspring2
    offspring2_coordinates = cities(:, offspring2);
    offspring2_distance = distance(offspring2_coordinates);

    %% Reproduction - Generate new population by replacing least-fit individuals
    [~, index] = max(fitness_distance); % Find the position/index of the least-fit individual
    population(:, index) = offspring1; % Replace it with offspring1
    fitness_distance(index, :) = offspring1_distance; % Replace its distance with the distance of offspring1

    [~, index] = max(fitness_distance); % Find the position/index of the next least-fit individual
    population(:, index) = offspring2; % Replace it with offspring2
    fitness_distance(index, :) = offspring2_distance; % Replace its distance with the distance of offspring2

end