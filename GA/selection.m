%% Selection - select the two parents from the population solutions based on their fitness
function [parent1, parent2] = selection(population, fitness_distance, population_length)

    % Find parent1: the index of the individual with the least fitness value
    [~, index] = min(fitness_distance);
    parent1 = population(:, index); % Parent1 is the individual of the population with that index
    parent1_distance = fitness_distance(index, :); % Find the dinstance of the parent1

    % Remove parent1 from the population of individuals as well as its distance
    population(:, index) = []; % Remove parent1 from the population
    fitness_distance(index) = []; % Remove parent1's distance from the population
    
    % Find parent2: the index of the individual with the least fitness value
    % (the second best now because we have already deleted the first best one)
    [~, index] = min(fitness_distance);
    parent2 = population(:, index);
    % distance_parent2 = fitness_distance(index, :);

    % As soon as we found parent2, we should return back parent1 to the population
    population(:, population_length) = parent1; % Return parent1 to the population
    fitness_distance(population_length, :) = parent1_distance; % Return parent1's distance too

end