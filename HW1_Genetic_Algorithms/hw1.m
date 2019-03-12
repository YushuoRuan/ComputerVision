tic
target='To be or not to be';
populationSize=200;
factor = 10; %mating factor
expF = 3; 
threshlold = 0.1;  %mininum fitness to be in the mating pool
method=0; %breed method
rate=1; %mutation rate
maxGeneration = 2000; 
generation = 1; 
found = 0; %target not found
maxFit=[];
avgFit=[];
genDiv = [];

population=buildPopulation(target, populationSize);

fileID = fopen('Task1-6.txt','w');
fprintf(fileID,'Generation \t BestPhrase \t MaximumFitness \t AverageFitness \t GeneticDiversity \n');

while generation < maxGeneration
    %disp( "Generation: " + generation);
    fitness=calculateFitness(target, population);
    [maxV, maxI]=max(fitness);
    avgV=mean(fitness);
    maxFit=[maxFit, maxV];
    avgFit = [avgFit, avgV];
    genDiv = [genDiv, maxV-avgV];
    
    fprintf(fileID,'%d            %s     %f             %f                  %f \n', generation, population(maxI,:), maxV, avgV, maxV-avgV);
    
    if maxV==1
        disp( "Target found!");
        disp( "Generation: " + generation);
        disp( "Max fitness: " + maxV);
        disp( "String: " + population(maxI,:)); 
        break;
    end
    
    if mod(generation,10)==0
        disp( "Generation: " + generation);
        disp("Max fitness: " + maxV);
        disp( "String: " + population(maxI,:));
    end
    
    pool = buildMatingPool(fitness, factor, expF);
    newPopulation=[];
    %while length(pool)>=2
    for i=1:populationSize
        parent1i=0;
        parent2i=0;
        while parent1i==parent2i
            parent1i=randi([1, length(pool)], 1, 1);
            parent2i=randi([1, length(pool)], 1, 1);
        end
        parent1=population(pool(parent1i),:);
        parent2=population(pool(parent2i),:);
        child = breed(parent1, parent2, method);
        child=causeMutation(child,rate);
        newPopulation =[newPopulation; child];%put child to new population
        %pool(max(parent1i, parent2i))=[]; %delete reproduced parents
        %pool(min(parent1i, parent2i))=[];
     end
    
    population = newPopulation;
    generation=generation+1;
    
end

fclose(fileID);
toc
 
genAxis = linspace(1, generation, generation);
plot(genAxis, maxFit, genAxis, avgFit, genAxis, genDiv);
title('Average and Maximum Fitness over Time');
xlabel('Generation');
ylabel('Fitness');
legend({'Max Fitness','Average Fitness', 'Diversity'},'Location','east');