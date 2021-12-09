function u = secant(f, x0, x1, N, tol)
   if ~exist('N','var') || isempty(N)
     N=1000;
   end
   if ~exist('tol','var') || isempty(N)
     tol=0.00001;
   end
   f = inline(f);
   k = 0;
   xprev = x0;
   xnext = x1;
   while 1
        xtemp = xnext;
        xnext = xnext - ((xnext - xprev)/(f(xnext) - f(xprev))) * f(xnext);
        xprev = xtemp;
        k = k + 1;
        u = [xnext k];
        if k > N || abs(f(xnext)) < tol
            break;
        end
   end 
end