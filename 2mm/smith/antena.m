
% Load the first impedance data file
data1 = load('D900.txt');
                          % Frequency in GHz (optional use)
Z1 = data1(:, 7) + 1j * data1(:, 9);          % Complex impedance

% Load the second impedance data file
data2 = load('realimp2mmsuz.txt');
                      
data3 = load('imagimp2mmsuz.txt');
freq3 = data2(:, 1);                          % Frequency in GHz (optional use)
Z2 = data2(:, 2)/1000 + 1j * data3(:, 2);          % Complex impedance

data4 = load('realnec.txt');
                      
data5 = load('imagnec.txt');
freq5 = data4(:, 1);                          % Frequency in GHz (optional use)
Z3 = data4(:, 2) + 1j * data5(:, 2);  

data6 = load('teorijaimp.txt');
freq6 = data6(:, 1);                          % Frequency in GHz (optional use)
Z4 = data6(:, 2) + 1j * data6(:, 3);  


% Reference impedance
Z0 = 50.0;

% Compute reflection coefficients
Gamma1 = (Z1 - Z0)./(Z1 + Z0);
Gamma2 = (Z2 - Z0)./(Z2 + Z0);
Gamma3 = (Z3 - Z0)./(Z3 + Z0);
Gamma4 = (Z4 - Z0)./(Z4 + Z0);

% Plot both datasets on the same Smith chart


% Plot first dataset (e.g., blue)
s=smithplot(Gamma1,'LineStyle','-','Color','g','LineWidth',2)
hold on
s=smithplot(Gamma2,'LineStyle','-','Color','r','LineWidth',2)
hold on
s=smithplot(Gamma3,'LineStyle','-','Color','c','LineWidth',2)
hold on
s=smithplot(Gamma4,'LineStyle','-','Color','b','LineWidth',2)
hold off

legend('Eksperiment','SUZANA','4NEC2','Teorija')