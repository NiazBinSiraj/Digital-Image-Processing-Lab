clc;
close all;
clear all;

img = imread('images/image.jpg');
%img = rgb2gray(img);
img = imresize(img, [512 512]);

D0 = 10;
%Gaussian HPF
[rows columns] = size(img);

    % 2d fft then shifting vlaues to middle
    fimg = fftshift(fft2(img));

    % creating 2d meshgrid((u,v) co-ordinate locations) middle point is zero
    % [rows columns] should be even

    [u v] = meshgrid(-(rows/2) : ((rows/2)-1), -(columns/2) : ((columns/2)-1));

    % calculating distence of each locations from co-ordinate zero
    D = sqrt(u.^2 + v.^2);

    % ghf = gaussian highpass filter
    ghf = 1 - exp(-((D.*D)./(2.*D0.^2)));

    % multiplicate the filter with fft image
    foutput_img = fimg .* ghf;
    tmp_img = ifft2(foutput_img);
    gaussian_hf_img = mat2gray(abs(tmp_img)); 

    
%Ideal HPF
 [rows columns] = size(img);

    % 2d fft then shifting vlaues to middle
    fimg = fftshift(fft2(img));

    % creating 2d meshgrid((u,v) co-ordinate locations) middle point is zero
    % [rows columns] should be even

    [u v] = meshgrid(-(rows/2) : ((rows/2)-1), -(columns/2) : ((columns/2)-1));

    % calculating distence of each locations from co-ordinate zero
    D = sqrt(u.^2 + v.^2);

    % IDLF = greater than cuttoff frequency should be remain
    idhf = D > D0;

    % multiplication the filter with fft image
    foutput_img = fimg .* idhf;
    tmp_img = ifft2(foutput_img);
    ideal_hf_img = mat2gray(abs(tmp_img));


subplot(1,2,1);
imshow(gaussian_hf_img);
title('Gaussian High Pass Image');

subplot(1,2,2);
imshow(ideal_hf_img);
title('Ideal High Pass Image');