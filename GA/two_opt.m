% Take a route that crosses over itself and reorder it so that it does not
function x_new = two_opt(x)

    % Select two nodes randomly
    nodes_to_twoOpt = randsample(x, 2);
    
    % Store the index of both selected nodes separately
    i = find(x == nodes_to_twoOpt(1));
    k = find(x == nodes_to_twoOpt(2));
    
    % However, we do not want "k < i" or "i=1"
    if (k < i || i == 1)
    
        % Continue to choose random until to find two elements that they are
        % not next to each other
        while (k < i || i==1)
    
            % Select two nodes randomly
            % We want to choose two elements from the solution
            nodes_to_twoOpt = randsample(x, 2);
            
             % Store the index of both selected nodes separately
            i = find(x == nodes_to_twoOpt(1));
            k = find(x == nodes_to_twoOpt(2));
    
        end
    end
    
    % E.g, if x = [0, 1, 2, 4, 5, 3]
    % E.g., i = 2 and k = 5
    
    % Step 1: take $route[1]$ to $route[i-1]$ and add them in order to
    % $newroute$
    x_new = x(1:(i-1)); % x_new = [0]
    
    % Step 2: take $route[i]$ to $route[k]$ and add them in reverse order to
    % $newroute$ 
    A = x(i : k); % A = [1, 2, 4, 5]
    B = fliplr(A); % B = [5, 4, 2, 1]
    
    x_new = [x_new, B]; % x_new = [0, 5, 4, 2, 1]
    
    % % Step 3: take $route[k+1]$ to end and add them in order to new $newroute$
    x_new = [x_new, x(k+1:end)]; % x_new = [0, 5, 4, 2, 1, 3]

end