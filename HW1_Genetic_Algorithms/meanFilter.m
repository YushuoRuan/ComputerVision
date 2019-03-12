function newImg = meanFilter(img)
% imgR = img(:,:,1);
% imgG = img(:,:,2);
% imgB = img(:,:,3);
% n=[3 3];
% h = fspecial('average', n);
% imgRf=filter2(h, imgR);
% imgGf=filter2(h, imgG);
% imgBf=filter2(h, imgB);
% newImg(:,:,1)=round(imgRf);
% newImg(:,:,2)=round(imgGf);
% newImg(:,:,3)=round(imgBf);
%newImg = uint8(newImg);
%https://stackoverflow.com/questions/41287452/geometric-mean-filter-for-denoising-image-in-matlab
h = ones(3,3);
imgD = double(img);
geo_mean = imfilter(log(imgD), h, 'replicate');
geo_mean = exp(geo_mean);
newImg = geo_mean .^ (1/numel(h));
end