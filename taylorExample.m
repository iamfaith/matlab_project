% More details can be found here: https://www.mathworks.com/help/symbolic/sym.taylor.html
classdef taylorExample
    methods (Static)
        function [] = e1()
            syms x
            f = cos(x);

            T5 = taylor(f, x, 'ExpansionPoint', 0, 'Order', 5);
            T8 = taylor(f, x, 'Order', 8);
            T10 = taylor(f, x, 'Order', 10);

            fplot([T5 T8 T10 f])

            xlim([-10 10])
            grid on


            legend('approximation of cos(x) up to O(x^5)',...
                   'approximation of cos(x) up to O(x^8)',...
                   'approximation of cos(x) up to O(x^{10})',...
                   'cos(x)','Location','Best')

            title('Taylor Series Expansion')
        end
        
        function [] = e2()
            syms x
            f = 1/x;

            T2 = taylor(f, x, 'ExpansionPoint', 2, 'Order', 2);
            T3 = taylor(f, x, 'ExpansionPoint', 2, 'Order', 3);

            fplot([T2 T3 f])

            xlim([-4 4])
            grid on

            legend('approximation of 1/x up to O(x^2)',...
                   'approximation of 1/x up to O(x^{3})',...
                   '1/x','Location','Best')

            title('Taylor Series Expansion')
        end
    end
end

