function [cost] = compute_cost_pc(points, centroids)
  x = size(points);
  n = x(1, 1);
  m = x(1, 2);
  y = size(centroids);
  q = y(1, 1);
  
  clusters = zeros(q, n); % Se initializeaza clusterele cu 0
  
  % Punctele se distribuie in clustere 
  for i = 1:n
    b = 1000;
    for j = 1:q 
      a = norm(centroids(j, 1:m) - points(i, 1:m));
      
      if a < b
        b = a;
        w = j;
      endif
    endfor
    j = 1;
    
    while clusters(w, j) != 0
      j++;
    endwhile
    
    clusters(w, j) = i;
  endfor
  
  cost  = 0;
  % Se calculeaza costul, care este suma tuturor distantelor de la puncte
  % la centroizii care le corespund
  for i = 1:q
    k = 1;
    
    while clusters(i, k) != 0
      a = norm(points(clusters(i, k), 1:m) - centroids(i, 1:m));
      cost  = cost + a;
      k++;
    endwhile
 
endfor

endfunction