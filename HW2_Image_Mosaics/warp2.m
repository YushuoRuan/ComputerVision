
%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #2
%Instructor: Ioana Fleming
%======================
function newImg = warp2(H, image)

image = double(image);

[M, N, ~] = size(image);

corner = [1 1 1; N 1 1; 1 M 1; N M 1]';
newCorner = H*corner;
newCorner = newCorner(1:2,:)./newCorner(3,:);
minX = min(newCorner(1,:));
maxX = max(newCorner(1,:));
minY = min(newCorner(2,:));
maxY = max(newCorner(2,:));
Xbound = round(maxX-minX);
Ybound = round(maxY-minY);

newImg = zeros(Ybound,Xbound,3);
for i = 1:M
    for j = 1:N
        newPoint = H*[j;i;1];
        newPoint = newPoint./newPoint(3);
        newi = round(newPoint(2)-minY)+1;
        newj = round(newPoint(1)-minX)+1;
        newImg(newi, newj, :) = image(i,j,:); 
    end
end

%image(uint8(newImg2));
%axis([1, maxX-minX+50, 1, maxY-minY+50]);

end








