% Simulated Annealing algorithm implementation for solving a TSP problem
function [best_route, best_distance, no_iterations] = simulated_annealing(cities, tMax, coolingRate, max_k, plot_flag)
    
    % Define the parameters
    num_cities = length(cities); % Number of cities (48)
    tMin = 1; % Minimum temperature value
    tNow = tMax; % Initialize current temperature value as the maximum one

    % Initialisations
    x = randperm(num_cities); % Initial solution
    x_coordinates = cities(:, x); % Initial solution coordinates
    e = distance(x_coordinates); % Initial objective function

    x_best = x; % Initial best solution
    e_best = e; % Initial best objective function value
    
    % Counters
    i = 0; % Count iterations
    k = 0; % Count iterations for cooling
    
    % Run until to reach the temperature limit
    while tNow > tMin

        % Generate random number "r" (between 0 and 1)
        r = rand(1);

        % Pick some neighbour "x_new" based on "r"
        x_new = neighbour(x, r);

        % Compute the objective function of "x_new"
        xnew_coordinates = cities(:, x_new); % New solution coordinates
        e_new = distance(xnew_coordinates); % New objective function
        
        % Should we move to it?
        p = calculate_probability(e, e_new, tNow);
        if p > r
            % Yes, change state
            x = x_new;
            e = e_new;
            if plot_flag
                plotcities(xnew_coordinates, e);
            end
        end
        
        % Is this the new best?
        if e_new < e_best
            % Save as best found
            x_best = x_new;
            e_best = e_new;
            if plot_flag
                plotcities(xnew_coordinates,e_best);
            end
        end

        % Increase the evaluation
        k = k + 1;

        % Update temperature
        if k == max_k
            tNow = tNow * coolingRate;
            k = 0;
        end

        i = i + 1;
   end
   
   % Return the outputs
   best_route = x_best;
   best_distance = e_best;
   no_iterations = i;

end