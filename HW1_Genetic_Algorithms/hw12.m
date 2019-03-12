target = imread('10x10wifi.jpg');
target = double(target);
% target = [0 0; 0 0];
% target(:, :, 2)=[0 0; 0 0];
% target(:, :, 3)=[0 0; 0 0];
populationSize = 200;
maxGeneration = 2000;
tolerance1 = 10; %tolerance for fitness 1,2
tolerance2 = 20; %tolerance for fitness 3,4
factor = 20; %max number of tickets
method = 1; %breeding method. 1 half&half. 2 random
mutationRate = 1;
randomRate = 25; %percentage for totally random mutation.
mutationRange = 30; 
generation=1;

%recording max and average fitness for every generation.  
maxFitAll = zeros(1,maxGeneration); 
avgFitAll =  zeros(1,maxGeneration);


population = buildPopulation2(target, populationSize);

while generation < maxGeneration
    %disp( "Generation: " + generation);
    fitness=calculateFitness2(target, population, tolerance1, tolerance2);
    [maxV, maxI]=max(fitness);
    meanV=mean(fitness);
    
    maxFitAll(generation) = maxV;
    avgFitAll(generation) = meanV;
    
    %save image with max fitness to file.
    saveImg = population{maxI};
    filename = ['C:\Users\Yushuo Ruan\Dropbox\Spring2019\Computer Vision\HW1\wifi\wifi', int2str(generation), '.jpg'];
    imwrite(uint8(saveImg),filename);
    
    if maxV==1
        disp( "Target found!");
        disp( "Generation: " + generation);
        disp( "Max fitness: " + maxV);
        %disp( "String: " + population(maxI,:)); 
        break;
    end
    
    if mod(generation,1)==0
        disp( "Generation: " + generation);
        disp("Max fitness: " + maxV);
        disp("Average fitness: " + meanV);
        %disp( "String: " + population(maxI,:));
    end
    
    pool = buildMatingPool2(fitness, factor);
     
    newPopulation={};
    %while length(pool)>=2
    for i=1:populationSize
        parent1i=1;
        parent2i=1;
        %randomly choose two unique parents to breed.
        while pool(parent1i)==pool(parent2i)
            parent1i=randi([1, length(pool)], 1, 1);
            parent2i=randi([1, length(pool)], 1, 1);
        end
        parent1=population{pool(parent1i)};
        parent2=population{pool(parent2i)};
        child = breed2(parent1, parent2, method);
        child=causeMutation2(child,mutationRate,randomRate, mutationRange);
        newPopulation =[newPopulation, child];%put child to new population
        %pool(max(parent1i, parent2i))=[]; %delete reproduced parents
        %pool(min(parent1i, parent2i))=[];
     end
    
    population = newPopulation;
    generation=generation+1;
    
end


