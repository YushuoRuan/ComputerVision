function child = breed(parent1, parent2, method)

child=char(zeros(1, length(parent1)));
if method==0
    midpoint=randi([1,length(parent1)], 1, 1); %generate midpoint
    child=[parent1(1:midpoint), parent2(midpoint+1:length(parent2))];

elseif method ==1 
    mask = randi([0,1],1,length(parent1));
    for i=1:length(parent1)
        if mask(i)
            child(i)=parent1(i);
        else
            child(i)=parent2(i);
        end
    end
    
else 
    disp("invalid method perameter (0 or 1 only).");
    
end


end