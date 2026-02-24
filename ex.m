s = tf('s');
c = 6.72;
b = 9.91;
K = 1.32;

G = c/(s+b)^3;
H = 1/(s+b);
L = G*H

sdes = (1.22-9.91)+1.22j;

angle(evalfr(G, sdes));

abs(evalfr(L, sdes))

syms x
eq = (x + b)^4 + K*c;
double(solve(eq, x))

%%
s = tf('s');
p = 2.51;
z = 8.25;
K = 626.55;
a = 2.4;
sdes = -8.25 + a*i;

L = K*(s+z)/(s+p)^4

abs(evalfr(L, sdes))

syms x
eq = K*(x+z) + (x+p)^4;
double(solve(eq))
%%
A_H = [-7.42 9.30; -9.30 -7.42];
Ts = 0.42;

Ad = expm(Ts.*A_H)