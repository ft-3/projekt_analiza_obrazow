function im = ao_imbinarize(im, T)
%AO_IMBINARIZE Summary of this function goes here
%   Detailed explanation goes here

im(im <= T) = 0;
im(im > T) = 1;

end

