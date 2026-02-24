% Benjamin Stutzke
% ENAE432 - 0102
% Homework 8

%% Question 1
s = tf('s');
I = 10;
b = 7.84;
t = 3.57;

% Part A
G = 1/((I*(s^2))*(s+1))
H_0 = (b*t*s + 1)/(t*s + 1)
L_0 = minreal(G * H_0)

figure;
bode(H_0)
title("Question 1: H_0 - Benjamin Stutzke");

figure;
bode(L_0)
title("Question 1: L_0 - Benjamin Stutzke");

% Finding L_0 at omega_des
z = 0.1i;
K = 1/abs(evalfr(L_0, z))

H = H_0 * K
L = minreal(G * H)

figure;
bode(H)
title("Question 1: H - Benjamin Stutzke");

figure;
bode(L)
title("Question 1: L - Benjamin Stutzke");

% Part B
T = minreal(L/(1 + L));
zpk(T)

% Part C
figure;
step(T)
title("Question 1: Step Response of T - Benjamin Stutzke");

% Part D
I = abs(evalfr(L_0, 0.484i))
L = minreal(L_0/I)
figure;
bode(L)
title("Question 1: L with Minimum I - Benjamin Stutzke");

% Part E
I = 10;
L = minreal(L_0/I);
S = minreal(1/(1+L));

figure;
bode(S);
title("Question 1: Sensitivity Diagram - Benjamin Stutzke");

%% Question 2
% Part B
s = tf('s');
I = 10;

g_des = 45; % degrees
o_des = 1; % rad/s

G = 1/((I*(s^2))*(s+1))
angle_G = angle(evalfr(G, o_des*sqrt(-1)))
phi_req = g_des - 180 - rad2deg(angle_G)
phi_req = 360 + phi_req
phi_req = deg2rad(phi_req/2)

b = (1+sin(phi_req))/(1-sin(phi_req))
t = 1/(o_des*sqrt(b))

H_10 = (b*t*s + 1)/(t*s + 1)
H_0 = minreal(H_10 * H_10)
L_0 = minreal(G * H_0)

K = 1/abs(evalfr(L_0, o_des*sqrt(-1)))

H = H_0 * K;
L = minreal(G*H);
zpk(L)

figure;
bode(H);
title("Question 2: H - Benjamin Stutzke");

figure;
bode(L)
title("Question 2: L - Benjamin Stutzke");

% Finding poles of T
T = minreal(L/(1 + L));
zpk(T)
roots([1 .6633 .1658])
roots([1 1.248 2.177])

% Step response of T
figure;
step(T)
title("Question 2: Step Response of T - Benjamin Stutzke");

% Finding change in I
I = 1;
G = 1/((I*(s^2))*(s+1));
L_0 = minreal(G * H)
cross_freq = 0.43;
I = abs(evalfr(L_0, cross_freq*sqrt(-1)))
L = minreal(L_0/I)
figure;
bode(L)
title("Question 2: L with Minimum I - Benjamin Stutzke");

% Part E
I = 10;
L = minreal(L_0/I);
S = minreal(1/(1+L));

figure;
bode(S);
title("Question 2: Sensitivity Diagram - Benjamin Stutzke");

%% Question 3
s = tf('s');
I = 10;
b = 7.84;
t = 3.57;

% Part A
G = 1/((I*(s^2))*(s+1))
H_0 = (b*t*s + 1)/(t*s + 1)
L_0 = minreal(G * H_0)

% Finding L_0 at omega_des
z = 0.1i;
K = 1/abs(evalfr(L_0, z))

H = H_0 * K
L = minreal(G * H)

S = minreal(1/(1+L))
H = H/s
L = minreal(G * H)

%% Question 4
I = 10;
K = 1;
z1 = .01;
z2 = .015;
p1 = 2;

s = tf('s');
G = 1/((I*(s^2))*(s+1))
H = K*(s+z1)*(s+z2)/(s*(s+p1))

L = minreal(G*H)

figure;
bode(L)
title("Question 4: Representative L - Benjamin Stutzke");