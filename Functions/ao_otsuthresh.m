function t = ao_otsuthresh(counts)
%AO_OTSUTHRESH Wyznaczanie progu z histogramu metodą Otsu

% Ile jest elementow w counts
num_bins = numel(counts);

% Zamiana counts na wektor o 2 kolumnach
counts = double( counts(:) );

% Wyznaczanie sigmy do kwadratu
p = counts / sum(counts);
omega = cumsum(p);
mu = cumsum(p .* (1:num_bins)');
mu_t = mu(end);

sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));

% Znajdowanie miejsca maximum, jeżeli nie istnieje to zwraca 0
maxval = max(sigma_b_squared);
isfinite_maxval = isfinite(maxval);
if isfinite_maxval
    % Jezeli maxval rozciaga sie na kilka binow to bierze srednia z nich
    idx = mean(find(sigma_b_squared == maxval));
    % Normalizacja do zakresu [0,1]
    t = (idx - 1) / (num_bins - 1);
else
    t = 0.0;
end

end

