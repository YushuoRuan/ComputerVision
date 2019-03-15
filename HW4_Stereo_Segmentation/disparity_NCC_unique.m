function disparityMap = disparity_NCC_unique(frameLeftGray, frameRightGray, windowSize)

frameLeftGray = double(frameLeftGray);
frameRightGray = double(frameRightGray);
%Gkernel = fspecial('gaussian', [windowSize windowSize], 1);

[r, c]=size(frameLeftGray);
disparityMap = zeros(r, c);

halfWindow = (windowSize-1)/2;

for i = halfWindow+1:r-halfWindow
    matched = zeros(1,c);
    for j = halfWindow+1:c-64-halfWindow
        best_offset = 0;
        max_ncc = 0;
        %max_offset = min(64, c-j);
        %for k = 1:max_offset
        for k=0:64
            
            if matched(j+k)==1
                continue;
            end
            
            windowL = frameLeftGray(i-halfWindow:i+halfWindow, j+k-halfWindow:j+k+halfWindow);
            windowR = frameRightGray(i-halfWindow:i+halfWindow, j-halfWindow:j+halfWindow);
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
        if max_ncc > 0.998
            disparityMap(i,j)=best_offset;
            matched(j+best_offset) = 1;
        end
    end
     if mod(i, 5)==0
        percentage = num2str(floor((i-halfWindow)/(r-halfWindow-halfWindow)*100));
        dispText = ['Disparity_NCC_Unique ', num2str(windowSize), ' ----------- %', percentage];
        disp(dispText);
    end
end

% disparityMap = uint8(disparityMap)


end