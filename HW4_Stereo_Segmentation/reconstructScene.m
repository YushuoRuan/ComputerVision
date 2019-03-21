%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #4 Stereo_Segmentation
%Instructor: Ioana Fleming
%======================
function points3D = reconstructScene(disparitymap,stereoParams)

%get size, baseline, and focal length
[row,col]=size(disparitymap);
B=sqrt(sum(stereoParams.TranslationOfCamera2.^2));
f=stereoParams.CameraParameters1.FocalLength(1);

%initialize
points3D = zeros(row,col);

%calculate
for i=1:row
    for j=1:col
        points3D(i,j,1)=j*6;
        points3D(i,j,2)=i*6;
        points3D(i,j,3)=B*f/disparitymap(i,j);
    end
end

    
end