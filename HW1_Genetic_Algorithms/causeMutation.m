function newChild = causeMutation(child,rate)

    asciicode=[32, linspace(65,90,26), linspace(97,122, 26)];
    for i=1:length(child)
        mutation=randi([1, 100/rate], 1, 1);
        if mutation==1 % rate% that mutation would be 0
            child(i)=char(asciicode(randi([1, length(asciicode)], 1, 1)));
        end
    end
    newChild=child;

end