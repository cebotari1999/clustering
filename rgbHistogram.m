function [sol] = rgbHistogram(path_to_image, count_bins)
  picture = imread(path_to_image);
  v = 0:256/count_bins:256;
  c = 1:count_bins;
  % Cand a e 1, matricea A este matricea R, pentru a = 2, A = G
  % si pentru a = 3, A = B
  k = 0;
  for a = 1:3
    A = picture(:,:,a);
    [S, bin] = histc(A, v);
    [s, a] = histc(bin(:), c);
    sol(1, k + 1:k + count_bins) = s;
    k = k + count_bins;
  end
end