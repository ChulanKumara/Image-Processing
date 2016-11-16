clc;
clear;
close all;

% Q.1. Write a program to open an RGB image and produce its red, green, blue and grayscale versions.

%  Answer

figure('Name','Red, Green, Blue Channels Seperately')
A = imread('onion.png');
A1 = A;
A2 = A;
A3 = A;
A4 = A;

% Grayscale Image
A1 = rgb2gray(A1);
subplot(2,2,1);
imshow(A1)
title('Grayscale Version')

% Red Channel
subplot(2,2,2);
A2(:,:,2) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's      
A2(:,:,3) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's
imshow(A2)
title('Red Version')

% Blue Channel
subplot(2,2,3);
A3(:,:,1) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's      
A3(:,:,3) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's
imshow(A3)
title('Green Version')

% Green Channel
subplot(2,2,4);
A4(:,:,1) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's      
A4(:,:,2) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's
imshow(A4)
title('Blue Version')




% Another way of displaying Red, Green, Blue channels of an RGB image

% Answer

% figure('Name','Red, Green, Blue Channels Seperately')
% A = imread('Myna-Birds-Animals-HD-Image.jpg');
% R = A;
% R(:,:,2:3) = 0;             % Omit Green, Blue channels & get all rows and columns of Red channel 
% image(R);
% title('Red Version')
% pause(5);                   % Freeze image A for 5 seconds
% G = A;
% G(:,:,[1 3]) = 0;           % Omit Red, Blue channels & get all rows and columns of Green channel
% image(G);
% title('Green Version')
% pause(5);                   % Freeze image A for 5 seconds
% B = A;
% B(:,:,1:2) = 0;             % Omit Red, Green channels & get all rows and columns of Blue channel
% image(B);
% title('Blue Version')
% pause(5);                   % Freeze image A for 5 seconds