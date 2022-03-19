%% Swap Mutation
% Select two positions on the chromosome at random, and interchange the values
function [offspring1, offspring2] = swap_mutation(offspring1, offspring2, cities_length)

    % Select two positions on the chromosome at random
    chrom1 = round(1+rand*(cities_length-1));
    chrom2 = round(1+rand*(cities_length-1));
    
    % Swap the selected two chromosomes on each offspring
    offspring1([chrom1 chrom2]) = offspring1([chrom2 chrom1]);
    offspring2([chrom1 chrom2]) = offspring2([chrom2 chrom1]);

end