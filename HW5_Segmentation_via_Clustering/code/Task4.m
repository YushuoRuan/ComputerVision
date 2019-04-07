img = imread('../imgs/black_kitten_star.jpg');

img = rgb2gray(img);
img2 = detectSURFFeatures(img);

