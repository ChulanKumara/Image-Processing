clc;
clear;
close all;

% Q.1. Write a program to open an RGB image and produce its red, green, blue and grayscale versions.

%  Answer

A = imread('onion.png');
A1 = A;
A2 = A;
A3 = A;
A4 = A;

% Grayscale Image
A1 = rgb2gray(A1);
subplot(2,2,1);
imshow(A1);
title('Grayscale Version')

% Red Channel
subplot(2,2,2);
A2(:,:,2) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's      
A2(:,:,3) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's
imshow(A2);
title('Red Version')

% Blue Channel
subplot(2,2,3);
A3(:,:,1) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's      
A3(:,:,3) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's
imshow(A3);
title('Blue Version')

% Green Channel
subplot(2,2,4);
A4(:,:,1) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's      
A4(:,:,2) = uint8(0);       % uint8 converts rgb values which are 0-255 to 0's and 1's
imshow(A4);
title('Green Version')




% Q.2. Write a program to carry out gamma correction.

% Answer

RGB = imread('forest.jpg');     % Read a RGB image
% figure('Name','RGB Image')    % Uncomment this part to display original RGB
% imagesc(RGB)                    image
% axis image
% zoom(4)

[IND,map] = rgb2ind(RGB,32); % RGB image converted to an Indexed image
figure('Name','Indexed image with 32 Colors')
imagesc(IND)
colormap(map)
axis image
zoom(4)

I = ind2gray(IND,map);      % Indexed image converted to grayscale image
J = imadjust(I,[],[],0.5);  % Gamma correction is applied without change to other data
imshowpair(I,J,'Montage')   % Display the original image with the contrast-adjusted image




% Q.3. Write a program to apply the following piece?wise linear transformations to a grayscale
%       image. Let r1=90, s1=30 and r2=160, s2=224

% Answer

