function population=buildPopulation(target, populationSize)
size=length(target);
asciicode=[32, linspace(65,90,26), linspace(97,122, 26)];
index=randi([1, length(asciicode)], populationSize, size);
population=char(asciicode(index));
end