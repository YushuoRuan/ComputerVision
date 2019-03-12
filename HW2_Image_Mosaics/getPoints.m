%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #2
%Instructor: Ioana Fleming
%======================
function A = getPoints(im1, im2)

imshow(im1);
[X1,Y1] = ginput(4);

imshow(im2);
[X2,Y2] = ginput(4);

A = [Y1 X1 Y2 X2];

end