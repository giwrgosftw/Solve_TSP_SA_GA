function x_new = neighbour(x, r)

    % We split the possibilities equally
    % on how we are going to select that neighbour
    if r < 0.33
        x_new = swapSearch(x); % see swapSearch.m file

    elseif (r > 0.33) & (r<0.66)
        x_new = insertionSearch(x); % see insertionSearch.m file

    else
        x_new = twoOptSearch(x); % see twoOptSearch.m file
    end
end