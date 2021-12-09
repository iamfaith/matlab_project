function [compare] = A6(n)
% or
%     E = ones(n,n);
%     I = eye(n);
%     U = triu(E);
%     A = 2 * I - U

    A = eye(n) - triu(ones(n), 1)
    B = A^-1

    k = norm(A, 1) * norm(B, 1)
    k1 = n*2^(n-1)
    compare = (k1 == k)
    
end

