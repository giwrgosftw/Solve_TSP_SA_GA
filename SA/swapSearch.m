% Do: Flip the location of two nodes
% Return: A new solution "x_new"
function x_new = swapSearch(x)
    
    % e.g., we got the solution --> x = [0, 1, 2, 4, 5, 3];
    x_temp = x(2 : end); % exclude the first element
    
    % Select two nodes randomly
    % We want to swap two elements between the second and the last element
    % of the solution (we do not want to swap the 1st element)
    nodes_to_swap = randsample(x_temp, 2); % e.g., selects element 3 and 2
    
    % Store the index of both selected nodes separately
    swap_node1_index = find(x == nodes_to_swap(1)); % element 3 --> at index 6 
    swap_node2_index = find(x == nodes_to_swap(2)); % element 2 --> at index 3
    
    % Initialise the new solution
    x_new = x; % x_new = [0, 1, 2, 4, 5, 3]

    % Swap these two nodes based on their index
    x_new([swap_node1_index, swap_node2_index]) = x_new([swap_node2_index, swap_node1_index]);
    % x_new = [0, 1, 3, 4, 5, 2]

end