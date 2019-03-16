function D = stereoDP(e1, e2, maxDisp, occ)

row = length(e1);
col = length(e2);
d = zeros(row, col);
D = zeros(row, col);
dir = zeros(row, col);

for i =1:row
    for j = 1:col
        d(i,j) = (e1(i)-e2(j))^2;
    end
end

for j = 1:col
    D(1,j) = (j-1)*occ;
end

for i =1:row
    D(i, 1) = (i-1) * occ;
end

D(1,1)=d(1,1);

for i = 2:row
    for j = 2:col
%         if i==2 && j==2
%             continue;
%         end
        
        tmp = [D(i-1, j-1)+d(i, j) D(i-1,j)+occ D(i, j-1)+occ];
        [minV, minI] = min(tmp);
        D(i,j) = minV;
        dir(i, j) = minI;
    end
end

dir

% disparityLine = zeros(1, row);
% 
% ri = row;
% cj = col;
% 
% while (ri~=1) || (cj~=1)
%     if dir(ri, cj)==1
%         ri=ri-1;
%         cj=cj-1;
%     elseif dir(ri, cj)==2
%         ri=ri-1;
%     elseif dir(ri,cj)==3
%         cj=cj-1;
%              
%     end

end