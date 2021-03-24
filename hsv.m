function [H S V] = hsv(path_to_image)
  picture = imread(path_to_image);
  picture = cast(picture, 'double');
  picture = picture/255;
  
  R = picture(:,:,1);
  G = picture(:,:,2);
  B = picture(:,:,3);
  a = size(R);
  
  for i = 1:a(1,1)
    for j = 1:a(1, 2)
      
      cmax = max(R(i, j), G(i, j));
      cmax = max(cmax, B(i, j));
      cmin = min(R(i, j), G(i, j));
      cmin = min(cmin, B(i, j));
      
      delta = cmax - cmin;
      
      if delta == 0
        H(i, j) = 0;
      elseif cmax == R(i, j)
        H(i, j) = 60 * mod(((G(i, j) - B(i, j))/delta), 6);
      elseif cmax == G(i, j)
        H(i, j) = 60 * (((B(i, j) - R(i, j))/delta) + 2);
      elseif cmax == B(i, j)
        H(i, j) = 60 * (((R(i, j) - G(i, j))/delta) + 4);
      endif
      
      H(i, j) = H(i, j)/360;
      
      if cmax == 0
        S(i, j) = 0;
      else
        S(i, j) = delta/cmax;
      endif
      
      V(i, j) = cmax;
    endfor
  endfor
endfunction
