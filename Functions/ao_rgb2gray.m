function im = ao_rgb2gray(im)

w = [.299, .587, .114];
w = permute(w, [1,3,2]);

im = im.*w;
im = sum(im,3);

end