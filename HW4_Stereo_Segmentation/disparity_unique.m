%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
function disparityMap = disparity_unique(frameLeftGray, frameRightGray, windowSize)

%Convert to double
frameLeftGray = double(frameLeftGray);
frameRightGray = double(frameRightGray);
%Gkernel = fspecial('gaussian', [windowSize windowSize], 1);

[r, c]=size(frameLeftGray);
disparityMap = zeros(r, c);

halfWindow = (windowSize-1)/2;

for i = halfWindow+1:r-halfWindow%loop through pixels in whole image
    %at the current row, keep track of matched pixel and avoid it
    matched = zeros(1,c);
    for j = halfWindow+1:c-64-halfWindow
        best_offset = 0;
        max_ncc = 0;
        %max_offset = min(64, c-j);
        %for k = 1:max_offset
        for k=0:64%looking for match window in range of 64
            if matched(j+k)==1
                %skip matched pixels
                continue;
            end
            %define window for ncc
            windowL = frameLeftGray(i-halfWindow:i+halfWindow, j+k-halfWindow:j+k+halfWindow);
            windowR = frameRightGray(i-halfWindow:i+halfWindow, j-halfWindow:j+halfWindow);
            tmp1 = sum(windowL.*windowR , 'all');
            tmp2 =sum(windowR.*windowR , 'all');
            tmp3 = sum(windowL.*windowL , 'all');  
            %apply ncc algorithm
            ncc = tmp1/sqrt(tmp2*tmp3);
           
             %keep track of largest ncc and best offset
            %if two best match found, keep the first one. (not replacing)
            if ncc>max_ncc
                max_ncc = ncc;
                best_offset = k;
            end
        end
        
        %only take in disparity when the pixel finds good match
        if max_ncc > 0.998
            disparityMap(i,j)=best_offset;
            matched(j+best_offset) = 1;
        end
    end
    
    %display progress
     if mod(i, 5)==0
        percentage = num2str(floor((i-halfWindow)/(r-halfWindow-halfWindow)*100));
        dispText = ['Disparity_NCC_Unique ', num2str(windowSize), ' ----------- %', percentage];
        disp(dispText);
    end
end

% disparityMap = uint8(disparityMap)


end