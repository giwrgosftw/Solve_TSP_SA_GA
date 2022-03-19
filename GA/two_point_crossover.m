%% Two-point crossover
% From two parents we take two offsprings/children
function [offspring1, offspring2] = two_point_crossover(cities_length, parent1, parent2)

    % zeros are used to create a matrix for each offspring/child
    offspring1 = zeros(cities_length, 1);
    offspring2 = zeros(cities_length, 1);

    cross_point = cities_length/2; % two-point crossover (Cross point = CP)
    
    offspring1(1:cross_point, 1) = parent1(1:cross_point, 1); % The 1-CP bit in offspringl is the 1-CP bit in parent1
    offspring2(1:cross_point, 1) = parent2(1:cross_point, 1); % The 1-CP bit in offspring2 is the 1-CP bit in parent2
    
    % If the remaining bits in parent2 do not exist in offspring1, 
    % the remaining bits in offspring1 will be filled with the values
    % of the parent2 remaining bits
    for i=cross_point+1:cities_length
        if parent2(i, 1) ~= offspring1(:, 1)
                offspring1(i, 1) = parent2(i, 1);
        end
    end
    for i=cross_point+1:cities_length
        if offspring1(i, 1) == 0
            for j=1:cities_length
                if parent2(j, 1) ~= offspring1(:, 1)
                    offspring1(i, 1) = parent2(j, 1);
                end
            end
        end
    end
    
    % Similarly, if the remaining bits in parent1 do not exist in offspring2, 
    % the remaining bits in offspring2 will be filled with the values
    % of the parent1 remaining bits
    for i= cross_point+1 : cities_length
        if parent1(i, 1) ~= offspring2(:, 1)
                offspring2(i, 1) = parent1(i, 1);
        end
    end
    for i=cross_point+1:cities_length
        if offspring2(i, 1) == 0
            for j=1:cities_length
                if parent1(j, 1) ~= offspring2(:, 1)
                    offspring2(i, 1) = parent1(j, 1);
                end
            end
        end
    end
end