h = 6.626e-34;
m_e = 9.1e-31 * 1.08;
m_h = 9.1e-31 * 0.56;
E_g = 1.12 * 1.6e-19;
g_d = 2;
g_a = 4;
E_D = 0.5 * E_g - 0.05 * 1.6e-19;
E_A = -0.5 * E_g + 0.05 * 1.6e-19;
N = 10 .^ (12:18);
k = 1.38e-23;

color = ["#FF0000" "#FFAA00" "#00FF00" "#00FFFF" "#0000FF" "#FF00FF" "#000000"];

% n_d = N(i) / (1 + exp((E_D - E) / (k * T)) / g_d)
% n_i = sqrt((2 * (2 * pi * m_e * k * T / h ^ 2) ^ (3 / 2) * 1e-6) * (2 * (2 * pi * m_h * k * T / h ^ 2) ^ (3 / 2) * 1e-6)) * exp(-E_g / (2 * k * T))
% (N(i) - n_d) / 2 + sqrt((N(i) - n_d) ^ 2 / 4 + n_i ^ 2) - (2 * (2 * pi * m_e * k * T / h ^ 2) ^ (3 / 2) * 1e-6) * exp(-(0.5 * E_g - E) / (k * T));

hold on;
for i = 1:7
    % f = @(T, E) (E - k * T * log(((2 * (2 * pi * m_e * k * T / h ^ 2) ^ (3 / 2) * 1e-6 * exp(-(E_g / 2 - E) / (k * T))) + N(i) * (1 - 1 /(1 + exp((E_D - E) / (k * T)) / g_d))) / (sqrt((2 * (2 * pi * m_e * k * T / h ^ 2) ^ (3 / 2) * 1e-6) * (2 * (2 * pi * m_h * k * T / h ^ 2) ^ (3 / 2) * 1e-6)) * exp(-E_g / (2 * k * T)))));
    f = @(T, E) (N(i) - (N(i) / (1 + exp((E_D - E) / (k * T)) / g_d))) / 2 + sqrt((N(i) - (N(i) / (1 + exp((E_D - E) / (k * T)) / g_d))) ^ 2 / 4 + (sqrt((2 * (2 * pi * m_e * k * T / h ^ 2) ^ (3 / 2) * 1e-6) * (2 * (2 * pi * m_h * k * T / h ^ 2) ^ (3 / 2) * 1e-6)) * exp(-E_g / (2 * k * T))) ^ 2) - (2 * (2 * pi * m_e * k * T / h ^ 2) ^ (3 / 2) * 1e-6) * exp(-(0.5 * E_g - E) / (k * T));
    fp = fimplicit(f, [1 800 -0.7 * 1.6e-19  0.7 * 1.6e-19], 'MeshDensity', 256);
    fp.Color = color(i);
    xlabel("T(K)");
    g = @(T, E) (N(i) - (N(i) / (1 + exp((E - E_A) / (k * T)) / g_a))) / 2 + sqrt((N(i) - (N(i) / (1 + exp((E - E_A) / (k * T)) / g_a))) ^ 2 / 4 + (sqrt((2 * (2 * pi * m_e * k * T / h ^ 2) ^ (3 / 2) * 1e-6) * (2 * (2 * pi * m_h * k * T / h ^ 2) ^ (3 / 2) * 1e-6)) * exp(-E_g / (2 * k * T))) ^ 2) - (2 * (2 * pi * m_h * k * T / h ^ 2) ^ (3 / 2) * 1e-6) * exp(-(E + 0.5 * E_g) / (k * T));
    gp = fimplicit(g, [1 800 -0.7 * 1.6e-19  0.7 * 1.6e-19], 'MeshDensity', 256);
    gp.Color = color(i);
    ylabel("E_F-E_Fi(eV)");
end
hold off;
yticks([-0.6 * 1.6e-19, -0.4 * 1.6e-19, -0.2 * 1.6e-19, 0, 0.2 * 1.6e-19, 0.4 * 1.6e-19, 0.6 * 1.6e-19])
yticklabels({'-0.6 eV', '-0.4 eV', '-0.2 eV', '0 eV', '0.2 eV', '-0.4 eV', '0.6 eV'});