function pool = buildMatingPool2(fitness, factor)

pool=[];
fitness1 = fitness .^3; %increase individual spaces
fitness2 = (fitness1 - min(fitness1)) / ( max(fitness1) - min(fitness1) ); %normalization 
fitness3 = fitness2 .*factor; 
fitness4 = round(fitness3); %round to nearest integer
% 
% ratio = factor/max(fitness);
% fitness=ratio.*fitness;
% fitness = round(fitness); 

maxTicket=max(fitness4);

%append fitness index to pool depend on times calculated in fitness
for i = 1:length(fitness4)
    for j = 1:fitness4(i)
        pool=[pool, i];
    end
end