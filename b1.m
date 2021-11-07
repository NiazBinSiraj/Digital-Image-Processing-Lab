%Take grayscale image of size 512x512 and decrease its intensity level resolution by
%one bit upto reach its binary format and observe its change when displaying in the same window
%size.

image = imread("images/image.jpg");
image1 = image;
grayscale = max(max(image));
bits = ceil(log2(double(grayscale)));

rc = ceil(sqrt(bits-1));
p_cnt = 1; %plot count

subplot(rc,rc,p_cnt);
p_cnt = p_cnt + 1;
imshow(image);
axis on;

for i = bits-1:-1:1
    prev = 2.^(i+1);
    cur = 2.^i;
    scale = 2.^8/2.^i;
    
    image = round((cur/prev)*image)*scale;
    
    subplot(rc,rc,p_cnt);
    p_cnt = p_cnt + 1;
    imshow(image);
    axis on;
end