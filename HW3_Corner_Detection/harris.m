function [corner_coords, descriptors] = harris(I, w, threshold, suppression)

%convert image to gray scale
img = double(rgb2gray(I));

%apply gaussian filter to denoise
G = fspecial('gaussian',[w w],1);
imgf = conv2(img, G, 'same');

%get image size
[dimRow, dimCol]=size(img)

dx = [-1 0 1; -1 0 1; -1 0 1];
dy = dx';

%calculate derivative on each pixel
Ix = conv2(imgf, dx, 'same');
Iy = conv2(imgf, dy, 'same');

%calculate hassian matrix M with weight filter
Ixx = conv2(Ix.^2, G, 'same');
Iyy = conv2(Iy.^2, G, 'same');
Ixy = conv2(Ix.*Iy, G, 'same');

%calculate cornerness
R = (Ixx.*Iyy-Ixy.*Ixy)-0.05*(Ixx+Iyy).^2;

if suppression 
    %ordfilt returns w^2 th most intense pixel in the w x w window
    localMax = ordfilt2(R, w^2, ones(w));
    corners = (R==localMax) & (R>=threshold);
else
    corners = (R>=threshold);
end

%get rid of margin corners so the descriptor won't give error
marginMask = zeros(dimRow, dimCol);
marginMask(2:dimRow-1, 2:dimCol-1) = ones(dimRow-2, dimCol-2);
corners = corners&marginMask;

%write corner points as x, y coordinates. 
[rows, cols]=find(corners);
corner_coords = [rows cols];

% for i = length(rows):1
%     if corner_coords(i,1)==0 || corner_coords(i,1)==dimRaw ||corner_coords(i,2)==0 ||corner_coords(i,2)==dimCol
%         corner_coords(i, :)=[];
%     end
% end

%build descriptor for each corner pixel.
descriptors = zeros(length(rows), 9);
for i = 1:size(rows)
    descriptors(i, 1)=img(rows(i)-1, cols(i)-1);
    descriptors(i, 2)=img(rows(i)-1, cols(i));
    descriptors(i, 3)=img(rows(i)-1, cols(i)+1);
    descriptors(i, 4)=img(rows(i), cols(i)-1);
    descriptors(i, 5)=img(rows(i), cols(i));
    descriptors(i, 6)=img(rows(i), cols(i)+1);
    descriptors(i, 7)=img(rows(i)+1, cols(i)-1);
    descriptors(i, 8)=img(rows(i)+1, cols(i));
    descriptors(i, 9)=img(rows(i)+1, cols(i)+1);
end

% figure, imshow(uint8(I)), hold on, plot

end 