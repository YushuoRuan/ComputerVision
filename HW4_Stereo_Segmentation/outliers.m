%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
function outlierMap = outliers(DLR, DRL, TLR)

[r,c] = size(DLR);

outlierMap = zeros(r,c);

for i = 1:r
    for j = 1:c
        if abs(DLR(i,j) - DRL(i,j+DLR(i,j))) > TLR
            outlierMap(i,j) = 1;
        end
    end
end


end