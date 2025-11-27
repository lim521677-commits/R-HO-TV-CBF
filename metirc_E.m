% 
ex1 = logsout.getElement('ex1').Values;  % x方向误差
ey1 = logsout.getElement('ex2').Values;  % y方向误差
ez1 = logsout.getElement('ex3').Values;  % z方向误差

% 
t = ex1.Time;

% 
t_start = 1.41;  % 起始时间（秒）
t_end   = 12.41;  % 结束时间（秒）

% 
idx = t >= t_start & t <= t_end;

% 
ex_segment = ex1.Data(idx);
ey_segment = ey1.Data(idx);
ez_segment = ez1.Data(idx);

% 
rmse_x = sqrt(mean(ex_segment.^2));
rmse_y = sqrt(mean(ey_segment.^2));
rmse_z = sqrt(mean(ez_segment.^2));

disp(['RMSE_x: ', num2str(rmse_x)]);
disp(['RMSE_y: ', num2str(rmse_y)]);
disp(['RMSE_z: ', num2str(rmse_z)]);
