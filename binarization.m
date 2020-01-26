%trzeba napisac funkcje:
% otsuthresh
% filtr medianowy lub ze sredniej do adaptacyjnego

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

T2 = otsuthresh(imhist(im2g));
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

% im3m = imfilter(im3g, fspecial('average', ws), 'replicate');
%mozna uzyc filtru medianowego zamiast srednej, zobaczymy ktory bedzie
%latwiej napisac:
%im3m = medfilt2(im3g, [ws, ws]);

% Dopisany filt medianowy
im3m = ao_medianfilt(im3g, ws);

im3s = im3m - im3g - C;
im3b = ao_imbinarize(im3s, 0);

subplot(h, w, i); i = i + 1;
imshow(im3b);

%=================================





%=================================
%binaryzacja uzywajac poszczegolnych kanalow
%chyba nie ma po co tego implementowac

% b = ~imbinarize(im4(:,:,3),.6);
% r = im4(:,:,1);
% r(r < .15) = 1;
% r = imbinarize(r, .3);
% im4b = r|b;
% im4b = imclose(im4b, ones(5));
% im4b = imopen(im4b, ones(5));
% 
% subplot(h, w, i); i = i + 1;
% imshow(im4b);