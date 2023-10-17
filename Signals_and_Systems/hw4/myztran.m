clc;
clear;
close;

b0 = 0.09;
b1 = [1, -1];
b2 = [1, 1];
b = b0 * conv(conv(conv(b1, b1), b2), b2);

a1 = [1 -0.6 0.25];
a2 = [1 -0.2 0.02];
a = conv(a1, a2);

z = [1 1 -1 -1];
p = [0.3 + 0.4i 0.3 - 0.4i 0.1 + 0.1i 0.1 - 0.1i];

%a
nexttile;
zplane(b, a);

%b
[r, p, k] = residuez(b, a);
for n = 1:21
    hb(n) = 0;
    for index = 1:4
        hb(n) = hb(n) + r(index) * p(index) ^ (n - 1);
    end
end
hb(1) = hb(1) + k;
nexttile;
stem(0:20, hb);
title('(b)');
xlabel('n');
ylabel('h[n]');

%c
[h, w] = freqz(b, a);
nexttile;
plot(w, db(abs(h)));
title('(c)-magnitude');
xlabel('rad');
ylabel('|H(exp(jw))| (dB)');
nexttile;
plot(w, angle(h));
title('(c)-phase');
xlabel('rad');
ylabel('∠H(exp(jw))');

%d
sos = zp2sos(z, p, 0.09)

%e
b1 = sos(1, [1:3]);
a1 = sos(1, [4:6]);
[h1, w1] = freqz(b1, a1);

b2 = sos(2, [1:3]);
a2 = sos(2, [4:6]);
[h2, w2] = freqz(b2, a2);

nexttile;
plot(w1, db(abs(h1)));
title('(e)-H1');
xlabel('rad');
ylabel('|H1(exp(jw))| (dB)');
nexttile;
plot(w2, db(abs(h2)));
title('(e)-H2');
xlabel('rad');
ylabel('|H2(exp(jw))| (dB)');
nexttile;
plot(w, db(abs(h1) .* abs(h2)));
title('(e)-H1*H2');
xlabel('rad');
ylabel('|H1(exp(jw))| * |H2(exp(jw))| (dB)');
all(abs(h1) .* abs(h2) - abs(h) < 1e-12)

%f
x = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
y = filter(b, a, x);
nexttile;
stem(0:20, y);
title('(f)')
xlabel('n');
ylabel('y[n]');
all(y - hb < 1e-12)

