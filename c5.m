%Take a binary image and a structuring element to perform boundary
%extraction using morphological operation.

image = imread('images/man.png');
image = rgb2gray(image);

dim = 11;
s_element = ones(dim, dim); % structuring element

eroted_img = imerode(image, s_element);
boundary_img = image - eroted_img;

subplot(1,2,1);
imshow(image);
title('Original image');

subplot(1,2,2);
imshow(boundary_img);
title('After Boundary extraction');

