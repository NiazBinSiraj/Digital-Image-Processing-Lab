%Take grayscale image of size 512x512 and decrease its spatial resolution by
%half every time and observe its change when displaying in the same window
%size.

times = input("How many times you want to decrease spatial resolution by half?\n");
rc = ceil(sqrt(times+1)); %calculating row column for subplot
sz = 512; %initial resolution

image = imread("images/image.jpg"); %reading the image
subplot(rc,rc,1); %allocate 1 no cell for displaying image
imshow(image); %displaying image
axis on;
title(sz+"x"+sz); %setting title for image

for i=1:1:times
   image = imresize(image,0.5); %decreasing spatial resolution by half
   subplot(rc,rc,i+1); %allocate (i+1) no cell for displaying image
   imshow(image); %displaying image
   axis on;
   sz = sz/2; %resolution after decreasing by half
   title(sz+"x"+sz); %setting title for image
end