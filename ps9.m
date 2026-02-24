% Benjamin Stutzke
% ENAE432
% Problem Set 9

%% Question 1
s = tf('s');

Ki = 1;
Kp = 1;

% high end, somewhere around 100
Ki_range = 109:.01:120;

ki_diagnostic_array = zeros(1, length(Ki_range));
kp_diagnostic_array = zeros(1, length(Ki_range));
Ts_diagnostic_array = zeros(1, length(Ki_range));

for i=1:length(Ki_range)
    tempKi = Ki_range(i);
    tempKp = (sqrt(4*.26*tempKi) - .1)/.26;
    if(tempKp * 0.1 < tempKi)
        tempL = 0.26*tempKp*(s+(tempKi/tempKp))/(s*(s+0.1));
        tempT = minreal(tempL/(1+tempL));

        ts = stepinfo(tempT).SettlingTime;

        ki_diagnostic_array(i) = tempKi;
        kp_diagnostic_array(i) = tempKp;
        Ts_diagnostic_array(i) = ts;
        
        if(ts > 0.95 && ts < 1.001)
            Kp = tempKp;
            Ki = tempKi;
            break;
        end
    end
end

% Kp = 40.8203
% Ki = 110.36

L = 0.26*Kp*(s+(Ki/Kp))/(s*(s+0.1))
figure;
bode(L)
title("Question 1: L - Benjamin Stutzke");

T = minreal(L/(1+L))
figure;
step(T)
title("Question 1: Step Response of T - Benjamin Stutzke");

roots([1 (.26*Kp+0.1) (0.26*Ki)])

%% Question 2
s = tf('s');
G = 4/(s*((s+2)^2))

K = 4;
H = K
L = minreal(G*H)

figure;
bode(L)
title("Question 2: L with H(s) = K - Benjamin Stutzke");

Ku = K;
Tu = pi;

Kp = (3/5)*Ku
Ki = 2*Kp/Tu
Kd = Kp*Tu/8

H = Kp + Kd*s + Ki/s

L = minreal(G*H)
1+L
figure;
bode(L)
title("Question 2: L with adjusted gains - Benjamin Stutzke");

roots([1 4 7.76 9.6 6.12])

T = minreal(L/(1+L))
figure;
step(T)
title("Question 2: Step Response of T - Benjamin Stutzke");

%% Question 3

Ki = 1.385;
Kd = 2.75*Ki
Kp = .687*Kd

H = Kp + Kd*s + Ki/s
L = minreal(G*H)

figure;
bode(L)
title("Question 3: L - Benjamin Stutzke");

T = minreal(L/(1+L));
figure;
step(T)
title("Question 3: Step Reseponse of T - Benjamin Stutzke");