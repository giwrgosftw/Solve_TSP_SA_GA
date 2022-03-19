% Clear workspace
clear all

% Clear command window
clc

% Changes the output display format in the Command Window to the format
% displays numeric values in a compact form with 5 total digits
format shortG

% Hard coded: Distances copied from the latest log file
% "test_SA_10000_fitness_req5"
SA = [10738
10770
10707
10983
10628
10716
10820
10860
11089
10711
10648
10628
10711
10690
10701
10855
10648
10738
10840
10770
10878
10785
10692
10711
10965
10835
10628
10789
10725
10882
];

% Hard coded: Distances copied from the latest log file
% "test_GA_10000_fitness_req5"
GA = [40749
39252
35169
31256
34707
31062
30886
34740
29821
34468
37980
30225
39437
31568
35438
36741
32485
27463
34344
31838
31052
35199
33260
30426
34193
29583
33594
38686
39961
27607
];

% Run Wilcoxon Signed Rank Test
[p, h, stats ] = signrank(SA, GA)