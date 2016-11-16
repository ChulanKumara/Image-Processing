clc;
clear;
close all;

% Q.4. Write a program to apply the following transformation function to a grayscale image.
%      Identify suitable values for A, B and C. Assume the diagram is drawn according to scale.

% Answer

I = imread('keychain.jpg');
J = rgb2gray(I);
K = J;

L = 256;
A = L/10 * 3;
B = L/10 * 5;
C = L/10 * 8;

[rows, cols] = size(J);

for x = 1:rows
    for y = 1:cols
        if( K(x, y) >= A && K(x, y) < B )
            K(x, y) = C;
        end
    end
end

figure('Name','Transformation function on grayscale image');

subplot(1, 2, 1)
imshow(J);
title('Original');

subplot(1, 2, 2)
imshow(K);
title('Transformed');