function r=romberg2(f,a,b,n)
    h = (b - a) ./ (2.^(0:n - 1));
    r(1, 1)= (b - a) * (f(a) + f(b)) / 2; 
    for j=2:n
        total = 0; 
        for i=1:2^(j-2)
            total = total + f(a + (2 * i - 1) * h(j));
        end
        r(j, 1) = r(j - 1, 1) / 2 + h(j) * total; 
        for k=2:j
            r(j, k) = (4^(k - 1) * r(j , k - 1) - r(j - 1, k - 1)) / (4^(k - 1) - 1);
        end
    end
end
% function r = romberg2(f, a, b, n)
% %ROMBERG2 Summary of this function goes here
% %   Detailed explanation goes here
%     M = 1;
%     h = b - a;
%     K = 0;
%     r = zeros(n, n);
%     
%     r(1, 1) = h*(feval(f, a) + feval(f, b))/2;
%     
%     while (K < n)
%        K = K + 1;
%        h = h / 2;
%        s = 0;
%        for p=1:M
%           x = a + h *(2*p - 1);
%           s = s + feval(f, x);
%        end
%         
%     end
% end

