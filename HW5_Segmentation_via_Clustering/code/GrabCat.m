% Read the input images. 
img = imread('../imgs/grey-cat-grass.jpg');
background = imread('../imgs/backgrounds/beach.jpg');

% Choose the number of clusters and the clustering method.
k = 2;
clusteringMethod = 'hac';

% Choose the feature function that will be used. The @ syntax creates a
% function handle; this allows us to pass a function as an argument to
% another function.
featureFn = @ComputePositionColorFeatures;

% Whether or not to normalize features before clustering.
normalizeFeatures = false;

% Whether or not to resize the image before clustering. If this script
% runs too slowly then you should set resize to a value less than 1.
resize = 0.125;

% Use all of the above parameters to actually compute a segmentation.
segments = ComputeSegmentation(img, k, clusteringMethod, featureFn, ...
                               normalizeFeatures, resize);

% Use the graphical interface to transfer a subset of the selected segments
% to the background image.
[~, compositeImg] = ChooseSegments(segments, background);

% Save the composite image.
imwrite(compositeImg, 'GrabCat.jpg', 'JPG');