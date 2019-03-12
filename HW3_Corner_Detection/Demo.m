A= fspecial('gaussian',[7 7],1);

img=double(rgb2gray(imread('peppers.png')));
imgf=conv2(img,A);

imshow(uint8(imgf))