% Benjamin Stutzke
% ENAE 432
% Problem Set 11

%% Question 1
s = tf('s');
G = (s-1)/(s^3 + s^2 - s +2);
H = 2;

L0 = G;
L = G*H;
figure(1);
bode(L0);
figure(2);
nyquist(L0);

figure(3);
bode(L);
figure(4);
nyquist(L);

roots([1 1 -1 2])
figure(5);
rlocus(G)
%% Question 2
s = tf('s');
K = 2.25;
p = 2;
G = 4*(s-1)/(s-5);
H = K/(s-p);
Yd = 1/s;

L = minreal(G*H)
T = minreal(L/(1+L))
R = minreal(H/(1+L))
U = minreal(R*Yd)

rlocus(L)

%% Question 3
s = tf('s');
p = 5;

Lp = p*(s-2)/(-s*(s-2)-9*(s-1));
figure;
rlocus(Lp)

z = 1;
Lz = z*(-9/((s-5)*(s-2)+9*s));
figure;
rlocus(Lz)

%% Question 4
s = tf('s');
Ts = 0.02;
H = (20*(5*s+1)^5)/(((s+3)^3)*((s^2) + (2*s) + 15));

[Ah, Bh, Ch, Dh] = ssdata(canon(H))
Ad = expm(Ah .* Ts)

I = eye(length(Ad));

Bd = inv(Ah)*(Ad - I)*Bh

fprintf("Tustin: \n");
% Tustin
[Ad, Bd, Cd, Dd] = ssdata(c2d(H, Ts, 'tustin'))
