%Take grayscale image of size 512x512, add some solat and pepper noise and
%apply harmonic and geometric mean filter on the noisy image and compare
%their performance with PSNR

dim = 3;
range = floor(dim/2);

image = imread('images/image.jpg');
subplot(2,2,1);
imshow(image);
title('Original Image');

image_noise = imnoise(image, 'salt & pepper');
subplot(2,2,2);
imshow(image_noise);
str = strcat('Noisy Image with PSNR = ', num2str(psnr(image_noise, image)));
title(str);

image_noise = im2double(image_noise);

%Harmonic Mean Filter
image_harmonic = (dim*dim)./imfilter(1./(image_noise+eps), ones(dim,dim), 'replicate');
subplot(2,2,3);
imshow(image_harmonic);
str = strcat('Harmonic Mean Filtered Image with PSNR = ', num2str(psnr(image_harmonic, im2double(image))));
title(str);

%Geometric Mean Filter
image_geometric = exp(imfilter(log(image_noise), ones(dim,dim), 'replicate')).^(1/(dim*dim));
subplot(2,2,4);
imshow(image_geometric);
str = strcat('Geometric Mean Filtered Image with PSNR = ', num2str(psnr(image_geometric, im2double(image))));
title(str);
