% Benjamin Stutzke
% ENAE 432 - 0102
% Problem Set 5

clear; clc; close all;
%% Problem 1
s = tf('s');
tau = [0 1 -1];

figure(1);
hold on;

for i=1:length(tau)
    G = 6*(tau(i)*s+1)/(s^2 +2*s+4);
    step(G);
end

title("Question 1 - Benjamin Stutzke");
legend("\tau = 0", "\tau = 1", "\tau = -1");

% Finding values for y_p and t_p for tau = 0
p = roots([1 2 4]);
sigma = real(p(1));
omega_d = imag(p(1));

t_p = pi/omega_d
M_p = exp(sigma*pi/omega_d)
G0 = 6/4;
y_p = G0*(1+M_p)
%% Problem 2
figure(2);
hold on;

for i=1:length(tau)
    G = 6*(tau(i)*s+1)/(s^2 +4*s+4);
    step(G);
end

title("Question 2 - Benjamin Stutzke");
legend("\tau = 0", "\tau = 1", "\tau = -1");

% Finding t_s for tau = 0
p = roots([1 4 4])
sigma = real(p(1));
omega_n = sqrt(sigma^2);
zeta = abs(sigma)/omega_n
t_s = 6/abs(sigma)
%% Problem 3
figure(3);

G = (5000*(s+0.02))/(3*(2+s)*((20+s)^2));
w = logspace(-3, 3, 10000);

bode(G, w);

grid on;
title("Question 3 - Benjamin Stutzke");

% Explicit calculations for part b)
jomega = .6i;
G1 = (5000*(jomega+0.02))/(3*(2+jomega)*(20+jomega)^2)
G1_mag = abs(G1)
G1_angle = angle(G1)

G1_mag_dB = 20*log10(G1_mag)
G1_angle_deg = rad2deg(G1_angle)

% Explicit calculations for part c)
jomega = 70i;
G2 = (5000*(jomega+0.02))/(3*(2+jomega)*(20+jomega)^2)
G2_mag = abs(G2)
G2_angle = angle(G2)

G2_mag_dB = 20*log10(G2_mag)
G2_angle_deg = rad2deg(G2_angle)

% Explicit calculations for part d)
jomega = 4.29i;
G3 = (5000*(jomega+0.02))/(3*(2+jomega)*(20+jomega)^2)
G3_mag = abs(G3)
G3_angle = angle(G3)

G3_mag_dB = 20*log10(G3_mag)
G3_angle_deg = rad2deg(G3_angle)

jomega = 6.35i;
G4 = (5000*(jomega+0.02))/(3*(2+jomega)*(20+jomega)^2)
G4_mag = abs(G4)
G4_angle = angle(G4)

G4_mag_dB = 20*log10(G4_mag)
G4_angle_deg = rad2deg(G4_angle)

% Explicit calculations for part e)
jomega = 21.9i;
G5 = (5000*(jomega+0.02))/(3*(2+jomega)*(20+jomega)^2)
G5_mag = abs(G5)
G5_angle = angle(G5)

G5_mag_dB = 20*log10(G5_mag)
G5_angle_deg = rad2deg(G5_angle)
%% Problem 4
bode_form = zpk(G);
bode_form.DisplayFormat='frequency'

figure(4);
bodemag(G);

grid on;
title("Question 4 - Benjamin Stutzke");