function res = gauss_jordan(A, b)
%GAUSS_JORDAN Summary of this function goes here
%   Detailed explanation goes here
    [row, col] = size(A);
    if row ~= col
        error('A is not a square matrix');
    end
    I = eye(row);
    AA = [A I];
    for k = 1: row - 1
       if A(k, k) == 0, error('Null diagonal element');
       end
       for i = k + 1: row
           m = AA(i, k)/AA(k, k);
           for j = k: 2 * col
              AA(i, j) = AA(i, j) - m * AA(k, j);
           end
       end
    end
    
    for k=row:-1:2
       if A(k, k) == 0, error('Null diagonal element');
       end
       for i = k - 1:-1:1
          m = AA(i, k)/AA(k, k);
          for j = 2 * col: -1: k
              AA(i, j) = AA(i, j) - m * AA(k, j);
              AA(k,j) = AA(k,j) / AA(k,k); %%In the mean time, multiply 1/AA(k,k) on k's row
          end
       end
    end
    
    for j = 2 * col: -1: 1
       AA(1, j) = AA(1, j)/AA(1, 1); 
    end
    % At the point, AA should in the form [I|B]
    B = AA(:, col + 1:2 * col);
    x = B * b;
    res = [x B];
end

