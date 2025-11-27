clear global UAV_distance_all

% 
do1_signal = logsout.get('do1');
do2_signal = logsout.get('do2');
do3_signal = logsout.get('do3');
do4_signal = logsout.get('do4');
do5_signal = logsout.get('do5');
do6_signal = logsout.get('do6');

% 
t_data  = do1_signal.Values.Time;     
do1_data = do1_signal.Values.Data;
do2_data = do2_signal.Values.Data;
do3_data = do3_signal.Values.Data;
do4_data = do4_signal.Values.Data;
do5_data = do5_signal.Values.Data;
do6_data = do6_signal.Values.Data;

% 
data_current = [t_data, do1_data, do2_data, do3_data, do4_data, do5_data, do6_data];

% 
global UAV_distance_all

% 
if isempty(UAV_distance_all)
    UAV_distance_all = {};
end

% 
UAV_distance_all{end+1} = data_current;

% 
save('UAV_distance_data.mat', 'UAV_distance_all');

% 
fprintf('✅ save: %d，distance: %dx%d \n', ...
    length(UAV_distance_all), size(data_current,1), size(data_current,2));
