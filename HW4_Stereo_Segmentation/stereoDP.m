function disparityLine = stereoDP(e1, e2, maxDisp, occ)

row = length(e1);
col = length(e2);
d = zeros(row, col);
D = zeros(row+1, col+1);
dir = zeros(row+1, col+1);

for i =1:row
    for j = 1:col
        d(i,j) = (e1(i)-e2(j))^2;
    end
end

for j = 1:col+1
    D(1,j) = (j-1)*occ;
end

for i =1:row+1
    D(i, 1) = (i-1) * occ;
end

%D(1,1)=d(1,1);

for i = 2:row+1
    for j = 2:col+1
%         if i==2 && j==2
%             continue;
%         end
        
        tmp = [D(i-1, j-1)+d(i-1, j-1) D(i-1,j)+occ D(i, j-1)+occ];
        [minV, minI] = min(tmp);
        D(i,j) = minV;
        dir(i, j) = minI;
    end
end

disparityLine =NaN(1, row);

ri = row+1;
cj = col+1;
disparity = 0;
count = col;
while (ri~=1) || (cj~=1)
    if dir(ri, cj)==1
        ri=ri-1;
        cj=cj-1;
        disparityLine(count)=disparity;
        count=count-1;
    elseif dir(ri, cj)==2
        ri=ri-1;
        disparity=disparity+1;
        if disparity>maxDisp
            disparity=63;
        end
        count = count-1;
    elseif dir(ri,cj)==3
        disparity=disparity-1;
        cj=cj-1;
    else
        break;   
    end
end

if count~=1
    for i = count:-1:1
        disparityLine(i) = disparity;
    end
end

end