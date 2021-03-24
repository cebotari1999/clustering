function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  y = zeros(length(c), 1);
  
  while 1
   x = csr_multiplication(G_values, G_colind, G_rowptr, y) + c;

   if norm(x - y) < tol
    return
   endif
   y = x;
  endwhile
endfunction