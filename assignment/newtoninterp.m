function v = newtoninterp(x, y, u)
%NEWTONINTERP Summary of this function goes here
%   Detailed explanation goes here
    n=length(x);
    m=length(y);
%     [o, p]=size(u);
    p = length(u);
    v = zeros(size(u));
    if m~=n; error('x and y must be same size');
    else
        F = div_diff(x, y);
        % Compute Newton polynomial using nested format
        for j=1:p
            z=F(1,n);% v0=cn
            for i=n-1:-1:1
                z=F(1,i)+(u(j)-x(i))*z; % nested formula
            end
            v(j) = z;
        end
    end
end


function F=div_diff(x,y)
    % div_diff function computes all divide differences fro % the data stored in x and y=f(x)
    n=length(x);
    m=length(y);
    if m~=n; error('x and y must be same size');
    else
        F = zeros(n,n);
        for i=1:n % define 0th divide difference
            F(i,1)=y(i);
        end
        for k=1:n-1 % Get kth divide difference
            for i=1:n-k 
                F(i,k+1)=(F(i+1,k)-F(i,k))/(x(i+k)-x(i));
            end
        end
    end
end