classdef common
    methods (Static)
        function res = calfunc(f_str, val)
            f = inline(f_str);
            res = f(val)
        end

        function res = intermediate(f_str, val)
            f = inline(f_str);
            res = fzero(f, val);
        end
        
        function res = newton(f_str, fprime_str, x0, eps)
           k = 0;
           xprev = x0;
           f = inline(f_str);
           fprime = inline(fprime_str);
           xnext = x0 - f(x0)/fprime(x0);
           
           if ~exist('eps','var') || isempty(eps)
              eps=0.01;
           end
           
           while abs(xnext - xprev) > eps*abs(xnext)
            xprev = xnext;
            xnext = xnext - f(xnext)/fprime(xnext);
            k = k + 1;
            res = [xnext k];
           end
        end
        
        function res = bisection(f_str, a, b, eps, steps)
            k = 0;
            f = inline(f_str);
            
            if ~exist('eps','var') || isempty(eps)
              eps=0.01;
            end

            if ~exist('steps','var') || isempty(steps)
              steps=2;
            end
            
            while abs(b - a) > eps * abs(b)
                x = (a + b)/2;
%                 if sign(f(x)) == sign(f(b)) 
                if sign(f(x))*sign(f(b)) > 0 
                    b = x;
                else
                    a = x;
                end
                k = k + 1;
                root = x;
                res = [root k];
                if k > steps
                    break;
                end
            end
        end
    end
end

