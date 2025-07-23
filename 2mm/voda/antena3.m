
% Load impedanciju experiment
data1 = load('D900_V.txt');
                          
Z1 = data1(:, 7) + 1j * data1(:, 9);         

% Load imp. suzane
data2 = load('realsuzv.txt');
                      
data3 = load('imagsuz.txt');
freq3 = data2(:, 1);                         
Z2 = data2(:, 2) + 1j * data3(:, 2);          

data4 = load('realnec.txt');
                      
data5 = load('imagnec.txt');
freq5 = data4(:, 1);                          
Z3 = data4(:, 2) + 1j * data5(:, 2);  



% Referentna impedancija
Z0 = 50.0;

% refleksija coef
Gamma1 = (Z1 - Z0)./(Z1 + Z0);
Gamma2 = (Z2 - Z0)./(Z2 + Z0);
Gamma3 = (Z3 - Z0)./(Z3 + Z0);


% Smith chart



s=smithplot(Gamma1,'LineStyle','-','Color','g','LineWidth',2)
hold on
s=smithplot(Gamma2,'LineStyle','-','Color','r','LineWidth',2)
hold on
s=smithplot(Gamma3,'LineStyle','-','Color','c','LineWidth',2)

hold off

legend('Eksperiment','SUZANA','4NEC2')
