function points3D = reconstruct(disparityMap, stereoParams)

    f = stereoParams.CameraParameters1.FocalLength(1);
    B = stereoParams.TranslationOfCamera2;
    
    [row, col] = size(disparityMap);
    
    for i = 1:row
        for j = 1:col


end