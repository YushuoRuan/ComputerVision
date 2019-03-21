%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
function disparityMap = disparity_SSD(frameLeftGray, frameRightGray, windowSize)

%Convert to double
frameLeftGray = double(frameLeftGray);
frameRightGray = double(frameRightGray);

%get gaussian kernel
Gkernel = fspecial('gaussian', [windowSize windowSize], 1);

[r, c]=size(frameLeftGray);
disparityMap = zeros(r, c);
halfWindow = (windowSize-1)/2;

for i = halfWindow+1:r-halfWindow%loop through pixels in whole image
    for j = halfWindow+1:c-64-halfWindow
        best_offset = 0;
        min_ssd = 10000000;
        %max_offset = min(64, c-j);
        %for k = 1:max_offset
        for k=0:64 %looking for match window in range of 64
            %define window for ssd
            windowL = frameLeftGray(i-halfWindow:i+halfWindow, j+k-halfWindow:j+k+halfWindow);
            windowR = frameRightGray(i-halfWindow:i+halfWindow, j-halfWindow:j+halfWindow);     
            %apply ssd algorithm
            ssd=sum((windowL.*Gkernel-windowR.*Gkernel).^2, 'all');
            %keep track of smallest ssd and best offset
            %if two best match found, keep the first one. (not replacing)
            if ssd<min_ssd
                min_ssd = ssd; 
                best_offset = k; 
            end            
        end
        %put best offset in to disparity map.
        disparityMap(i,j)=best_offset;
    end
    
    %print progress
    if mod(i, 5)==0
        percentage = num2str(floor((i-halfWindow)/(r-halfWindow-halfWindow)*100));
        dispText = ['Disparity_SSD ', num2str(windowSize), ' ----------- %', percentage];
        disp(dispText);
    end
end

% disparityMap = uint8(disparityMap)
end