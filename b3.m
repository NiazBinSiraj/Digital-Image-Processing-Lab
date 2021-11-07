%Take grayscale image of size 512x512, add some solat and pepper noise and
%use different size of mask (3x3, 5x5, 7x7) with average filter for noise
%suppression and observe their performance in term of PSNR

image = imread('images/image.jpg');
subplot(2,6,[1,2,3]);
imshow(image);
title('Original Image');

image_noise = imnoise(image, 'salt & pepper',0.1);
subplot(2,6,[4,5,6]);
imshow(image_noise);
str = strcat('Noisy Image with PSNR = ', num2str(psnr(image_noise, image)));
title(str);

mean_filter = [
    1/9, 1/9, 1/9;
    1/9, 1/9, 1/9;
    1/9, 1/9, 1/9;
    ];
image_mean_3 = imfilter(image_noise, mean_filter);
subplot(2,6,[7,8]);
imshow(image_mean_3);
str = strcat('Mean Filtered (3x3) Image with PSNR = ', num2str(psnr(image_mean_3, image)));
title(str);

mean_filter = [
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    ];
image_mean_5 = imfilter(image_noise, mean_filter);
subplot(2,6,[9,10]);
imshow(image_mean_5);
str = strcat('Mean Filtered (5x5) Image with PSNR = ', num2str(psnr(image_mean_5, image)));
title(str);

mean_filter = [
    1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49;
    1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49;
    1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49;
    1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49;
    1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49;
    1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49;
    1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49;
    ];
image_mean_7 = imfilter(image_noise, mean_filter);
subplot(2,6,[11,12]);
imshow(image_mean_7);
str = strcat('Mean Filtered (7x7) Image with PSNR = ', num2str(psnr(image_mean_7, image)));
title(str);