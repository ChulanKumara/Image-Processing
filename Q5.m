clc;
clear;
close all;

% Q.5. Write a program to carry out histogram equalization for an RGB image.

% Answer

% Color histogram equalization can be achieved by converting a color image into HSV/HSI image
% Then histogram equalization is done on R,G,B components.
clc;
clear;
close all;

I = imread('flower.jpg');        % READ THE INPUT IMAGE
HSV = rgb2hsv(I);                % CONVERT THE RGB IMAGE INTO HSV IMAGE FORMAT
Heq = histeq(HSV(:,:,3));        % PERFORM HISTOGRAM EQUALIZATION ON INTENSITY COMPONENT
HSV_mod = HSV;
HSV_mod(:,:,3) = Heq;

RGB = hsv2rgb(HSV_mod);
figure
subplot(1,2,1)
imshow(I);
title('Before Histogram Equalization');

subplot(1,2,2)
imshow(RGB);
title('After Histogram Equalization');

% DISPLAY THE HISTOGRAM OF THE ORIGINAL AND THE EQUALIZED IMAGE

HIST_IN = zeros([256 3]);
HIST_OUT = zeros([256 3]);

% HISTOGRAM OF THE RED,GREEN AND BLUE COMPONENTS

HIST_IN(:,1) = imhist(I(:,:,1),256); % RED
HIST_IN(:,2) = imhist(I(:,:,2),256); % GREEN
HIST_IN(:,3) = imhist(I(:,:,3),256); % BLUE

HIST_OUT(:,1) = imhist(RGB(:,:,1),256); % RED
HIST_OUT(:,2) = imhist(RGB(:,:,2),256); % GREEN
HIST_OUT(:,3) = imhist(RGB(:,:,3),256); % BLUE

map=[1 0 0; 0.2 1 0; 0 0.2 1];

figure
subplot(1,2,1)
bar(HIST_IN);
colormap(map);
legend('RED CHANNEL','GREEN CHANNEL','BLUE CHANNEL');
title('Before Applying Histogram Equalization');

subplot(1,2,2)
bar(HIST_OUT);
colormap(map);
legend('RED CHANNEL','GREEN CHANNEL','BLUE CHANNEL');
title('After Applying Histogram Equalization');




% Histogram Equalization on a Grayscale image

% Answer

% A = imread('katy-perry-5672-1920x1200.jpg');
% B = rgb2gray(A);
% figure
% subplot(2,2,1)
% imshow(B)        % Displays grayscale version of original rgb image
% title('Grayscale Image')
% subplot(2,2,2) 
% imhist(B)        % Displays a histogram for the image A above a grayscale colorbar.
% title('Histogram using imhist command')
% B1 = histeq(B);  % Applying Histogram Equalization
% subplot(2,2,3)
% imshow(B1)
% title('After Histogram Equalization')
% subplot(2,2,4)
% imhist(B1)       % Displays an equalized histogram for image A 
% title('Equalized Histogram')