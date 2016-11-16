clc;
clear;
close all;

% Q.8. Write a program to locate the number of coins in the given image.

% Answer

img = imread('img.jpg');

% Threshold and binarize image and fill holes 
binImg = ~im2bw(img, graythresh(img));
binImg = imfill(binImg, 'holes');

% Distance transform and watershed segmentation
D = bwdist(~binImg);
D = -D;
D(~binImg) = -Inf;
L = watershed(D);

% Generate label image
rgb = label2rgb(L,'jet',[.5 .5 .5]);

% Show results of watershed 
figure('Name','Watershed transform of image');
imshow(rgb,'InitialMagnification','fit')
title('Watershed transform of img.jpg')

% Count number of label regions.  Note - this is incorrect!  This will
% count borders and background, which we don't want
labelImageBWCC = bwconncomp(rgb,4);

% Generate new binary image that only looks at individual regions generated
% by watershed segmentation so we are counting watershed regions, not label
% colors
binWatershed = L > 1;    % 1 is background region; any region with index > 1 is coin
minCoinSize = 50;        % minimum size in pixels
regs = regionprops(binWatershed, 'Area', 'Centroid', 'PixelIdxList');

% Remove all regions with size below threshold
regs(vertcat(regs.Area) < minCoinSize) = [];


% Display image with coin count labeled
figure('Name','Located coins and their count');
imshow(img)
hold on
for k = 1:numel(regs)

    text(regs(k).Centroid(1), regs(k).Centroid(2), num2str(k), ...
        'Color', 'r', 'HorizontalAlignment', 'center')

end
hold off