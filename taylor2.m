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