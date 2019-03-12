I = imread('image1.jpg');
IbrighterA = I+100; %the over exposed regions lose the corners. 
IdarkerA = I-100; %the dark regions lose the corners
IbrighterM = I.*1.5; %the over exposed regions lose the corners, but in some region , more corners are detected. 
IdarkerM = I.*0.5; %the dark regions lose the corners


w=21;
threshold = 50000;
suppression = 1;

[corner_coords, descriptors]= harris(IbrighterM, w, threshold, suppression);
figure, imshow(IbrighterM), hold on, plot(corner_coords(:,2), corner_coords(:,1), 'ys')