function im = ao_rgb2gray(im)
%AO_RGB2GRAY Summary of this function goes here
%   Detailed explanation goes here

w = [.299, .587, .114];
w = permute(w, [1,3,2]);

im = im.*w;
im = sum(im,3);

end