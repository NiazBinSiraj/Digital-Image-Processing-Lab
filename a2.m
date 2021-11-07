%Take grayscale image of size 512x512 and perform the brightness
%enhancement of a specific range of gray levels and observe its result.

image = imread('images/image.jpg');
oldimage = image;

brightness = input('Enter the ammount of brightness to be enhanced\n');
minRange = input('Enter minimum range of greylevel\n');
maxRange = input('Enter maximum range of greylevel\n');

for i=1:size(image,1)
    for j=1:size(image,2)
        if(image(i,j) >= minRange && image(i,j) <= maxRange)
            if(image(i,j)+brightness > 255)
                image(i,j) = 255;
            elseif(image(i,j)+brightness < 0)
                image(i,j) = 0;
            else
                image(i,j) = image(i,j) + brightness;
            end
        end
    end
end

subplot(1,2,1);
imshow(oldimage);
axis on;

subplot(1,2,2);
imshow(image);
axis on;