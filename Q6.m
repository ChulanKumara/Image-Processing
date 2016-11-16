clc;
clear;
close all;

% Q.6. Write a program to filter an image with an averaging filter of any size.

% Answer

A = imread('Myna-Birds-Animals-HD-Image.jpg');
B = rgb2gray(A);
figure('Name','Filter an image with an averaging filter');
subplot(2,1,1)
imshow(B)
title('Grayscale Image')
B = double(B);
n=8;                  % Change n to vary the filter size
h=(1/(n*n))*ones(n);  % ones(n) creates an n x n matrix.
Bout = imfilter(B,h);   
Bout = mat2gray(Bout); 
subplot(2,1,2)
imshow(Bout)
title(['Image filtered with ' num2str(n) ' x ' ,num2str(n) ' Averaging filter'])