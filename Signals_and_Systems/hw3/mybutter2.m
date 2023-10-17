clc;
clear;
close;
T_s = 0.002;
f_1 = 100;
M = 1000;

%a
for a = 1:M
    x(a) = cos(2 * pi * (a - 1) * T_s) + 2 * cos(2 * pi * f_1 * (a - 1) * T_s);
end
n = 1:M;
subplot(3, 1, 1);
plot(n, x);
title("(a)");
xlabel("n");
ylabel("x[n]");

%b
[b1, a1] = butter(16, 0.3)
y1 = filter(b1, a1, x);
subplot(3, 1, 2);
plot(n, y1);
title("(b)");
xlabel("n");
ylabel("y1[n]");

%c
[b2, a2] = butter(16, [0.3, 0.8], "bandpass")
y2 = filter(b2, a2, x);
subplot(3, 1, 3);
plot(n, y2);
title("(c)");
xlabel("n");
ylabel("y2[n]");