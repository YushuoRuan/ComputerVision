function pool = buildMatingPool(fitness, factor, expF)

pool=[];
fitness = fitness .^expF; %increase individual spaces
fitness = (fitness - min(fitness)) / ( max(fitness) - min(fitness) ); %normalization 
fitness = fitness .*factor; 
fitness = round(fitness); %round to nearest integer

% fitness=factor/max(fitness).*fitness;
% fitness = round(fitness); 

for i = 1:length(fitness)
    for j = 1:fitness(i)
        pool=[pool, i];
    end
end