function disparityMap = disparity_SSD1(frameLeftGray, frameRightGray, windowSize)

frameLeftGray = double(frameLeftGray);
frameRightGray = double(frameRightGray);

%frameLeftGray = imtranslate(frameLeftGray, [-16,0]);
[r, c]=size(frameLeftGray);
disparityMap = zeros(r, c);


for i = 1:r
    for j = 1:c-64
        best_offset = 0;
        min_ssd = 10000000;
        %max_offset = min(64, c-j);
        %for k = 1:max_offset
        for k=0:64
            ssd = (frameLeftGray(i, j)-frameRightGray(i,j+k))^2;
            if ssd<=min_ssd
                min_ssd = ssd;
                best_offset = k;
            end            
        end
        disparityMap(i,j)=best_offset;
    end
end

% disparityMap = uint8(disparityMap);


end