figure;
u = logsout.getElement('u').Values;
tao_phi=logsout.getElement('tao_phi').Values;
tao_theta=logsout.getElement('tao_theta').Values;
tao_psi=logsout.getElement('tao_psi').Values;


%% subplot 1: u
ax1 = subplot(4,1,1);
hold(ax1,'on');
plot(ax1, u.Time, u.Data, '-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5);
ylabel(ax1,'$u_p$ (N)','Interpreter','latex');
grid(ax1,'on');

% 
subplot(4,1,2);
h2=plot(tao_phi.Time, tao_phi.Data, '-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
ylabel('$u_{\phi}$ (N$\cdot$m)', 'Interpreter', 'latex');
grid on;


% 
subplot(4,1,3);
h3=plot(tao_theta.Time, tao_theta.Data, '-','Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
ylabel('$u_{\theta}$ (N$\cdot$m)', 'Interpreter', 'latex');
grid on;

% 
subplot(4,1,4);
h4=plot(tao_psi.Time, tao_psi.Data, '-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
ylabel('$u_{\psi}$ (N$\cdot$m)', 'Interpreter', 'latex');
xlabel('Time (s)','Interpreter', 'latex');
grid on;

