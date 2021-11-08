%Take a binary image and a structuring element to perform Erosion and
%Dilation.

image = imread('images/objects.jpg');

dim = 11;
s_element = ones(dim, dim); % structuring element

eroted_img = imerode(image, s_element);
dilated_img = imdilate(image, s_element);

subplot(2,2,1);
imshow(image);
title('Original Image');

subplot(2,2,2);
imshow(eroted_img);
title('After Erosion');


subplot(2,2,3);
imshow(dilated_img);
title('After Dilation');