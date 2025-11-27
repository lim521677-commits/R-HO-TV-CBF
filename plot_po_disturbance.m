figure;
d1     = logsout.getElement('d1').Values;
d2  = logsout.getElement('d2').Values;
d3  = logsout.getElement('d3').Values;
d1_gu  = logsout.getElement('d1_gu').Values;
d2_gu  = logsout.getElement('d2_gu').Values;
d3_gu  = logsout.getElement('d3_gu').Values;



% 
subplot(3,1,1);
h1=plot(d1.Time, d1.Data,'-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
h2=plot(d1_gu.Time, d1_gu.Data, '--', 'Color', [190, 70, 70]/255,'LineWidth', 1.2);
ylabel('$d_x$ (m$\cdot$s$^{-2}$)', 'Interpreter', 'latex');
legend([h1,h2], ...
       {'$d_x$', '$\hat{d}_x$'}, ...
       'Interpreter', 'latex','FontSize',10);
grid on;

% 
subplot(3,1,2);
h3=plot(d2.Time, d2.Data,'-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
h4=plot(d2_gu.Time, d2_gu.Data, '--', 'Color', [190, 70, 70]/255,'LineWidth', 1.2);
ylabel('$d_y$ (m$\cdot$s$^{-2}$)', 'Interpreter', 'latex');
legend([h3,h4],{'$d_y$', '$\hat{d}_y$'}, 'Interpreter', 'latex','FontSize',10);
grid on;

% 
subplot(3,1,3);
h5=plot(d3.Time, d3.Data,'-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
h6=plot(d3_gu.Time, d3_gu.Data, '--', 'Color', [190, 70, 70]/255,'LineWidth', 1.2);
xlabel('Time (s)','Interpreter', 'latex');
ylabel('$d_z$ (m$\cdot$s$^{-2}$)', 'Interpreter', 'latex');
legend([h5,h6], ...
       {'$d_z$', '$\hat{d}_z$'}, ...
       'Interpreter', 'latex','FontSize',10);
grid on;










