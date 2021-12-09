function res = lu_factorization(A, b)
%LU_FACTORIZATION Summary of this function goes here
%   Detailed explanation goes here
    [row, col] = size(A);
    if row ~= col
        error('A is not a square matrix');
    end
%     disp(A);
    for k = 1: row - 1
       if A(k, k) == 0, error('Null diagonal element');
       end
       for i = k + 1: row
           m = A(i, k)/A(k, k);
           A(i, k) = m;
           % vectorization  
           j = k + 1;
           A(i, j:col) = A(i, j:col) - m * A(k, j:col);
%             for j = k + 1: col
%                A(i, j) = A(i, j) - m * A(k, j); 
%             end
%            disp(A);
       end
    end
%     disp(A);
    L = eye(row) + tril(A, -1);
    U = triu(A);
%     res = [L,U];
    % Lz = b;
    % Ux = z;
    
    z = zeros(row, 1);    
    z(1) = b(1) / L(1,1);
    for i = 2:row
        %%%%%%%%%%%%%%%%% vectorization %%%%%%%%%%%%%%%%% 
%         s = sum(L(i, 1:i-1) * z(1:i-1));
        z(i) = (b(i) - sum(L(i, 1:i-1) * z(1:i-1)))/ L(i, i);
        %%%%%%%%%%%%%%%%% vectorization %%%%%%%%%%%%%%%%% 
%         s = 0;
%         for j = 1: i - 1
%            s = s + L(i, j) * z(j);
%         end
%         z(i) = (b(i) - s)/ L(i, i);
    end
    x = zeros(row, 1);
    x(row) = z(row)/U(row, col);
    for i = row-1:-1:1
        %%%%%%%%%%%%%%%%% vectorization %%%%%%%%%%%%%%%%% 
%         s = U(i, i + 1:col) * x(i + 1:col);
        x(i) = (z(i) - U(i, i + 1:col) * x(i + 1:col))/U(i, i);
        %%%%%%%%%%%%%%%%% vectorization %%%%%%%%%%%%%%%%% 
%         s = 0;
%         for j = i + 1: col
%            s = s + U(i, j) * x(j); 
%         end
%         x(i) = (z(i) - s)/U(i, i);
    end
    res = [z x];
    
end

