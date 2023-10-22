h = 6.626e-34;
m_e = 9.1e-31 * 1.08;
m_h = 9.1e-31 * 0.56;
E_g = 1.12 * 1.6e-19;
g_d = 2;
E_D = 0.05 * 1.6e-19;
E_A = -0.05 * 1.6e-19;
N_D = 1e15;
k = 1.38e-23;

N_c = @(T) 2 * ((2 * pi * m_e * k * T) / (h ^ 2)) ^ (3 / 2) * 1e-6;
N_v = @(T) 2 * ((2 * pi * m_h * k * T) / (h ^ 2)) ^ (3 / 2) * 1e-6;
n_i = @(T) sqrt(N_c(T) * N_v(T)) * exp(-E_g / (2 * k * T));
E_F = @(T, n) 0.5 * E_g - k * T * log(N_c(T) / (n));
n_d = @(T, n) N_D / (1 + exp(((0.5 * E_g - E_D) - E_F(T, n)) / (k * T)) / g_d);
f = @(T, n) ((N_D - n_d(T, n)) / 2 + sqrt((N_D - n_d(T, n)) ^ 2 / 4 + (n_i(T) ^ 2))) - n;

fimplicit(f, [50 300 1e14 3e15]);
yscale log;
xlabel("T(K)");
ylabel("n(#/cm^3)");