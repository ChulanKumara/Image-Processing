clc;
clear;
close all;

% Q.7. Write a program to carry out neighborhood operation: ‘max’ within a 3 x 3 neighborhood of
%      each pixel of an grayscale image. Describe the mechanism used to calculate the intensities of
%      the boundary pixels.

% Answer

A = imread('flower.jpg');
B = rgb2gray(A);
% f = inline('max(x(:))'); %#ok<DINLN>
f = @(x) max(x(:));
I2 = nlfilter(B,[3 3],f);
figure('Name','Before');
imshow(B);
figure('Name','After');
imshow(I2);

% Mechanism Used :- nfilter to set each pixel to the maximum value in its 3-by-3 neighborhood.