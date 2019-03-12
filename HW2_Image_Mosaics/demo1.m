% Xpr =1 : 10; % min x : max x
% Ypr = 1 : 15; % min y : max y
% [Xnd,Ynd] = ndgrid(Xpr,Ypr);
% [Xmesh,Ymesh] = meshgrid(Xpr,Ypr);
% Xmesh = Xmesh';
% Ymesh = Ymesh';

% 
% Xpr =-4 : 5; % min x : max x
% Ypr = 1 : 15; % min y : max y
% [Xc,Yc] = meshgrid(Xpr,Ypr);
% 
% I = [1 0 0; 0 2 0; 0 0 1];
% 
% allCoor = [Xc(:) Yc(:) ones(150, 1)]';
% 
% result = I*allCoor;
% 
% newPix = zeros(1,1,3);

G = NaN(3,3,3);
G(1,1,1) = G(1,1,1)+1;



H = isnan(G);
H = H(:,:,1)==H(:,:,2)==H(:,:,3);
