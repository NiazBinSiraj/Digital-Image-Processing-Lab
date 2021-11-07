%Take grayscale image of size 512x512 and illustrate the histogram of the
%image and make single threshold segmentation observed from the histogram.

image = imread("images/image.jpg");

subplot(2,2,1);
imshow(image);
axis on;
title('Original Image');

subplot(2,2,2);
imhist(image);
axis on;
title('Histogram (Original Image)');

T = input('Enter Threshold Value\n');

image = image>T;

subplot(2,2,3);
imshow(image);
axis on;
title('Thresholded Image');

subplot(2,2,4);
imhist(image);
axis on;
title('Histogram (Thresholded Image)');