function child = breed2(parent1, parent2, method)

[M,N,L] = size(parent1);
child=zeros(M,N,L);
if method==0 %half-half breed
    midpoint=randi([1,N], 1, 1); %generate midpoint
    child=[parent1(:, 1:midpoint, :), parent2(:, midpoint+1:end, :)]; %combine each half of the parent. 

elseif method ==1 %random breed
    mask = randi([0,1],M,N,L); % generate random 0-1 3D matrix
    child = (parent1.*~mask) + (parent2.*mask); 
    
%     for i = 1:M
%         for j = 1:N
%             for k = 1:L
%                 if mask(i,j,k)%combine parent depend on the mask matrix
%                     child(i,j,k)=parent1(i,j,k);
%                 else
%                     child(i,j,k)=parent2(i,j,k);
%                 end                
%             end
%         end
%     end
    
else 
    disp("invalid method perameter (0 or 1 only).");
    
end


end