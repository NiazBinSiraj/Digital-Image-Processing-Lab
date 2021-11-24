%Take grayscale image of size 512x512, add some salt and pepper noise and
%apply average and median spatial filters with 5x5 mask and observe their
%performance for noise suppression in term of PSNR

image = imread('images/image.jpg');
subplot(2,2,1);
imshow(image);
title('Original Image');

image_noise = imnoise(image, 'salt & pepper',0.1);
subplot(2,2,2);
imshow(image_noise);
str = strcat('Noisy Image with PSNR = ', num2str(psnr(image_noise, image)));
title(str);

mean_filter = [
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    ];
image_mean = imfilter(image_noise, mean_filter);
subplot(2,2,3);
imshow(image_mean);
str = strcat('Mean Filtered Image with PSNR = ', num2str(psnr(image_mean, image)));
title(str);

image_med = medfilt2(image_noise, [5,5]);
subplot(2,2,4);
imshow(image_med);
str = strcat('Median Filtered Image with PSNR = ', num2str(psnr(image_med, image)));
title(str);


