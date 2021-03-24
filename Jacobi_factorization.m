function [G_J, c_J] = Jacobi_factorization(A, b)
  DIAG = diag(diag(A));
  G_J = inv(DIAG) * (DIAG - A);
  c_J = inv(DIAG) * b; 
endfunction
