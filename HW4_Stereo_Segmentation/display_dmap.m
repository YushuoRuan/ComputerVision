%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
function [d_color] = display_dmap(d)

[row, col] = size(d);

d_color = d;

%normalize to 0~1
min_d = min(d_color, [], 'all');
d_color = d_color-min_d;
max_d = max(d_color, [], 'all');
d_color = (d_color./max_d);

%make gray scale
d_color(:,:,2) = d_color(:,:,1);
d_color(:,:,3) = d_color(:,:,1);

%find occluded pixels, display in red
for i =1:row
    for j = 1:col
        if isnan(d(i,j))
            d_color(i ,j ,1) = 1;
            d_color(i ,j ,2) = 0;
            d_color(i ,j ,3) = 0;
        end
    end
end

figure;
imshow(d_color);
title('DP Disparity Map');

end