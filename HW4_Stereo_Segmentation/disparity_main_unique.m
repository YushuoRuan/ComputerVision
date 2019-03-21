%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
disparityMapUnique = disparity_unique(frameLeftGray, frameRightGray, 5);
disparityMap = disparity_NCC(frameLeftGray, frameRightGray, 5);

figure;
subplot(1,2,1)
imshow(disparityMap, [0, 64]);
title('Disparity Map NCC');
colormap jet
colorbar

subplot(1,2,2)
imshow(disparityMapUnique, [0, 64]);
title('Disparity Map NCC Unique');
colormap jet
colorbar