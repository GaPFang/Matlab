clc;
clear;
close;
T = 100;
N1 = 500;
N = 1001;
T_s = T / N1;
T_w = T / 2;
genSinc = inline("sin(2 * pi * t) / (2 * pi * t)", "t");
for a = 1:500
    dsinc(a) = genSinc((a - 501) * T_s);
end;
for a = 502:1001
    dsinc(a) = genSinc((a - 501) * T_s);
end;
dsinc(501) = 1;
n = -500 : 500;
nexttile;
plot(n, dsinc);
%a
xlabel("n");
ylabel("x[n]");
DFT = abs(fftshift(fft(dsinc, N)));
nexttile;
plot((2 * pi * n) / N, DFT);
%b
xlabel("frequency");
ylabel("DFT(omega)");
for a = 1:N
    DFT2(a) = 0;
    for b = 1:N
        DFT2(a) = DFT2(a) + dsinc(b) * exp(-j * 2 * pi * (a - 1) * (b - 1) / N);
    end;
    DFT2(a) = abs(DFT2(a));
end;
DFT2 = fftshift(DFT2);
nexttile;
plot((2 * pi * n) / N, DFT2);
%c
xlabel("frequency");
ylabel("X_k(exp(j*omega))");
%verify
all(DFT - DFT2 < 1e-12)

genWindow = inline("(1 + cos((2 * pi * abs(t)) / 50)) / 2", "t");
for a = 1:375
    w(a) = 0;
end
for a = 376:626
    w(a) = genWindow((a - 501) * T_s);
end;
for a = 627:1001
    w(a) = 0;
end
nexttile;
plot(n, w);
%d
xlabel("n");
ylabel("w[n]");
for a = 1:1001
    y(a) = dsinc(a) * w(a);
end;
nexttile;
plot(n, y);
%e
xlabel("n");
ylabel("y[n]");
DFT_Y = abs(fftshift(fft(y, N)));
nexttile;
plot((2 * pi * n) / N, DFT_Y);
%f
xlabel("frequency");
ylabel("DFT_y");



