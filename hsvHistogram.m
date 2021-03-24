function [sol] = hsvHistogram(path_to_image, count_bins)
  v = 0:1.01/count_bins:1.01;
  c = 1:count_bins;
  [H S V] = hsv(path_to_image);
  
  [S, bin] = histc(S, v);
  [s, x] = histc(bin(:), c);
  s = s';
  sol(1, (count_bins + 1):(2 * count_bins)) = s(1, 1:count_bins);
  
  [S, bin] = histc(H, v);
  [s, a] = histc(bin(:), c);
  s = s';
  sol(1, 1:count_bins) = s(1, 1:count_bins);
  
  [S, bin] = histc(V, v);
  [s, a] = histc(bin(:), c);
  s = s';
  sol(1, ((2 * count_bins) + 1):(3 * count_bins)) = s(1, 1:count_bins);

endfunction