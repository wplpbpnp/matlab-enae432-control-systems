% Benjamin Stutzke
% ENAE 432 - 0102
% Problem Set 6
clear; close all;

%% Question 1
% Input values from graph
M_r_dB_1 = 18.88;
omega_r_1 = 10^(-2);

M_r_dB_2 = 5.9;
omega_r_2 = 2;

M_r_dB = [M_r_dB_1 M_r_dB_2];
omega_r = [omega_r_1 omega_r_2];

% Converting from dB
M_r = 10.^(M_r_dB./20)

% Finding Damping Ratio
c = (M_r.^(-2))/4;
zeta = c;
for i=1:length(M_r)
    poly = [-1 0 1 0 -c(i)];
    rts = roots(poly);

    % Finding zeta that is in range 0..sqrt(2)/2
    for j=1:length(rts)
        if (rts(j) >= 0) && (rts(j) <= (sqrt(2)/2))
            zeta(i) = rts(j);
        end
    end
end

zeta_1 = zeta(1)
zeta_2 = zeta(2)

% Find oscillation frequencies
omega_n = omega_r./sqrt(1 - (2.*(zeta.^2)))
sigma_abs = zeta.*omega_n
omega_d = sqrt((omega_n.^2) - (sigma_abs.^2));

omega_d_1 = omega_d(1)
omega_d_2 = omega_d(2)

%% Question 2
s = tf('s');
G = 20*((1+(s/40))^2)/((s+2)^3)

figure(1);
bode(G);

%% Question 3
s = tf('s');
G = 81*(1+5*s)*(1+(s/20))/(s*((s+2)^5))

%figure(2);
%bode(G);

syms omega
c1 = (5*omega)/(1+sqrt(1+25*(omega^2)));
c2 = (omega/20)/(1+sqrt(1+((1/40)*(omega^2))));
c3 = omega/omega;
c4 = omega/(5+sqrt((omega^2)+25));
LHS = 2*atan(c1) + 2*atan(c2) - 2*atan(c3) - 5*2*atan(c4);
RHS = -pi;
o = vpasolve(LHS == RHS, omega, [0 Inf])

b1 = (o^4)*((o^2)+25)^5;
b2 = 6561*(1+25*(o^2))*(1+((1/40)*(o^2)));
K = double(sqrt(b1/b2))

G1 = K*81*(1+5*s)*(1+(s/20))/(s*((s+2)^5));
figure(3)
bode(G1);