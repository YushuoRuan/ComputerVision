function newChild = causeMutation2(child,rate,random,range)

[M,N,L] = size(child);

 %mutation or not at all
mutationMask = randi([1, 100/rate], M, N, L)==1;

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



% for i = 1:M
%     for j = 1:N
%         for k = 1:L
%             %mutation or not at all
%             mutation=randi([1, 100/rate], 1, 1);
%             if mutation==1
%                 %what kind of mutation
%                  randomValue=randi([1, 100], 1, 1);
%                  if randomValue<=random
%                      %complete random
%                      child(i,j,k)=randi([0, 255], 1, 1);
%                  else
%                      %+-30 to the pixel
%                      change=randi([-range, range], 1, 1);
%                      child(i,j,k) =  child(i,j,k) + change;
%                      %check boundary
%                      if child(i,j,k)>255
%                          child(i,j,k)=255;
%                      elseif child(i,j,k)<0
%                          child(i,j,k)=0;
%                      end
%                  end
%             end
%         end
%     end
% end
% 
% newChild = child;

end