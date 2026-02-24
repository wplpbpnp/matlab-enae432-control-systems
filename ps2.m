p = [15 44 120 180 5];
z = [-600 -1100 9];
roots(p)
roots(z)

syms x
factor((-600*x^2)+(-1100*x)+9)