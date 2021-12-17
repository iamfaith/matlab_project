function r = romberg(f, a, b, n)
    h = b - a;
    r = zeros(n + 1);
    r(1,1) = (f(a) + f(b))/2 * h;
    
    fprintf('\n %11.8f\n\n', r(1,1));
    for i = 2:n
        sum = 0;
        for k = 1:2^(i - 2)
           sum = sum + f(a + (k - 0.5)* h);
        end
        
        r(2,1) = (r(1,1) + h*sum)/2;
        
        for j = 2:i
           l = 2^(2*(j - 1));
           r(2, j) = r(2, j - 1) + (r(2, j-1) - r(1, j - 1))/(l - 1);
        end
        
        for k = 1:i
           fprintf(' %11.8f', r(2, k)); 
        end
        
        fprintf('\n\n');
        
        h = h/2;
        
        for j = 1:i
           r(1, j) = r(2, j); 
        end
    end
    disp(size(r))
end

