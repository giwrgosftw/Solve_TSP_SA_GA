function d = distance(inputcities)

d = 0;
for n = 1 : length(inputcities)
    % If it is the last city, calculate the distance from the last to the
    % first city
    if n == length(inputcities)
        d = d + ceil(sqrt(sum((inputcities(:,n) - inputcities(:,1)).^2)/10));
    else
        % if it is not, calculate the distance between the current and next
        % city
        d = d + ceil(sqrt(sum((inputcities(:,n) - inputcities(:,n+1)).^2)/10));
    end
end