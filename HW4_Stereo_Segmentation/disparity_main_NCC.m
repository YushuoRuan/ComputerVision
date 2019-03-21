%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
disparityMap = disparity(frameLeftGray, frameRightGray);
disparityMap3 = disparity_NCC(frameLeftGray, frameRightGray, 3);
disparityMap5 = disparity_NCC(frameLeftGray, frameRightGray, 5);
disparityMap7 = disparity_NCC(frameLeftGray, frameRightGray, 7);

figure;
subplot(2,2,1);
imshow(disparityMap, [0, 64]);
title('Disparity Map');
colormap jet
colorbar

subplot(2,2,2);
imshow(disparityMap3, [0, 64]);
title('Disparity Map NCC3');
colormap jet
colorbar

subplot(2,2,3);
imshow(disparityMap5, [0, 64]);
title('Disparity Map NCC5');
colormap jet
colorbar

subplot(2,2,4);
imshow(disparityMap7, [0, 64]);
title('Disparity Map NCC7');
colormap jet
colorbar