child = double(imread('10x10wifi.jpg'));
rate = 1;
random = 25;
range = 30;

[M,N,L] = size(child);

 %mutation or not at all
mutationMask = randi([1, 100/rate], M, N, L);

%what kind of mutation
randMask = randi([1, 100], M, N, L) <=random;

%final mutation mask (2 kinds)
randAllMask = mutationMask&randMask;
randRangeMask = mutationMask&(~randMask);

%+-range(30) to the child
rangeMatrix = (randi([-range, range], M, N, L)).*randRangeMask;
newChild = child+rangeMatrix;

%check boundary;
underZero = newChild<0;
above255 = newChild>255;

%fix boundary
newChild = newChild.*(~underZero);
newChild = newChild.*(~above255) + repmat(255,M,N,L).*(above255);

%total random case
randMatrix = randi([1, 255], M, N, L);
newChild = (newChild.*(~randAllMask))+((randMatrix.*randAllMask));