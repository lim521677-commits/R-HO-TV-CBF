load('UAV_distance_data.mat');  

num_groups = length(UAV_distance_all);  

for i = 1:num_groups
    
    data_i = UAV_distance_all{i};  
    t = data_i(:, 1);
    do1 = data_i(:, 2);
    do2 = data_i(:, 3);
    do6 = data_i(:, 7);
    [minDist2, idx2] = min(do6);  
    timeAtMinDist2 = t(idx2);   

    fprintf('min distance: %.4f，time: %.4f s\n', minDist2, timeAtMinDist2);
   
end




