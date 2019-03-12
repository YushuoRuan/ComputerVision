function population=buildPopulation2(target, populationSize)
[M,N,L]=size(target);%get dimensions of target
population = {};
for i = 1:populationSize
    %append random image to population
    randImg=randi([1, 255], M, N, 3);
    population=[population, randImg];
end
end