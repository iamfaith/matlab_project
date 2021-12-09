total = 0;
for even_number = 2:2:10
    total = total + even_number;
end


disp('The sum of all even numbers between 1 and 10:')

if total > 0
    disp(['num is positive: ', num2str(total)])
elseif total == 0
    disp('num is zero')
else
    disp('num is negative')
end

disp(total);