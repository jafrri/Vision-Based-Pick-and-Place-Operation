% import realsense.*
close all
clear all
[img,depth]=good_depth_example();
depth=depth*100;

% Red Mask preparation and processing
[BW_red, mask_red]=createredMask(img);   
se_red=strel('rectangle',[4 5]);
img_erode_red=imerode(BW_red,se_red);
dilate_se_red = strel('rectangle',[5 5]);
ime_dilate_red=imdilate(img_erode_red,dilate_se_red);


% Blue Mask preparation and processing
[BW_blue, mask_blue] = createblueMask(img);
se_blue=strel('square',2);
img_erode_blue=imerode(BW_blue,se_blue);
dilate_se_blue = strel('square',5);
ime_dilate_blue=imdilate(img_erode_blue,dilate_se_blue);

overlay_blue = imoverlay(ime_dilate_blue,BW_blue);
overlay_red = imoverlay(ime_dilate_red, BW_red);

pixelred=depth(ime_dilate_red);
pixelblue=depth(ime_dilate_blue);

% Depth Thresholding
depth_binary= depth>63 & depth<66;
figure;
imshow(img)
figure;
imshow(depth_binary)
figure;
se_depth = strel('square',4)
depth_binary = imerode(depth_binary, se_depth);
depth_binary = imdilate(depth_binary, se_depth);


overlay = imoverlay(ime_dilate_blue, depth_binary);
imshow(overlay)
finalBW=depth_binary.*ime_dilate_blue;
finalBW2 = depth_binary.*ime_dilate_red;

% Number of Objects of Blue Color
CC_blue=bwconncomp(finalBW);
numObjectsBlue=CC_blue.NumObjects;
% Number of Objects of Red Color
CC_red=bwconncomp(finalBW2);
numObjectsRed=CC_red.NumObjects;
figure;
imshow(finalBW)
% Image overlay for Blue Blocks 
figure;
overlay1 = imoverlay(img,finalBW);
imshow(overlay1)
% Image overlay for Red Blocks 
figure;
overlay2 = imoverlay(img,finalBW2);
imshow(overlay2)
% Result Checking without the use of bwcovnhull for polygon fitting 
% which improves the segmented shape result making it 
% smoother
figure;
points2=regionprops(finalBW,'Extrema');
imshow(finalBW); hold on
x=points2(1).Extrema(:,1);
y=points2(1).Extrema(:,2);
[X,Y]=point_remover(points2);
plot(X,Y,'x','MarkerSize',10,'LineWidth',2);

% polygon fitting to improve the smoothness of the 
% segmented blocks.
figure;
CH=bwconvhull(finalBW,"objects",4);
CH1=bwconvhull(finalBW2,"objects",4);
overlay2 = imoverlay(img,CH);
imshow(overlay2)
title("Ultimate Check")
figure;
points2=regionprops(CH,'Extrema');
% imshowpair(CH,ime_dilate_blue,'montage');
imshow(CH); hold on

x=points2(1).Extrema(:,1);
y=points2(1).Extrema(:,2);
[X,Y]=point_remover(points2);
plot(X,Y,'x','MarkerSize',10,'LineWidth',2);
hold off

X_mat_blue=reshape(X,[4 numObjectsBlue]);
Y_mat_blue=reshape(Y,[4 numObjectsBlue]);

% taking the transpose

X_mat_blue = X_mat_blue';
Y_mat_blue = Y_mat_blue';
% Frame plotting on the objects
frames=frame_assignment(X_mat_blue,Y_mat_blue);
frame_plotter(CH,frames);