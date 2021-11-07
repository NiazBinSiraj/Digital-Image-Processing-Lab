image = imread('images/image.jpg');
mask = 224; %11100000
image_msb = bitand(image,mask);
image_diff = imabsdiff(image, image_msb);

subplot(3,2,1);
imshow(image);
axis on;
title('Original Image');

subplot(3,2,2);
imhist(image);
title('Histogram (Original Image)');

subplot(3,2,3);
imshow(image_msb);
axis on;
title('Three MSB Image');

subplot(3,2,4);
imhist(image_msb);
title('Histogram (Three MSB Image)');

subplot(3,2,5);
imshow(image_diff);
axis on;
title('Difference Image');

subplot(3,2,6);
imhist(image_diff);
title('Histogram (Difference Image)');