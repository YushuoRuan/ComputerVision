%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #2
%Instructor: Ioana Fleming
%======================

%read images
im1 = imread('cuLogo.jpg');
im2 = imread('switch.jpg');

%for black & white images. 
% im1(:,:,2) = im1(:,:,1);
% im1(:,:,3) = im1(:,:,1);
% im2(:,:,2) = im2(:,:,1);
% im2(:,:,3) = im2(:,:,1);

%get corresponding points
P = getPoints(im1, im2);

%compute the Homography Matrix
H = computeH(P);

%warp image and create mosaic
newImg = warp1(H, im1, im2);


% image(uint8(newImg));
subplot(2,2,1), imshow(im1);
subplot(2,2,2), imshow(im2);
subplot(2,2,3), imshow(uint8(newImg));






