function res = Newton(f, fp, x0, N, tol)
   k = 0;
   xprev = x0;
   f = inline(f);
   fprime = inline(fp);
   xnext = x0 - f(x0)/fprime(x0);
   if ~exist('N','var') || isempty(N)
     N=1000;
   end
   if ~exist('tol','var') || isempty(N)
     tol=0.00001;
   end
    while 1
        xprev = xnext;
        xnext = xnext - f(xnext)/fprime(xnext);
        k = k + 1;
        res = [xnext k];
        if k > N || abs(f(xnext)) < tol
            break;
        end
    end
end