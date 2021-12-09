function x = gauss_no_pivot(A,b)
% gauss_no_pivot compute the solution for Ax=b
% Assumes that gaussian elimination can be done without pivots
% and that a solution exists (matrix is nonsingular)

    [row, col] = size(A);
    
    x = zeros(row, 1);
    
    if row ~= col
        error("A is not a square matrix");
    elseif row ~= size(b)
        error("b must be the same size as A");
    else
        AA = [A b]; % create augmented matrix
        for k=1:row - 1
            if A(k, k) == 0, error("null diagonal element");
            end
            
            for i = k + 1: row % for row i below row k
                if AA(k, k) == 0
                    AA(k, k) = 1e-3;
                end
                m = AA(i, k) / AA(k, k); % m = scalar for row i

                % vectorization  
                AA(i, :) = AA(i, :) - m * AA(k, :);
%                 for j = k: col + 1
%                     AA(i, j) = AA(i, j) - m * AA(k, j);
%                 end
            end
            fprintf("step %d:\n", k);
            disp(AA);
        end
        
        x(row) = AA(row, row + 1)/AA(row, row);
        for i = row - 1: -1: 1
%             s = 0;
            % vectorization  
            s = sum(AA(i,1:col) .* x');
%               for j = i + 1: col
%                   s = s + AA(i, j) * x(j);
%               end
            x(i) = (AA(i, row + 1) - s)/AA(i, i);
        end
    end

end

