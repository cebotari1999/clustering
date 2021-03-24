function [centroids] = clustering_pc(points, NC)
  x = size(points);
  n = x(1, 1);
  m = x(1, 2);
  clusters = zeros(NC, n/2);
  j = 1;
  
  % Se formeaza primele NC clustere
  for i = 1:NC
    clusters(i, 1:n/NC) = i:NC:n;
  endfor
  
 % Se calculeaza centroizii pentru clustere 
  for i = 1:NC
    j = 1;
    A = 0;
    
    while clusters(i, j) != 0 
      z = clusters(i, j);
      A(j, 1:m) = points(z, 1:m);
      j++; 
    endwhile
    
    centroids(i, 1:m) = mean(A);
  endfor
  
  centroids_prev = centroids;
  
  % In aceasta bucla se reformeaza clusterele si se recalculeaza 
  % centroizii, pana acestea nu se stabilizeaza
  while 1
  clusters = zeros(NC, n); % Se initializeaza clusterele noi cu 0
  b = 100;
  centroids = 0; % Se initializeaza centroizii noi cu 0
  
  for j = 1:n
    for i = 1:NC
      % Se calculeaza distanta de la un punct la toti centroizii
      a = norm(centroids_prev(i, 1:m) - points(j,1:m));
      
      % Se determina care este cea mai mica distanta dintre punct
      % si centroizi si se determina in ce cluster trebuie mutat punctul
      if a < b
        b = a;
        w = i;
      endif
      
    endfor
    b = 100;
    k = 1;
    
    % Punctul este mutat in clusterul, corespunzator
    while clusters(w, k) != 0
      k++;
    endwhile
    clusters(w, k) = j;
    
  endfor
  
  % Se recalculeaza centroizii pentru noile clustere
  for i = 1:NC
    j = 1;
    A = 0;
    
    while clusters(i, j) != 0 
      A(j, 1:m) = points(clusters(i,j),1:m);
      j++; 
    endwhile
    
    [q w] = size(A);
    if q != 1
      centroids(i, 1:m) = mean(A);
    else
      centroids(i, 1:m) = A(1, 1:m);
    endif
  endfor
    % Se verifica daca centroizii ancedenti nu sunt la fel cu cei calculati 
    % acum
    if norm(centroids - centroids_prev) == 0
      break
    endif
    
    centroids_prev = centroids;
  endwhile

endfunction