A = [5 7 2; 
        3 6 4; 
        5 6 16]
A2 = [5 7 2; 
        3 4 5; 
        7 1 2];

X2=[1 1];
Z2=[9 2;
        inf inf ; 
        inf inf; 
        inf inf;
        3 4];

find(~(A==A)==1)


A(:,:,2) = A2

B(:,:,[1 2])=A(:,:,[1 2])


sum(B,[1 2])
a=mean(B,[1 2])

B
a
t=B-a

t = sqrt((sum(t.^2,[1 2]))./8)

s=std(B,0, [1 2])