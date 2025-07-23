% Load the first impedance data file
data1 = load('imp_real_suz.txt');

data2 = load('imp_imag_suz.txt');

freq1 = data1(:, 1);                          % Frequency in GHz (optional use)
Z1 = data1(:, 2) + 1j * data2(:, 2);          % Complex impedance


data3 = load('refl_nec.txt');
y = data3(:, 2);


% Reference impedance
Z0 = 50.0;

% Compute reflection coefficients
Gamma = (Z1 - Z0) ./ (Z1 + Z0);
Gamma_dB = 20 * log10(abs(Gamma));

% Plot both datasets on the same Smith chart


% Plot first dataset (e.g., blue)
plot(freq1,Gamma_dB, 'b-');

hold on;
% Plot second dataset (e.g., red)
plot(freq1, y, 'g-');
hold off;
grid on;

legend('Simulator: Suzana', 'Simulator: 4NEC2');

 