%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
%normalize images
frameLeftGrayN  = double(frameLeftGray)./255;
frameRightGrayN = double(frameRightGray)./255;

%get sizes
[row, col] = size(frameLeftGrayN);

%initialize
disparityMapDP = zeros(row, col);

%run DP on each row
for i = 1: row
    if mod(i, 10)==0
        disp(i); %display progress
    end
    %define same row from R and L
    er = frameRightGrayN(i,:);
    el = frameLeftGrayN(i,:);
    %run DP
    D = stereoDP(er, el, 63, 0.01);
    disparityMapDP(i,:) = D; %store
    
end

figure;
imshow(disparityMapDP, [0, 64]);
title('DP Disparity Map');
colormap jet
colorbar

display_dmap(disparityMapDP);
