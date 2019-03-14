%% Depth Estimation From Stereo Video
% This example shows how to detect people in video taken with a calibrated stereo 
% camera and determine their distances from the camera.
%% Load the Parameters of the Stereo Camera
% Load the |stereoParameters| object, which is the result of calibrating the 
% camera using either the |stereoCameraCalibrator| app or the |estimateCameraParameters| 
% function.

% Load the stereoParameters object.
load('handshakeStereoParams.mat');

stereoParams.TranslationOfCamera2

stereoParams.CameraParameters1.FocalLength
stereoParams.CameraParameters1.FocalLength

% Visualize camera extrinsics.
%showExtrinsics(stereoParams);
%% Create Video File Readers and the Video Player
% Create System Objects for reading and displaying the video.

videoFileLeft = 'handshake_left.avi';
videoFileRight = 'handshake_right.avi';

readerLeft = vision.VideoFileReader(videoFileLeft, 'VideoOutputDataType', 'uint8');
readerRight = vision.VideoFileReader(videoFileRight, 'VideoOutputDataType', 'uint8');
player = vision.DeployableVideoPlayer('Location', [20, 400]);
%% Read and Rectify Video Frames
% The frames from the left and the right cameras must be rectified in order 
% to compute disparity and reconstruct the 3-D scene. Rectified images have horizontal 
% epipolar lines, and are row-aligned. This simplifies the computation of disparity 
% by reducing the search space for matching points to one dimension. Rectified 
% images can also be combined into an anaglyph, which can be viewed using the 
% stereo red-cyan glasses to see the 3-D effect.

frameLeft = readerLeft.step();
frameRight = readerRight.step();

[frameLeftRect, frameRightRect] = ...
    rectifyStereoImages(frameLeft, frameRight, stereoParams);

%figure;
%imshow(stereoAnaglyph(frameLeftRect, frameRightRect));
%title('Rectified Video Frames');
%% Compute Disparity
% In rectified stereo images any pair of corresponding points are located on 
% the same pixel row. For each pixel in the left image compute the distance to 
% the corresponding pixel in the right image. This distance is called the disparity, 
% and it is proportional to the distance of the corresponding world point from 
% the camera.

imgL = imread('frame_1L.png');
imgR = imread('frame_1R.png');

frameLeftGray  = rgb2gray(imgL);
frameRightGray = rgb2gray(imgR);
    
% disparityMapUnique = disparity_NCC_unique(frameLeftGray, frameRightGray, 5);
% disparityMap = disparity_NCC(frameLeftGray, frameRightGray, 5);


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