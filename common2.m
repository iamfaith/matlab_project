function [f1, f2] = common2
    f1 = @func1;
    f2 = @func2;
end

function y = func1(a)
    y = 5 * a;
end

function y = func2(a)
    y = a + 2;
end
