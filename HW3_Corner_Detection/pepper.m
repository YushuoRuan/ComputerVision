img=rgb2gray(imread('peppers.png'));
imgSP = imnoise(img,'salt & pepper');

meanFilter = ones(3)/9;

imgSPMean = filter2(meanFilter,imgSP);
imgSPMed = medfilt2(imgSP,[3 3]); %median filter works the best. 
imgSPGauss1 = imgaussfilt(imgSP,1/3);
imgSPGauss2 = imgaussfilt(imgSP,1);
imgSPGauss3 = imgaussfilt(imgSP,1.5);

%imshow(uint8(imgMed))

imgGWN = imnoise(img,'gaussian', 0, 1/256);
%imshow(imgGWN);

imgGWNMean = filter2(meanFilter,imgGWN);
imgGWNMed = medfilt2(imgGWN,[3 3]);
imgGWNGauss1 = imgaussfilt(imgGWN,1/3);
imgGWNGauss2 = imgaussfilt(imgGWN,1); %this one works the best
imgGWNGauss3 = imgaussfilt(imgGWN,1.5);

%imshow(uint8(imgGWNMean))

subplot(2,3,1), imshow(uint8(imgSPMean));
subplot(2,3,2), imshow(uint8(imgSPMed));
subplot(2,3,3), imshow(uint8(imgSPGauss1));
subplot(2,3,4), imshow(uint8(imgSPGauss2));
subplot(2,3,5), imshow(uint8(imgSPGauss3));

% subplot(2,3,1), imshow(uint8(imgGWNMean));
% subplot(2,3,2), imshow(uint8(imgGWNMed));
% subplot(2,3,3), imshow(uint8(imgGWNGauss1));
% subplot(2,3,4), imshow(uint8(imgGWNGauss2));
% subplot(2,3,5), imshow(uint8(imgGWNGauss3));

