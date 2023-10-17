clc;
clear;
close;
T_s = 1/20;

%a
for a = 1:100
    x(a) = cos(2 * pi * (a - 1) * T_s);
end
n = 1:100;
figure(1);
subplot(1, 1, 1);
plot(n, x);
title("(a)");
xlabel("n");
ylabel("x[n]");

%b
[b1, a1] = butter(3, 0.05)
[H1, w1] = freqz(b1, a1);
figure(2);
subplot(3, 3, 1);
plot(w1, db(abs(H1)));
title("(b)-1");
xlabel("w");
ylabel("|H1(exp(jw))|(dB)");
subplot(3, 3, 2);
plot(w1, angle(H1) * 180 / pi);
title("(b)-2");
xlabel("w");
ylabel("∠(H1(exp(jw)))");
y1 = filter(b1, a1, x);
subplot(3, 3, 3);
plot(n, y1);
title("(b)-3");
xlabel("n");
ylabel("y1[n]");

%c
[b2, a2] = butter(7, 0.05)
[H2, w2] = freqz(b2, a2);
subplot(3, 3, 4);
plot(w2, db(abs(H2)));
title("(c)-1");
xlabel("w");
ylabel("|H2(exp(jw))|(dB)");
subplot(3, 3, 5);
plot(w2, angle(H2) * 180 / pi);
title("(c)-2");
xlabel("w");
ylabel("∠(H2(exp(jw)))");
y2 = filter(b2, a2, x);
subplot(3, 3, 6);
plot(n, y2);
title("(c)-3");
xlabel("n");
ylabel("y2[n]");

%d
[b3, a3] = butter(3, 0.5)
[H3, w3] = freqz(b3, a3);
subplot(3, 3, 7);
plot(w3, db(abs(H3)));
title("(d)-1");
xlabel("w");
ylabel("|H3(exp(jw))|(dB)");
subplot(3, 3, 8);
plot(w3, angle(H3) * 180 / pi);
title("(d)-2");
xlabel("w");
ylabel("∠(H3(exp(jw)))");
y3 = filter(b3, a3, x);
subplot(3, 3, 9);
plot(n, y3);
title("(d)-3");
xlabel("n");
ylabel("y3[n]");