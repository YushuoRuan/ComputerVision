function fitness = calculateFitness2(target, population, tolerance1, tolerance2)

fitness1=zeros(1,length(population));
fitness2=zeros(1,length(population));
fitness3=zeros(1,length(population));
fitness4=zeros(1,length(population));
targetSize = numel(target);
for p=1:length(population)
    img = population{p};
    % Fitness1: Based on percent of values that fit within a tolerance range from the target image
    match1 = abs(img-target) <= tolerance1; %compare
    fitness1(p)=sum(match1,'all')/targetSize;  %sum/all
    
    %Fitness2: Based on percent of mean values that fit within a tolerance range from the mean values of the target image
    match2 = abs(meanFilter(img)-meanFilter(target)) <= tolerance1;
    fitness2(p)=sum(match2,'all')/targetSize; 
    
    %Fitness3: Based on rate of change up/down as compared with the target image
    match3 = abs(abs(diff(target))-abs(diff(img))) <=tolerance2;
    fitness3(p) = sum(match3,'all')/(numel(diff(target))); 
    
    %Fitness4: Based on rate of change left/right as compared with the target image
    order = [2,1,3];
    imgT = permute(img, order); %transpose both images
    targetT = permute(target, order);
    match3 = abs(abs(diff(targetT))-abs(diff(imgT))) <=tolerance2;
    fitness4(p) = sum(match3,'all')/(numel(diff(targetT))); 
end

%fitness = sqrt(fitness1.^2+ fitness2.^2+fitness3.^2+ fitness4.^2)/2;

fitness = (fitness1+ fitness2+fitness3+ fitness4)/4;
end