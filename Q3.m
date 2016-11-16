% Q.3. Write a program to apply the following piece?wise linear transformations to a grayscale
%       image. Let r1=90, s1=30 and r2=160, s2=224

% Answer

clc;
clear;
close all;

img = imread('Bird.png');
figure('Name','Piece Wise Linear Transformation');
imshow(img)
title('Original');

u = double(img);
[nx, ny] = size(u);
nshades = 256;

r1 = 90; s1 = 30;
r2 = 160; s2 = 224;

for i = 1:nx
 for j = 1:ny
     
%The straight line formula is used to compute the equation by diving the plot into 3 segments 

 if (u(i,j)< r1)                         %Segment 1(between 0 & (s1,r1))
 uspread(i,j) = ((s1-0)/(r1-0))*u(i,j);  %#ok<*SAGROW>
 end
 
 if ((u(i,j)>=r1) && (u(i,j)<= r2))      %Segment 2(between (s1,r1)&(s2,r2))
 uspread(i,j) = ((s2 - s1)/(r2 - r1))*(u(i,j) - r1)+ s1;
 end
 
 if (u(i,j)>r2)                          %Segment 3(between(s2,r2)& 255)
 uspread(i,j) = ((255 - s2)/(255 - r2))*(u(i,j) - r2)+ s2;
 end
 
 end
end

imgtomat = uint8(uspread);
imwrite(imgtomat,'Bird1.png');
figure('Name', 'After piecewise linear transformation');
imshow('Bird1.png'),title('After piecewise linear transformation');

