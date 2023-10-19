% subplot(1, 2, 1);
N = 1024;
E = (0:N) * 1.6e-22;
m = 9.11e-31;
a = 1e-8;
b = 1e-9;
V = 1.6e-19;
h_bar = 1.05e-34;
alpha = sqrt(2 * m * abs(E) / h_bar ^ 2);
beta = sqrt(2 * m * (abs(E) - V) / h_bar ^ 2);
gamma = sqrt(2 * m * (V - abs(E)) / h_bar ^ 2);
f = (-alpha .^ 2 - beta .^ 2) ./ (2 .* alpha .* beta) .* sin(beta .* b) .* sin(alpha .* a) + cos(beta .* b) .* cos(alpha .* a);
f(1) = -beta(1) ^ 2 / (2 * beta(1)) * sin(beta(1) * b) * a + cos(beta(1) * b);
alpha = cat(2, -flip(alpha), alpha);
f = cat(2, flip(f), f);
% plot(a * alpha, f);
% xlabel('\alphaa');
% ylabel('f(\alphaa)');
% xticks([-5*pi -4*pi -3*pi -2*pi -pi 0 pi 2*pi 3*pi 4*pi 5*pi])
% xticklabels({'-5pi' '-4pi' '-3pi' '-2pi' '-pi' '0' 'pi' '2pi' '3pi' '4pi' '5pi'})
% subplot(1, 2, 2);
g = @(k, E) (-sqrt(2 * m * E / h_bar ^ 2) ^ 2 - sqrt(2 * m * (E - V) / h_bar ^ 2) ^ 2) / (2 * sqrt(2 * m * E / h_bar ^ 2) * sqrt(2 * m * (E - V) / h_bar ^ 2)) * sin(sqrt(2 * m * (E - V) / h_bar ^ 2) * b) * sin(sqrt(2 * m * E / h_bar ^ 2) * a) + cos(sqrt(2 * m * (E - V) / h_bar ^ 2) * b) * cos(sqrt(2 * m * E / h_bar ^ 2) * a) - cos(k * (a + b));
fimplicit(g, [-pi / (a + b) pi / (a + b) 0 5 * 1.6e-19],'MeshDensity',1024);
xlabel('k');
ylabel('E');
xticks([-1*pi/(a+b) 0 pi/(a+b)])
xticklabels({'-pi/(a+b)', '0', 'pi/(a+b)'})