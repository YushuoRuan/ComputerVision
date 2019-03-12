%======================
%Yushuo Ruan                             
%CSCI 5722
%Assignment #2
%Instructor: Ioana Fleming
%======================
function bestH = computeH(P)

%array that records distant sum and H every iteration. 
HList = zeros(3,3,100);
DList = zeros(1,100);

%iterate 100 times to find the best H.
for iter=1:100
    ransac = randperm(10,4);%4 unique random #s
    ransac = [1 2 3 4];
    A = zeros(8,9);
    for i = 1:4
        %build A matrix
        x1=P(ransac(i),2);
        y1=P(ransac(i),1);
        x2=P(ransac(i),4);
        y2=P(ransac(i),3);
        ax = [-x1 -y1 -1 0 0 0 x2*x1 x2*y1 x2];
        ay = [0 0 0 -x1 -y1 -1 y2*x1 y2*y1 y2];
        A(i*2-1,:) = ax;
        A(i*2,:) = ay;
    end
    
%     A(9,:)=[0 0 0 0 0 0 0 0 1]
%     b = [0;0;0;0;0;0;0;0;1]
%     h = A\b;
    
%use svd to solve Ah=0.
    [u,s,v] = svd(A);
    h = v(:, 9)./v(9,9);
    h=reshape(h,3,3)';
    HList(:,:,iter)=h;

    %calculate sum of distances between 
    %transformed points and original points
    distSum = 0;
    for j = 1:4
        %new points = H*original points
        nP = h*[P(j,2); P(j,1); 1];
        nP = nP./nP(3);
        a = [nP(1) nP(2)];
        b = [P(j,4) P(j,3)];
        distSum = distSum+norm(b-a);
    end
    DList(iter)=distSum;
end

%return bestH with minimun error
[minV, minI] = min(DList);
bestH = HList(:,:,minI);


end