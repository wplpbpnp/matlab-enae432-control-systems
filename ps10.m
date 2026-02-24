% Benjamin Stutzke
% ENAE 432
% Homework 10

%% Question 1
zeta1 = 0.01;
zeta2 = 0.005;
omega1 = 5;
omega2 = 20;
rho = 0.05;
I = 50;

s = tf('s');

n1 = (rho*s^2)*(s^2 + 2*zeta1*omega1*s + omega1^2)^(-1);
n2 = (rho*s^2)*(s^2 + 2*zeta2*omega2*s + omega2^2)^(-1);

G = 1/((I*s^2)*(1-(n1+n2)))
zpk(G)

figure(1);
bode(G);
title("Question 1: Bode Diagram of G - Benjamin Stutzke");

G0 = 1/(I*s^2)

figure(2);
bode(G0);
title("Question 1: Bode of G_0 - Benjamin Stutzke");

K = 1;
beta = 5.83;
tau = 0.828;

H0 = beta*tau*s+1 / (tau*s + 1);

K = 5.61;
H = H0 * K;

L0 = minreal(G0*H0);
L = minreal(G0 * H);

figure(3);
bode(L)
title("Question 1: Bode of L with simple model - Benjamin Stutzke");

T = minreal(L/(L+1));
figure(4);
step(T)
title("Question 1: Step of T with simple model - Benjamin Stutzke");

%% Question 2
L_actual = minreal(H*G);
figure(5);
bode(L)
title("Question 2: Bode of L with real model - Benjamin Stutzke");

T_actual = minreal(L/(1+L));
figure(6);
step(T_actual, T);
legend("T", "T_0");
title("Question 2: Step comparison - Benjamin Stutzke");

delta = n1 + n2 / (1-n1-n2);

[Tmag, Tphase, Twout] = bode(T);

[invDmag, invDphase, invDwout] = bode(1/delta);

figure(7);
loglog(Twout, Tmag(:, :)')
hold on
loglog(invDwout, invDmag(:, :)')
title("Question 2: Comparing T0 to \Delta^-1 - Benjamin Stutzke");

%% Question 3
s = tf('s');
K = 1;

L0 = 5/(s*(s+5)^3);

w = 0.1;
error = 0.0001;
step = 0.001;
breakpoint = 10000;

w_arr = zeros(1, breakpoint);
r_arr = zeros(1, breakpoint);

counter = 1;
while 1
    s = -1 + w*1i;
    ang = angle(evalfr(L0, s));
    
    r = rem(ang, pi);
    diff = abs(r) - pi;
    if diff < error && diff > -error
        break;
    end

    w_arr(counter) = w;
    r_arr(counter) = r;

    if counter == breakpoint
        break;
    end

    counter = counter + 1;
    w = w + step;
end
disp(w);
    
