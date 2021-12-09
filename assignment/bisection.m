function v = bisection(f, a, b, N, tol, eps)
    % f: function string [a, b] N: iterations
    f = inline(f);
    k = 0;
    % set default value
    if ~exist('eps','var') || isempty(eps)
      eps=0.001;
    end
    if ~exist('N','var') || isempty(N)
      N=1000;
    end
    if ~exist('tol','var') || isempty(N)
      tol=0.00001;
    end
    
    while abs(b - a) > eps * abs(b)
        x = (a + b)/2;
        if sign(f(x))*sign(f(b)) > 0% better
            b = x;
        else
            a = x;
        end
        k = k + 1;
        v = [x k];
        if k > N || abs(f(x)) < tol
            break;
        end
    end
end 