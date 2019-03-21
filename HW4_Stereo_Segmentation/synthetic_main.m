%disparityMapSSD = disparity_SSD(frameLeftGray2, frameRightGray2, 5);
%disparityMapNCC = disparity_NCC(frameLeftGray2, frameRightGray2, 5);
%diaparityMapUnique = disparity_NCC_unique(frameLeftGray2, frameRightGray2, 5);
diaparityGT = double(imread('frame_1RL.png'));

%1. Compare disparity maps visually by plotting side by side
figure;
subplot(2,2,1);
imshow(disparityMapSSD, [0,64]);
title('Disparity Map SSD5');
colormap jet
colorbar

subplot(2,2,2);
imshow(disparityMapNCC, [0,64]);
title('Disparity Map NCC5');
colormap jet
colorbar

subplot(2,2,3);
imshow(diaparityMapUnique, [0,64]);
title('Disparity Map Uniqueness');
colormap jet
colorbar

subplot(2,2,4);
imshow(diaparityGT, [0,64]);
title('Ground truth');
colormap jet
colorbar


%2.Calculate a map of errors and display it
SSDError = sqrt((disparityMapSSD-diaparityGT).^2);
NCCError = sqrt((disparityMapNCC-diaparityGT).^2);
uniqueError = sqrt((diaparityMapUnique-diaparityGT).^2);

figure;
subplot(2,2,1);
imshow(SSDError);
title('SSD Error');

subplot(2,2,2);
imshow(NCCError);
title('NCC Error');

subplot(2,2,3);
imshow(uniqueError);
title('Uniqueness Error');


%3. Calculate a histogram of disparity differences and display it

figure;
subplot(2,2,1);
hist(SSDError(:))
title('SSD Error');

subplot(2,2,2);
hist(NCCError(:))
title('NCC Error');

subplot(2,2,3);
hist(uniqueError(:))
title('Uniqueness Error');





