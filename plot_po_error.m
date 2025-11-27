figure;
ex1 = logsout.getElement('ex1').Values;
ey1=logsout.getElement('ex2').Values;
ez1=logsout.getElement('ex3').Values;

subplot(3,1,1);
h1=plot(ex1.Time, ex1.Data,'-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
ylabel('$e_x$ (m)', 'Interpreter', 'latex');
grid on;


subplot(3,1,2);
h2=plot(ey1.Time, ey1.Data, '-', 'Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
ylabel('$e_y$ (m)', 'Interpreter', 'latex');
grid on;


subplot(3,1,3);
h3=plot(ez1.Time, ez1.Data, '-','Color', [90, 130, 180]/255, 'LineWidth', 1.5); hold on;
xlabel('Time (s)','Interpreter', 'latex');
ylabel('$e_z$ (m)', 'Interpreter', 'latex');
grid on;




