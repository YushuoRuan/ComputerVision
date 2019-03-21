%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
function disparityMap = disparity_NCC_RL(frameLeftGray, frameRightGray, windowSize)

frameLeftGray = double(frameLeftGray);
frameRightGray = double(frameRightGray);
%Gkernel = fspecial('gaussian', [windowSize windowSize], 1);

[r, c]=size(frameLeftGray);
disparityMap = zeros(r, c);

halfWindow = (windowSize-1)/2;

for i = halfWindow+1:r-halfWindow
    for j = halfWindow+64+1:c-halfWindow
        best_offset = 0;
        max_ncc = 0;
        %max_offset = min(64, c-j);
        %for k = 1:max_offset
        for k=0:64
            windowL = frameLeftGray(i-halfWindow:i+halfWindow, j-halfWindow:j+halfWindow);
            windowR = frameRightGray(i-halfWindow:i+halfWindow, j-k-halfWindow:j-k+halfWindow);
            %tmp1=sum((windowL-mean(windowL,'all')).*(windowR-mean(windowR,'all')),'all');
            %tmp2=sqrt(sum(windowL-mean(windowL,'all').^2, 'all')*sum(windowR-mean(windowR,'all').^2, 'all'));
            %ncc=tmp1/tmp2;
            tmp1 = sum(windowL.*windowR , 'all');
            tmp2 =sum(windowR.*windowR , 'all');
            tmp3 = sum(windowL.*windowL , 'all');     
            ncc = tmp1/sqrt(tmp2*tmp3);
            if ncc>max_ncc
                max_ncc = ncc;
                best_offset = k;
            end            
        end
        disparityMap(i,j)=best_offset;
    end
     if mod(i, 5)==0
        percentage = num2str(floor((i-halfWindow)/(r-halfWindow-halfWindow)*100));
        dispText = ['Disparity_NCC_LR ', num2str(windowSize), ' ----------- %', percentage];
        disp(dispText);
    end
end

% disparityMap = uint8(disparityMap)


end