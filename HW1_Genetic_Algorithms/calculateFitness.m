function fitness = calculateFitness(target, population)

fitness=zeros(1, length(population));
for i=1:size(population)
    match = target == population(i,:); %if match, become 1, otherwise become0
    fitness(i) = sum(match)/length(target);     %sum
end

end