# Evolutionary Computation - Solving Travelling Salesman Problem using SA and GA (48 US Cities)
**School of Computer Science - University of Birmingham 2021-2022**

Metaheuristic algorithms have proved that they could be great solvers for the Travelling Salesman Problem (TSP). However, due to their unique functionality, it is very difficult for the developers to say which one of them is the most efficient. For that reason, the goal of this project was to implement and compare two metaheuristic algorithms, the Simulated Annealing (SA) and the Genetic Algorithm (GA), for solving the Travelling Salesman Problem with the 48 capitals of the US (ATT48 - as listed here: http://elib.zib.de/pub/mp-testdata/tsp/tsplib/tsp/).

The performance of the two algorithms was investigated and compared through several computational experiments. Additionally, a report is provided in pdf format and includes flowcharts, pseudocodes, experiment results, etc. representing how these two algorithms were implemented, structured and tested. For both algorithms, the main idea was based on the trade-off between exploitation and exploration in order to achieve the best optimal solution.

The project was written in MATLAB programming language.

## How to run
1. Each folder (SA and GA) has its own "main" script file, you can execute it if you want to run the algorithm with the best parameters!
2. There are separate scripts to run the 30 trial runs for each algorithm to tune the parameters:
   * test_SA_parameter_tuning_req4
   * test_GA_parameter_tuning_req4
   
3. There are separate scripts to run the 30 independent runs with 10000 fitness (objective function) evaluations for each algorithm:
   * test_SA_10000_fitness_req5
   * test_GA_10000_fitness_req5

## Demo video link
https://youtu.be/nIW9WMr-ipM
