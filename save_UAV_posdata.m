clear global UAV_data_all

% 
x1_signal = logsout.get('x1');
y1_signal = logsout.get('y1');
z1_signal = logsout.get('z1');

% 
t_data  = x1_signal.Values.Time;     
x1_data = x1_signal.Values.Data;
y1_data = y1_signal.Values.Data;
z1_data = z1_signal.Values.Data;

% 
data_current = [t_data, x1_data, y1_data, z1_data];

% 
global UAV_data_all

% 
if isempty(UAV_data_all)
    UAV_data_all = {};
end

% 
UAV_data_all{end+1} = data_current;

% 
save('UAV_all_data.mat', 'UAV_data_all');

% 
fprintf('✅ save: %d，length: %dx%d \n', ...
    length(UAV_data_all), size(data_current,1), size(data_current,2));
