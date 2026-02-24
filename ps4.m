% Benjamin Stutzke
% 2/24/2023
% ENAE432 - 0102

%% Problem 3
K = 2/3;
K_p = 0:0.1:200;
K_d = K_p./4;

% Part A
figure(1);
hold on;
grid on;
title('Plot of D/I = 2 (Benjamin Stutzke, 2/24/2023, 0102)');
xlabel('\omega_d');
ylabel('\sigma');
yline(0);
xline(0);

D_I = 2;

for k=1:length(K_p)
    
    % Find roots of r(s)
    rts = roots([1 D_I K*K_d(k) K*K_p(k)]);
    
    % Plot each root
    plot(real(rts(1)), imag(rts(1)), 'x','Color',[0 0 0]);
    plot(real(rts(2)), imag(rts(2)), 'x','Color',[0 0 0]);
    plot(real(rts(3)), imag(rts(3)), 'x','Color',[0 0 0]);
end

% Part B
figure(2);
hold on;
grid on;
title('Plot of D/I = 6 (Benjamin Stutzke, 2/24/2023, 0102)');
xlabel('\omega_d');
ylabel('\sigma');
yline(0);
xline(0);

D_I = 6;

for k=1:length(K_p)
    
    % Find roots of r(s)
    rts = roots([1 D_I K*K_d(k) K*K_p(k)]);
    
    % Plot each root
    plot(real(rts(1)), imag(rts(1)), 'x','Color',[0 0 0]);
    plot(real(rts(2)), imag(rts(2)), 'x','Color',[0 0 0]);
    plot(real(rts(3)), imag(rts(3)), 'x','Color',[0 0 0]);
end