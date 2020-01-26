clear; clc;

im1 = imread("TestPictures/kaczki.jpg");
im1 = double(im1)/255;
im1g = ao_rgb2gray(im1);

im2g = im1g;
im3g = im2g;
im4g = im3g;

h = 4;
w = 1;
i = 1;

subplot(h,w,i); i = i + 1;
imshow(im1);

%=================================
%binaryzacja reczna

T1 = .55;
im1_inverse = true;

if(im1_inverse)
    im1b = ~ao_imbinarize(im1g, T1);
else
    im1b = ao_imbinarize(im1g, T1);
end

subplot(h,w,i); i = i + 1;
imshow(im1b);


%=================================
%binaryzacja z automatycznym dobieraniem progu metoda Otsu

T2 = ao_otsuthresh(imhist(im2g));
im2_inverse = true;

if(im2_inverse)
    im2b = ~ao_imbinarize(im2g, T2);
else
    im2b = ao_imbinarize(im2g, T2);
end

subplot(h,w,i); i = i + 1;
imshow(im2b);

%=================================
%binaryzacja adaptatywna

ws = 30;
C = 0.05;

im3m = ao_medianfilt(im3g, ws);

im3s = im3m - im3g - C;
im3b = ao_imbinarize(im3s, 0);

subplot(h, w, i); i = i + 1;
imshow(im3b);

%=================================
