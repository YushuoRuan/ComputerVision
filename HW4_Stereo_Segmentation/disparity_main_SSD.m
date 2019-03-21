%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
disparityMap = disparity(frameLeftGray, frameRightGray);
disparityMap1 = disparity_SSD(frameLeftGray, frameRightGray, 1);
disparityMap5 = disparity_SSD(frameLeftGray, frameRightGray, 5);
disparityMap11 = disparity_SSD(frameLeftGray, frameRightGray, 11);

figure;
subplot(2,2,1);
imshow(disparityMap, [0, 64]);
title('Disparity Map');
colormap jet
colorbar

subplot(2,2,2);
imshow(disparityMap1, [0, 64]);
title('Disparity Map SSD1');
colormap jet
colorbar

subplot(2,2,3);
imshow(disparityMap5, [0, 64]);
title('Disparity Map SSD5');
colormap jet
colorbar

subplot(2,2,4);
imshow(disparityMap11, [0, 64]);
title('Disparity Map SSD11');
colormap jet
colorbar