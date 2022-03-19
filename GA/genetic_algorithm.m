%% Implementation of Genetic Algorithm (GA) for solving a TSP
function best_distance = genetic_algorithm(cities, population_length, max_t, crossover_rate, mutation_rate)

    for i=1:population_length
        %% Generate initial population of solutions
        cities_length = length(cities);
        population(:,i) = randperm(cities_length);
        
        %% Evaluate the fitness of each individual
        indv_coordinates = cities(:, population);
        fitness_distance(i, :) = distance(indv_coordinates);
    end

    t = 1; % counter for the iterations of the while-loop
    while t ~= max_t
    
        %% Selection - Select the two parents from the population solutions based on their fitness
        [parent1, parent2] = selection(population, fitness_distance, population_length);
    
        %% Variation - Breed new individuals (two offsprings/children)
        %% by applying variation (Crossover + Mutation) operators to parents
        % Two-point Crossover
        if crossover_rate >= rand

            [offspring1, offspring2] = two_point_crossover(cities_length, parent1, parent2);
    
            % Swap Mutation
            if mutation_rate >= rand
                [offspring1, offspring2] = swap_mutation(offspring1, offspring2, cities_length);
            end
            
            % Apply 2-Opt Local search for each offspring
            offspring1 = (two_opt(offspring1'))';
            offspring2 = (two_opt(offspring2'))';
            
            %% 1. Evaluation/Fitness calculation - Evaluate the fitness of new individuals AND
            %% 2. Reproduction - Generate new population by replacing least-fit individuals
            [population, fitness_distance] = evaluation_and_reproduction(cities, offspring1, offspring2, population, fitness_distance);
    
        end
    
        %% Elitism - a collection of the best individuals in each iteration
        [~, index] = min(fitness_distance);
        elitism(:, t) = population(:, index);
        total_distances(t, :) = fitness_distance(index, :);
        
        %% Termination
        % Termination criteria:
        % If it has reached the maximum number of iterations
        % then the while-loop will stop, otherwise
        % the iteration will continue to increase
        t = t + 1;
    
    end
  
  best_distance = min(total_distances);

end