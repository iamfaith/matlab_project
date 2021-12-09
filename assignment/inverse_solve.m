function [x,B] = inverse_solve(A,b)
% This function computes the inverse of A
% Assumes A is not singular
[n,m] = size(A);%n=#rows, m=#columns
if n~=m; error('A is not a square matrix');
end
I = eye(n);
AA = [A I];
endIndx = 2*n;
for k=1:n-1 %% for each row (execpt last)
    if A(k,k) == 0, error("Null diagonal element");
    end
    for i = k+1:n %% for row i below row k
        m = AA(i,k)/AA(k,k); %% m = scalar for row i
        
        %vectorization
        AA(i,k:endIndx) = AA(i,k:endIndx)-m*AA(k,k:endIndx);
%         for j = k:2*n %% subtract m*row k from row i -> row i
%             AA(i,j) = AA(i,j)-m*AA(k,j);
%         end
    end
end %% At this point, AA should be in upper triangular form
for k=n:-1:2 %% for each row (execpt last)
    if A(k,k) == 0, error("Null diagonal element");
    end
    for i = k-1:-1:1 %% for row i below row k
        m = AA(i,k)/AA(k,k); %% m = scalar for row i
        for j = 2*n:-1:k %% subtract m*row k from row i -> row i
            AA(i,j) = AA(i,j)-m*AA(k,j);
            AA(k,j) = AA(k,j)/AA(k,k); %%In the mean time, multiply 1/AA(k,k) on k's row
        end
    end
end
for j=2*n:-1:1
    AA(1,j)=AA(1,j)/AA(1,1);
end
% disp(AA)
% At this point, AA should in the form [I|B]
B = AA(:,[n+1:2*n]);
disp(B);
x = B*b;