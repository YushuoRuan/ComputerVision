%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #2
%Instructor: Ioana Fleming
%======================
function newImg = warp1(H, image, imageO)

%convert to double
image = double(image);
[M, N, ~] = size(image);

%get the new corner from original corner
corner = [1 1 1; N 1 1; 1 M 1; N M 1]';
newCorner = H*corner;
newCorner = floor(newCorner(1:2,:)./newCorner(3,:));
minX = min(newCorner(1,:));
maxX = max(newCorner(1,:));
minY = min(newCorner(2,:));
maxY = max(newCorner(2,:));

%get new dimention
nM = maxY-minY+1;
nN = maxX-minX+1;
dim = nM*nN;

%get range
xR=minX:maxX;
yR = minY: maxY;
[xRc, yRc] = meshgrid(xR, yR);

%get new frame size for mosaicing
frameXmin = min(minX, 0);
frameYmin = min(minY, 0);
frameXmax = max(maxX, N);
frameYmax = max(maxY, M);


allCoor = [xRc(:) yRc(:) ones(nM*nN, 1)]';%coordinate after tramsform
trueCoor = [allCoor(1,:)-frameXmin+1; allCoor(2,:)-frameYmin+1]; %coordinate on canvas
backCoor = H\allCoor; %transform back to original for interpolation
backCoor = backCoor./backCoor(3,:);

%create canvas.
newImg = NaN(frameYmax-frameYmin, frameXmax-frameXmin, 3);

%put second image onto canvas first.
[MO, NO, ~] = size(imageO);
newImg(-frameYmin+1:-frameYmin+MO, -frameXmin+1:-frameXmin+NO, :) = imageO;
for i = 1:dim
        %interpolation for all points. 
        x=backCoor(1,i);
        y=backCoor(2,i);
        a=x-floor(x);
        b=ceil(y)-y;
        %if can't get pixels (out of boundary) from original image, skip
        if floor(x)<=0 || floor(y) <=0 ||ceil(x)>N ||ceil(y)>M
%             newImg(trueCoor(2,i), trueCoor(1,i), 1) = NaN;
%             newImg(trueCoor(2,i), trueCoor(1,i), 2) = NaN;
%             newImg(trueCoor(2,i), trueCoor(1,i), 3) = NaN;
            continue;
        end
        %apply bilinear interpolation
        newImg(trueCoor(2,i), trueCoor(1,i), 1) = (1-a)*(1-b)*image(ceil(y), floor(x), 1)  +  a*(1-b)*image(ceil(y), ceil(x), 1)   +   a*b*image(floor(y), ceil(x), 1)  +   (1-a)*b*image(floor(y), floor(x), 1);
        newImg(trueCoor(2,i), trueCoor(1,i), 2) = (1-a)*(1-b)*image(ceil(y), floor(x), 2)  +  a*(1-b)*image(ceil(y), ceil(x), 2)   +   a*b*image(floor(y), ceil(x), 2)  +   (1-a)*b*image(floor(y), floor(x), 2);
        newImg(trueCoor(2,i), trueCoor(1,i), 3) = (1-a)*(1-b)*image(ceil(y), floor(x), 3)  +  a*(1-b)*image(ceil(y), ceil(x), 3)   +   a*b*image(floor(y), ceil(x), 3)  +   (1-a)*b*image(floor(y), floor(x), 3);

end