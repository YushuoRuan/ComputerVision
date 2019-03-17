function [d_color] = display_dmap(d)

[row, col] = size(d);

d_color = d;

min_d = min(d_color, [], 'all');

d_color = d_color-min_d;

max_d = max(d_color, [], 'all');

d_color = (d_color./max_d);

min(d_color, [], 'all')
max(d_color, [], 'all')

d_color(:,:,2) = d_color(:,:,1);
d_color(:,:,3) = d_color(:,:,1);

for i =1:row
    for j = 1:col
        if isnan(d(i,j))
            d_color(i ,j ,1) = 1;
            d_color(i ,j ,2) = 0;
            d_color(i ,j ,3) = 0;
        end
    end
end

% occluded = isnan(d);
% 
% d_color(:,:,2) = (~occluded).*d_color(:,:,1);
% d_color(:,:,3) = (~occluded).*d_color(:,:,1);

imshow(d_color);

end