clc;
clear;
close all;

% Q.2. Write a program to carry out gamma correction.

% Answer

RGB = imread('forest.jpg');     % Read a RGB image
% figure('Name','RGB Image')    % Uncomment this part to display original RGB
% imagesc(RGB)                    image
% axis image
% zoom(4)

[IND,map] = rgb2ind(RGB,32);    % RGB image converted to an Indexed image
figure('Name','Gamma Correction Process')
A = ind2gray(IND,map);      % Indexed image converted to grayscale image
B = imadjust(A,[],[],0.5);  % Gamma correction is applied without change to other data
subplot(1,2,1)
imagesc(A)
montage(A)
title('Before Gamma Correction')
subplot(1,2,2)
imagesc(B)
montage(B)
title('After Gamma Correction')