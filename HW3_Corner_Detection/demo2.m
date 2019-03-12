img = double(rgb2gray(imread('peppers.png')));
G = fspecial('gaussian',[7 7],1)
imgf = conv2(img, G, 'same');


dx = [-1 0 1; -1 0 1; -1 0 1];
dy = dx'

Ix = conv2(imgf, dx, 'same');
Iy = conv2(imgf, dy, 'same');

imshow(Ix.^2)

