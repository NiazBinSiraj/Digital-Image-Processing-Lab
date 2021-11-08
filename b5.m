%Take a binary image and a structuring element to perform Opening and
%Closing.

image = imread('images/fingerprint.jpg');

dim = 11;
s_element = ones(dim, dim); % structuring element

opened_img = imopen(image, s_element);
closed_img = imclose(image, s_element);

subplot(2,2,1);
imshow(image);
title('Original Image');

subplot(2,2,2);
imshow(opened_img);
title('After Opening');


subplot(2,2,3);
imshow(closed_img);
title('After Closing');