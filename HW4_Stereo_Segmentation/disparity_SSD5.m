function disparityMap = disparity_SSD5(frameLeftGray, frameRightGray, windowSize)

frameLeftGray = double(frameLeftGray);
frameRightGray = double(frameRightGray);
Gkernel = fspecial('gaussian', [windowSize windowSize], 1);

[r, c]=size(frameLeftGray);
disparityMap = zeros(r, c);

halfWindow = (windowSize-1)/2;


for i = halfWindow+1:r-halfWindow
    for j = halfWindow+1:c-64-halfWindow
        best_offset = 0;
        min_ssd = 10000000;
        %max_offset = min(64, c-j);
        %for k = 1:max_offset
        for k=0:64
            windowL = frameLeftGray(i-halfWindow:i+halfWindow, j+k-halfWindow:j+k+halfWindow);
            windowR = frameRightGray(i-halfWindow:i+halfWindow, j-halfWindow:j+halfWindow);     
            ssd=sum((windowL.*Gkernel-windowR.*Gkernel).^2, 'all');
            if ssd<min_ssd
                min_ssd = ssd;
                best_offset = k;
            end            
        end
        disparityMap(i,j)=best_offset;
    end
    if mod(i, 5)==0
        percentage = num2str(floor((i-halfWindow)/(r-halfWindow-halfWindow)*100));
        dispText = ['Disparity_SSD ', num2str(windowSize), ' ----------- %', percentage];
        disp(dispText);
    end
end

% disparityMap = uint8(disparityMap)


end