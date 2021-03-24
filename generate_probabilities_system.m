
function [A, b] = generate_probabilities_system(rows)
  % In acest for se calculeaza numarul de linii (number) a matricii A
  % si a vectorului b
  number = rows;
  for i = 1 : rows - 1
    number = i + number;
  endfor
  % Se initializeaza matricea A si vectorul b
  A = zeros(number, number);
  b = zeros(number, 1);

  % In matricea A elemntul de pe diagonala principala este egal numarul de
  % pozitii in care se poate ajune din prima pozitie din labirint
  % si elementele de pe  coloanele matricii, care au indexul egal cu pozitiile 
  % in care se poate ajunge din prima pozitie, sunt egale cu -1
  % care se poate ajunge se scrie -1
  
  i = 1;
  A(i, i) = 4;
  A(i, i + 1) = -1;
  A(i, i + 2) = -1;
 
  % Se repeta aceiasi procedura de mai sus pentru celelelate pozitii
  % a matricei A, care se afla pe extrema stanga a labirintului. 
  % Pentru a stabili pozitiile
  % pentru care se vor face calculele, se foloseste k
  i = 2;
  k = 1;
  
  while i < number-rows
    
    A(i, i) = 5;
    A(i, i + 1) = -1;
    A(i, i - k) = -1;
    A(i, i + k + 1) = -1;
    A(i, i + k + 2) = -1;
    k++;
    i = i + k;
   endwhile
  
  % Se repeta procedura de mai sus pentru pozitile de pe extrema deapta
  % a labirintului 
  i = 3;
  k = 2;

  while i <= number-rows
    
    A(i, i) = 5;
    A(i, i - 1) = -1;
    A(i, i - k) = -1;
    A(i, i + k) = -1;
    A(i, i + k + 1) = -1;
    k = k + 1;
    i = i + k;
  endwhile
 
  % Se repeta procedura de mai sus pentru pozitile din mijlocul labirintului
  i = 5;
  k = 2;
  
  while i < number-rows
    w = k - 1;
    
    while w > 0
      
      A(i,i) = 6;
      A(i, i - k) = -1;
      A(i, i - k - 1) = -1;
      A(i, i - 1) = -1;
      A(i, i + 1) = -1;
      A(i, i + k + 1) = -1;
      A(i, i + k + 2) = -1;
      w = w - 1;
      i = i + 1;
  endwhile
  
    i = i + 2;
    k =  k + 1;
  endwhile

  % Aceste intructiuni determina in ce pozitii se poate ajunge
  % de pe ultimele pozitii a labirintului si tot aici se formeaza vectorul b
  
  i = number - rows + 1;
  A(i, i) = 4;
  A(i, i - k) = -1;
  A(i, i + 1) = -1;
  b(i) = 1;
  i++;
  
  while i < number
    
    A(i, i) = 5;
    A(i, i - 1) = -1;
    A(i, i + 1) = -1;
    A(i, i - k) = -1;
    A(i, i - k - 1) = -1;
    b(i) = 1;
    i++;
  endwhile
  
  i = number;
  A(i, i) = 4;
  A(i, i - 1) = -1;
  A(i, i - k - 1) = -1;
  b(i) = 1;
  
endfunction
