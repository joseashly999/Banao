% Loading the images
img1=imread("img5.png");
img2=imread("img6.png");

% Converting images into double for calculations
img1=im2double(img1);
img2=im2double(img2);

% Subracting the images
imgdiff= abs(img1-img2);
%imshow(imgdiff)

% Converting the difference into grayscale image
imgdiff_gray=im2gray(imgdiff);
%imshow(imgdiff_gray)

% A segmentation function is created after applying the segmentation
% and mlrphological operations.

BW=segmentImage(imgdiff_gray);
%imshow(BW)

% Placing a bounding box around the segmented regions
props=regionprops("table",BW,"BoundingBox");
img1_boxed=insertShape(img1,"rectangle",props.BoundingBox,"LineWidth",5,"Color","red");
img2_boxed=insertShape(img2,"rectangle",props.BoundingBox,"LineWidth",5,"Color","red");
montage({img1_boxed,img2_boxed})

% Calculating the similarity score between the two images.
% MATLAB's ssim function is used here.
[ssim_score,ssimmap] = ssim(img1,img2);
disp(['Similarity score between the two images: ', num2str(ssim_score)]);
%imshow(ssimmap)