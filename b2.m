%Take grayscale image of size 512x512 and differentiate the results of
%power law transform and inverse logarithmic transform.


image = imread('images/image.jpg');

c = input('Enter the value for c\n');
gama = input('Enter the value for gama\n');
base = input('Enter the base of logarithm\n');

subplot(3,2,1);
imshow(image);
axis on;
title('Original Image');

subplot(3,2,2);
imhist(image);
title('Histogram (Original Image)');

image = im2double(image);

image_pl = c*(image.^gama);

subplot(3,2,3);
imshow(image_pl);
axis on;
title('Power Law Transform Image');

subplot(3,2,4);
imhist(image_pl);
title('Histogram (Power Law Transformed Image)');

image_il = (base.^(image/c))-1;

subplot(3,2,5);
imshow(image_il);
axis on;
title('Inverse Log Transform Image');

subplot(3,2,6);
imhist(image_il);
title('Histogram (Inverse Log Transformed Image)');