function disparityMap = disparity_unique(frameLeftGray, frameRightGray)

frameLeftGray = double(frameLeftGray);
frameRightGray = double(frameRightGray);

[r, c]=size(frameLeftGray);
disparityMap = zeros(r, c);

offsetV=5;

for i = offsetV+1:r-offsetV
    for j = 1:c-64
        best_offsetH = 0;
        best_offsetV = 0;
        min_diff = 10000000;
        %max_offset = min(64, c-j);
        %for k = 1:max_offset
        for l = -offsetV:offsetV
            for k=0:64
                if frameLeftGray(i+l, j+k)==0
                    continue;
                end
                diff=(frameRightGray(i,j)-frameLeftGray(i+l, j+k))^2;
                if diff<min_diff
                    min_diff = diff;
                    best_offsetH = k;
                    best_offsetV = l;
                end
            end            
        end
        frameLeftGray(i+best_offsetV, j+best_offsetH)=0;
        disparityMap(i,j)=best_offsetH;
    end
    if mod(i, 5)==0
        percentage = num2str(floor((i)/(r-offsetV)*100));
        dispText = ['Disparity_unique ----------- %', percentage];
        disp(dispText);
    end
end

% disparityMap = uint8(disparityMap)


end