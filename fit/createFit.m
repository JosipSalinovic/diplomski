


%% Fitanje snage signala rfid taga u ovisnosti o udaljenosti 
[xData, yData] = prepareCurveData( x, y );

%  fittype i Frissova jedandžba
ft = fittype( 'a+20*log10(0.33/(4*pi*(2*x)))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = 0.85607411448389;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'y vs. x', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% osi
legend('exp. podaci','a+20*log10(0.33/(4*pi*(2*x)))')
xlabel( 'x / m', 'Interpreter', 'none' );
ylabel( 'P / dBm (decibel miliWat)', 'Interpreter', 'none' );
grid on


