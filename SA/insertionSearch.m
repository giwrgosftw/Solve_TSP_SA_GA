% Do: Put one node right behind another node
% Return: A new solution "x_new"
function x_new = insertionSearch(x)

    x_temp = x(2 : end); % exclude the first element
    
    % Select two nodes randomly
    % We want to choose two elements between the second and the last element
    % of the solution (we do not want to move the 1st element)
    nodes_to_insert = randsample(x_temp, 2);
    
    % Store the index of both selected nodes separately
    insert_node1_index = find(x == nodes_to_insert(1)); % element which we want to move
    insert_node2_index = find(x == nodes_to_insert(2)); % target
    
    % However, we do not want to select values that are next to each other
    if ((abs(insert_node1_index - insert_node2_index) == 1))
    
        % Continue to choose random until to find two elements that they are
        % not next to each other
        while (abs(insert_node1_index - insert_node2_index) == 1)
    
            % Select two nodes randomly
            % We want to swap two elements between the second and the last element
            % of the solution (we do not want to swap the 1st element)
            nodes_to_insert = randsample(x_temp, 2);
            
            % Store the index of both selected nodes separately
            insert_node1_index = find(x == nodes_to_insert(1)); % element which we want to move
            insert_node2_index = find(x == nodes_to_insert(2)); % target
    
        end
    end
    
    % if node1 is before node2
    if insert_node1_index < insert_node2_index
    
        % E.g., if x = [0, 2, 1, 5, 6, 3]
        % and node1 = 1 and node2 = 6
        
        % take everything before node1
        x_before = x(1 : insert_node1_index-1); % x_before = [0, 2]
         
        % take between node1 and node2
        x_between = x((insert_node1_index + 1) : (insert_node2_index - 1)); % x_between = 5
    
        % take everything after node2
        x_after = x((insert_node2_index + 1) : end); % x_after = 3
    
        % concatenate everything in order, creating a new solution
        x_new = [x_before, x_between, x(insert_node1_index), x(insert_node2_index), x_after];
        % x = [0, 2, 1, 5, 6, 3];
        % x_new = [0, 2, 5, 1, 6, 3];
        
    else % if node1 is after node2
    
        % E.g., if x = [0, 2, 1, 5, 6, 3]
        % and node1 = 5 and node2 = 2
    
        % take everything before node2
        x_before = x(1 : insert_node2_index-1); % x_before = 0
         
        % take between node2 and node1
        x_between = x((insert_node2_index + 1) : (insert_node1_index - 1)); % x_between = 1
    
        % take everything after node1
        x_after = x((insert_node1_index + 1) : end); % x_after = [6, 3]
    
        % concatenate everything in order, creating a new solution
        x_new = [x_before, x(insert_node1_index), x(insert_node2_index), x_between, x_after];
    
        % x = [0, 2, 1, 5, 6, 3];
        % x_new = [0, 5, 2, 1, 6, 3];
        
    end

end