%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
%SSD RL & LR
disparityMapRL = disparity_SSD_RL(frameLeftGray, frameRightGray, 5);
disparityMapLR = disparity_SSD(frameLeftGray, frameRightGray, 5);

%NCC RL & LR
disparityMapNccRL = disparity_NCC_RL(frameLeftGray, frameRightGray, 5);
disparityMapNccLR = disparity_NCC(frameLeftGray, frameRightGray, 5);

%compute outliers
outlierMapSSD = outliers(disparityMapLR,disparityMapRL,1);
outlierMapNCC = outliers(disparityMapNccLR,disparityMapNccRL,1);

figure;
subplot(2,3,1);
imshow(disparityMapLR, [0, 64]);
title('Disparity Map SSD LR');
colormap jet
colorbar

subplot(2,3,2);
imshow(disparityMapRL, [0, 64]);
title('Disparity Map SSD RL');
colormap jet
colorbar

subplot(2,3,3);
imshow(outlierMapSSD, [0, 2]);
title('Outlier Map SSD');
colormap jet
colorbar


subplot(2,3,4);
imshow(disparityMapNccLR, [0, 64]);
title('Disparity Map NCC LR');
colormap jet
colorbar

subplot(2,3,5);
imshow(disparityMapNccRL, [0, 64]);
title('Disparity Map NCC RL');
colormap jet
colorbar

subplot(2,3,6);
imshow(outlierMapNCC, [0, 2]);
title('Outlier Map NCC');
colormap jet
colorbar