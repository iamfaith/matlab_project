function v=polyinter(x,y,u)
    n = length(x);
    [l, m]=size(u);
    v = zeros(size(u));
    for i=1:m
        z = 0;
        for k=1:n %Generate all term of the Lagrange polynomial
            w = 1; %Stores one term
            for j=[1:k-1 k+1:n] %Computes the product of the fractions
                w = w*(u(i)-x(j))/(x(k)-x(j));
                disp('----')
                disp(j)
                disp('----')
            end
            z = z+w*y(k);
        end
        v(i) = z;
    end   
end

