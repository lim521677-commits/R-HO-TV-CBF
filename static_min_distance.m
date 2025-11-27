load('UAV_distance_data.mat');  
num_groups = length(UAV_distance_all);  


for i = 1:num_groups
    % 
    data_i = UAV_distance_all{i};  
    t = data_i(:, 1);
    do3 = data_i(:, 4);
    do4 = data_i(:, 5);
    do5 = data_i(:, 6);
    
    [minDist5, idx5] = min(do5);  
    timeAtMinDist5 = t(idx5);   

    fprintf('min distance %.4f，time: %.4f s\n', minDist5, timeAtMinDist5);
    
    
end


