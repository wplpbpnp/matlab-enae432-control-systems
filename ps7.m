% Benjamin Stutzke
% ENAE 432 - 0102
% Problem Set 7
clear; close all;

%% Question 1
poles = roots([1 1 -1 2])
s = tf('s');

K = 1;
L = K*(s-1)/(s^3 +s^2 -s +2);
figure;
bode(L)
title("Question 1, Part A, K = 1 - Benjamin Stutzke");

K = 3/2;
L = K*(s-1)/(s^3 +s^2 -s +2);
figure;
bode(L)
title("Question 1, Part A, K = 3/2 - Benjamin Stutzke");

K = 2;
L = K*(s-1)/(s^3 +s^2 -s +2);
figure;
bode(L)
title("Question 1, Part A, K = 2 - Benjamin Stutzke");

K = 1.75;
L = K*(s-1)/(s^3 +s^2 -s +2);
figure;
bode(L)
title("Question 1, Part B, K = 1.75 - Benjamin Stutzke");

K = 3;
L = K*(s-1)/(s^3 +s^2 -s +2);
figure;
bode(L)
title("Question 1, Part B, K = 3 - Benjamin Stutzke");

%% Question 2
s = tf('s');
K = 1;

L = K/(10*s)
figure;
bode(L);
title("Question 2, Part A, K = 1 - Benjamin Stutzke");

K = -1;
L = K/(10*s)
figure;
bode(L);
title("Question 2, Part A, K = -1 - Benjamin Stutzke");

K = -20;
L = K/(10*s)
figure;
bode(L);
title("Question 2, Part B, K = -20 - Benjamin Stutzke");

%% Question 3
s = tf('s');
G = 1/(s^2);
K = 1;

z = -5;
p = -10;
H = K*(s-z)/(s-p);
L = G*H
figure;
bode(L);
title("Question 3, Part A, abs(z) < abs(p) - Benjamin Stutzke");

z = -10;
p = -5;
H = K*(s-z)/(s-p);
L = G*H
figure;
bode(L);
title("Question 3, Part A, abs(z) > abs(p) - Benjamin Stutzke");

z = -1;
p = -5;
H = K*(s-z)/(s-p);
L = G*H
figure;
bode(L)
title("Question 3, Part B, K = 1 - Benjamin Stutzke");

K = 10.93;
H = K*(s-z)/(s-p);
L = G*H
figure;
bode(L)
title("Question 3, Part B, K = 10.93 - Benjamin Stutzke");

error = 1e-5;
for omega = 0.01:0.0000001:100000
    s = omega*sqrt(-1);
    S = 1/((K*(s-z) + (s^2)*(s-p)) / ((s^2)*(s-p)));
    mag = 20*log10(abs(S));
    if abs((mag + 3)) < error
        omega
        break;
    end
end

%% Question 4
poles = roots([1 9 26 24 0])
K = 1;
s = tf('s');

H = (K/(24*s)) - (K/(4*(s+2))) + 16*K/(3*(s+3)) - 81*K/(8*(s+4)) + K
G = 1/(10*(s^2))
L = G*H

figure;
bode(L)
title("Question 4, Part B, K = 1 - Benjamin Stutzke");

K = 32.3;
H = (K/(24*s)) - (K/(4*(s+2))) + 16*K/(3*(s+3)) - 81*K/(8*(s+4)) + K
G = 1/(10*(s^2))
L = G*H

figure;
bode(L)
title("Question 4, Part B, K = 32.3 - Benjamin Stutzke");