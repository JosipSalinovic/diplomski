
% Load the first impedance data file
data1 = load('D900_V.txt');
                          % Frequency in GHz (optional use)
Z1 = data1(:, 7) + 1j * data1(:, 9);          % Complex impedance

% Load the second impedance data file
data2 = load('realsuzv.txt');
                      
data3 = load('imagsuz.txt');
freq3 = data2(:, 1);                          % Frequency in GHz (optional use)
Z2 = data2(:, 2) + 1j * data3(:, 2);          % Complex impedance

data4 = load('realnec.txt');
                      
data5 = load('imagnec.txt');
freq5 = data4(:, 1);                          % Frequency in GHz (optional use)
Z3 = data4(:, 2) + 1j * data5(:, 2);  



% Reference impedance
Z0 = 50.0;

% Compute reflection coefficients
Gamma1 = (Z1 - Z0)./(Z1 + Z0);
Gamma2 = (Z2 - Z0)./(Z2 + Z0);
Gamma3 = (Z3 - Z0)./(Z3 + Z0);


% Plot both datasets on the same Smith chart


% Plot first dataset (e.g., blue)
s=smithplot(Gamma1,'LineStyle','-','Color','g','LineWidth',2)
hold on
s=smithplot(Gamma2,'LineStyle','-','Color','r','LineWidth',2)
hold on
s=smithplot(Gamma3,'LineStyle','-','Color','c','LineWidth',2)

hold off

legend('Eksperiment','SUZANA','4NEC2')