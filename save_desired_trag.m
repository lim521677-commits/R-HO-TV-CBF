% 
xd_signal = logsout.get('xd');
yd_signal = logsout.get('yd');
zd_signal = logsout.get('zd');

% 
t_data  = xd_signal.Values.Time;     
xd_data = xd_signal.Values.Data;
yd_data = yd_signal.Values.Data;
zd_data = zd_signal.Values.Data;

% 
UAV_desired = [t_data, xd_data, yd_data, zd_data];

% 
save('UAV_desired_all.mat', 'UAV_desired');

% 
fprintf('✅ save UAV_desired  length: %dx%d \n', ...
    size(UAV_desired,1), size(UAV_desired,2));

