%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
function disparityLine = stereoDP(e1, e2, maxDisp, occ)

row = length(e1);
col = length(e2);
d = zeros(row, col); %distance matrix
D = zeros(row+1, col+1); %DP matrix
dir = zeros(row+1, col+1);%direction matrix

%cauculate distance between pixels
for i =1:row
    for j = 1:col
        d(i,j) = (e1(i)-e2(j))^2;
    end
end

%initialize first col and first row to "skip costs"
for j = 1:col+1
    D(1,j) = (j-1)*occ;
end
for i =1:row+1
    D(i, 1) = (i-1) * occ;
end

%starts dynamic programming
for i = 2:row+1
    for j = 2:col+1
        %costs from 3 directions
        tmp = [D(i-1, j-1)+d(i-1, j-1) D(i-1,j)+occ D(i, j-1)+occ];
        [minV, minI] = min(tmp);
        D(i,j) = minV; %choose least cost
        dir(i, j) = minI; %record direction
        %1: northwest
        %2: north
        %3: west
    end
end

disparityLine =NaN(1, row);

ri = row+1;
cj = col+1;
disparity = 0;
count = col;
while (ri~=1) || (cj~=1)
    if dir(ri, cj)==1 %northwest, that's a match
        ri=ri-1; %go to northwest
        cj=cj-1;
        %update current disparity
        disparityLine(count)=disparity;
        count=count-1; 
    elseif dir(ri, cj)==2%north, that's a skip ->
        ri=ri-1; %go to north
        disparity=disparity+1;
        %in case it exceed 
        if disparity>maxDisp
            disparity=63;
        end
        count = count-1;
    elseif dir(ri,cj)==3%northwest, that's a skip <-
        disparity=disparity-1;
        cj=cj-1; %go to west
    else
        break;   
    end
end

%if reach west bound, ship <- to fill the disparity map. 
if count~=1
    for i = count:-1:1
        disparityLine(i) = disparity;
    end
end

end