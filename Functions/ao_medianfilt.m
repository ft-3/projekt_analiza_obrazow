% Funkcja aplikująca filtr medianowy
function [outimg] = medianfilt(img,amount)
    % Rozmiar obrazu
    [rows,cols] = size(img);
    % Ilosc paddingu do dodania
    pad = amount-1; 
    % Pusta miacierz z paddingie do ktorej wrzucimy nasz obraz
    nimg = zeros(rows+pad,cols+pad); 
    nimg((pad/2+1):(rows+pad/2), (pad/2+1):(cols+pad/2)) = img;
    
    % Obraz ktory zwracamy po aplikacji filtra medianowego
    outimg = zeros(rows,cols);
    % Iterujemy po wierszach i kolumnach
    for y = pad/2 + 1 : rows + pad/2
        for x = pad/2 + 1 : cols + pad/2
            % Bierzmy ramke o wymiarze amount
            frame = nimg(y-pad/2:y+pad/2, x-pad/2:x+pad/2);
            % W srodkowy piksel wpisujemy wartosc mediany
            outimg(y-pad/2,x-pad/2) = median(frame(:));
        end
    end
end