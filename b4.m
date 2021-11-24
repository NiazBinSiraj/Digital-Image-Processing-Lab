clc;
close all;
clear all;

img = imread('images/image.jpg');
img = imresize(img, [512 512]);

D0 = 30; % initail D0
n = 8; % number of radious
plot_dim = ceil(sqrt(n));


subplot(plot_dim, plot_dim, 1);
imshow(img);
title('Original Image');    

for i = 1 : n
    
    [rows columns] = size(img);

    % 2d fft then shifting vlaues to middle
    fimg = fftshift(fft2(img));

    % creating 2d meshgrid((u,v) co-ordinate locations) middle point is zero
    % [rows columns] should be even

    [u v] = meshgrid(-(rows/2) : ((rows/2)-1), -(columns/2) : ((columns/2)-1));

    % calculating distence of each locations from co-ordinate zero
    D = sqrt(u.^2 + v.^2);

    % IDLF = greater than cuttoff frequency should be discarded
    idlf = D < D0;

    % multiplication the filter with fft image
    foutput_img = fimg .* idlf;
    tmp_img = ifft2(foutput_img);
    idlf_img = mat2gray(abs(tmp_img));
    
    subplot(plot_dim, plot_dim, i+1);
    imshow(idlf_img);
    title(strcat('IDLF img when D0 =  ' , int2str(D0)));
    
    D0 = D0 + 5;
end