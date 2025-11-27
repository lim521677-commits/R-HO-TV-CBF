figure;
e1_phi =logsout.getElement('e1_phi').Values;
e1_theta=logsout.getElement('e1_theta').Values;
e1_psi=logsout.getElement('e1_psi').Values;


subplot(3,1,1);
h1=plot(e1_phi.Time, e1_phi.Data,'-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
ylabel('$e_{\phi}\ (\mathrm{rad})$', 'Interpreter', 'latex');
grid on;


subplot(3,1,2);
h2=plot(e1_theta.Time, e1_theta.Data, '-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
ylabel('$e_{\theta}\ (\mathrm{rad})$', 'Interpreter', 'latex');
grid on;


subplot(3,1,3);
h3=plot(e1_psi.Time, e1_psi.Data, '-','Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
xlabel('Time (s)','Interpreter', 'latex');
ylabel('$e_{\psi}\ (\mathrm{rad})$', 'Interpreter', 'latex');
grid on;