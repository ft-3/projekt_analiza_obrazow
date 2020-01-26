function im = ao_imbinarize(im, T)

im(im <= T) = 0;
im(im > T) = 1;

end

