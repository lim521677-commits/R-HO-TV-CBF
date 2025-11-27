% 
load('UAV_all_data.mat', 'UAV_data_all');

% 
num_traj = length(UAV_data_all);
traj_length_all = zeros(num_traj, 1);

% 
for i = 1:num_traj
    data_i = UAV_data_all{i};  
    x = data_i(:,2);
    y = data_i(:,3);
    z = data_i(:,4);

    % 
    diff_xyz = diff([x, y, z]);
    segment_len = sqrt(sum(diff_xyz.^2, 2));
    
    % 
    traj_length_all(i) = sum(segment_len);
    
    % 
    fprintf('🚀 %.3f m\n', i, traj_length_all(i));
end