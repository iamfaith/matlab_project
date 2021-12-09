classdef splines
    methods (Static)
        function res = test(val)
            res = val * 5;
        end

        function v = piececubic(x, y, u)
            n = length(x);
            a = zeros(n - 1, 1);
            b = zeros(n - 1, 1);
            c = zeros(n - 1, 1);
            h = diff(x);
            
            delta = diff(y) ./ h;
            a(1) = delta(1) / (h(1)^2);
            
            b(1) = 0;
            c(1) = 0;
            
            for i = 1:n-2
                c(i + 1) = 3 * a(i) * h(i)^2 + 2 * b(i) * h(i) + c(i);
                b(i + 1) = 3 * a(i) * h(i) + b(i);
                a(i + 1) = ( delta(i + 1) - c(i + 1) - b(i + 1) * h(i + 1)) / (h(i + 1)^2);
            end
            k = 1;
            for j = 2: n - 1
               if x(j) <= u
                   k =j;
               end
            end
            v = a(k) * ( (u - x(k))^3 ) + b(k) * ((u - x(k))^2 ) + c(k)*(u - x(k)) + y(k);
        end
        
        function quad = piecequad(x, y, u, z0)
            n = length(x);
            z = zeros(n);
            if ~exist('z0','var') || isempty(z0)
              z0 = 0;
            end
            z(1) = z0;

            for i = 2:n
                z(i) = 2*(y(i)-y(i-1))/(x(i)-x(i-1))-z(i-1);
            end

            k = 1;
            for j = 2:n-1
                if x(j) <= u
                    k = j;
                end
            end
            s = u-x(k);
            quad = s^2*(z(k+1)-z(k))/(2*(x(k+1)-x(k)))+z(k)*s+y(k);
        end
        
        function plot(x, y, func)
           u = min(x):0.05:max(x);
           [m, n] = size(u);
           splinevals = zeros(size(u));
           if ~exist('func','var') || isempty(func)
              func=@splines.piececubic;
           end
           for i = 1: n
              splinevals(i) = func(x, y, u(i));
           end
           plot(x, y, 'o', u, splinevals, '-');
        end
        
        function coefficient = expfit(x, y)
             A = zeros(length(x), 2);
             A(:, 1) = exp(x);
             A(:, 2) = exp(-x);
             D = A' * A;
             e = A' * y';
             coefficient = D \ e;
%              coef = inv(D) * (A' * y');
             error = y' - A * coefficient;
             [N D] = size(y);
             rmse = (error' * error / D)^0.5
        end
        
        function coef = bestExpFit(x, y)
            A = zeros(length(x), 2);
            A(:, 1) = exp(x);
            A(:, 2) = exp(-x);
            D = A' * A;
            coef = inv(D) * (A'*y);
            r = y - A*coef;
            [h, w] = size(y);
            % estimate the model
            rmse = (r'*r/h)^0.5
        end
        
        function coefficient = quadfit(x,y)
            A = zeros(length(x), 3);
            A(:, 1) = ones(length(x), 1);
            A(:, 2) = x;
            A(:, 3) = x.^2;

            D = A' * A;
            e = A' * y';

            coefficient = D \ e;
        end
        
    
    end
end