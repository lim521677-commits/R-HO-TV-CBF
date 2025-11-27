figure;
d4     = logsout.getElement('d4').Values;
d5  = logsout.getElement('d5').Values;
d6  = logsout.getElement('d6').Values;
d4_gu  = logsout.getElement('d4_gu').Values;
d5_gu  = logsout.getElement('d5_gu').Values;
d6_gu  = logsout.getElement('d6_gu').Values;



% 
subplot(3,1,1);
h1=plot(d4.Time, d4.Data,'-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
h2=plot(d4_gu.Time, d4_gu.Data, '--', 'Color', [190, 70, 70]/255,'LineWidth', 1.2);
ylabel('$d_{\phi}$ (rad$\cdot$s$^{-2}$)', 'Interpreter', 'latex');
legend([h1,h2],{'$d_{\phi}$', '$\hat{d}_{\phi}$'}, 'Interpreter', 'latex', 'FontSize',10);
grid on;

% 
subplot(3,1,2);
h3=plot(d5.Time, d5.Data,'-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
h4=plot(d5_gu.Time, d5_gu.Data, '--', 'Color', [190, 70, 70]/255,'LineWidth', 1.2);
ylabel('$d_{\theta}$ (rad$\cdot$s$^{-2}$)', 'Interpreter', 'latex');
legend([h3,h4],{'$d_{\theta}$', '$\hat{d}_{\theta}$'}, 'Interpreter', 'latex','FontSize',10);
grid on;

% 
subplot(3,1,3);
h5=plot(d6.Time, d6.Data,'-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
h6=plot(d6_gu.Time, d6_gu.Data, '--', 'Color', [190, 70, 70]/255,'LineWidth', 1.2);
xlabel('Time (s)','Interpreter', 'latex');
ylabel('$d_{\psi}$ (rad$\cdot$s$^{-2}$)', 'Interpreter', 'latex');
legend([h5,h6],{'$d_{\psi}$', '$\hat{d}_{\psi}$'}, 'Interpreter', 'latex','FontSize',10);
grid on;
