I = imread('image1.jpg');
Irotate = imrotate(I,90);
Itrans = imtranslate(I, [50,50]);
Iscale = imresize(I, 5);

w=21;
threshold = 50000;
suppression = 1;

[corner_coords, descriptors]= harris(Iscale, w, threshold, suppression);
figure, imshow(Iscale), hold on, plot(corner_coords(:,2), corner_coords(:,1), 'ys')