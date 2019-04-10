%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
function features = ComputeFeatures(img)
% Compute a feature vector for all pixels of an image. You can use this
% function as a starting point to implement your own custom feature
% vectors.
%
% INPUT
% img - Array of image data of size h x w x 3.
%
% OUTPUT
% features - Array of computed features for all pixels of size h x w x f
%            such that features(i, j, :) is the feature vector (of
%            dimension f) for the pixel img(i, j, :).

    img = double(img);
    height = size(img, 1);
    width = size(img, 2);
    features = zeros([height, width, 1]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                                         %
    %                              YOUR CODE HERE                             %
    %                                                                         %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    color_feature = ComputeColorFeatures(img);
    features(:,:,[1 2 3])=color_feature(:,:,[1 2 3]);
    
    %gradient
%     [features(:,:,1),features(:,:,2)] = imgradientxy(img(:,:,1));
%     [features(:,:,3),features(:,:,4)] = imgradientxy(img(:,:,2));
%     [features(:,:,5),features(:,:,6)] = imgradientxy(img(:,:,3));

    %meanfilter
%     meanFilter = ones(3)/9;
%     features(:,:,1) = filter2(meanFilter,img(:,:,1));
%     features(:,:,2) = filter2(meanFilter,img(:,:,2));
%     features(:,:,3) = filter2(meanFilter,img(:,:,3));

    %medianfilter
%     features(:,:,7) = medfilt2(img(:,:,1),[5 5]); 
%     features(:,:,8) = medfilt2(img(:,:,2),[5 5]); 
%     features(:,:,9) = medfilt2(img(:,:,3),[5 5]); 


    %Gaussianfilter
%     features(:,:,1) = imgaussfilt(img(:,:,1),1/3);
%     features(:,:,2) = imgaussfilt(img(:,:,2),1/3);
%     features(:,:,3) = imgaussfilt(img(:,:,3),1/3);

    %Edge
    features(:,:,4) = edge(img(:,:,1),'Canny');
    features(:,:,5) = edge(img(:,:,2),'Canny');
    features(:,:,6) = edge(img(:,:,3),'Canny');
    
    %position
%  [X,Y] = ndgrid(1:height,1:width);
%     features(:,:,7) = Y;
%     features(:,:,8) = X;
end




