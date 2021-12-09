syms x
% f = 1/x;
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