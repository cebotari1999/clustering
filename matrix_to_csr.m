function [values, colind, rowptr] = matrix_to_csr(A)
n = 1;
m = 1;

  for i = 1:rows(A)
    rowptr(1, i) = n;
    
    for j = 1:columns(A)
     if A(i,j) != 0
       
       values(1, n) = A(i, j);
       colind(1, n) = j;
       n++; 
     endif
    endfor
  endfor
  
   rowptr(1, i + 1) = columns(values) + 1;
endfunction