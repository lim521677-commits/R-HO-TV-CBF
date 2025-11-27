load('UAV_distance_data.mat');  

num_groups = length(UAV_distance_all);  
colors = [
90, 130, 180; 
130, 90, 60; 
185, 195, 165; 
140, 100, 160;
] / 255;  

figure;
for i = 1:num_groups
    % 
    data_i = UAV_distance_all{i};  
    t = data_i(:, 1);
    do3 = data_i(:, 4);
    do4 = data_i(:, 5);
    do5 = data_i(:, 6);
    c = colors(i, :);  

    %
    subplot(3, 1, 1);
    hold on;
    h1(i)=plot(t, do3, 'Color', c, 'DisplayName', sprintf('Group %d', i), 'LineWidth', 1.5);
    h2=yline(3.2, '--','Color',[190, 70, 70]/255 , 'LineWidth', 1);
    ylabel('$l_{QUAV-O_1}$ (m)', 'Interpreter', 'latex');
    grid on;
    
    % 
    subplot(3, 1, 2);
    hold on;
    plot(t, do4, 'Color', c, 'DisplayName', sprintf('Group %d', i), 'LineWidth', 1.5);
    yline(3.2, '--','Color',[190, 70, 70]/255 , 'LineWidth', 1);
    ylabel('$l_{QUAV-O_2}$ (m)', 'Interpreter', 'latex');
    grid on;
    
    % 
    subplot(3, 1, 3);
    hold on;
    plot(t, do5, 'Color', c, 'DisplayName', sprintf('Group %d', i), 'LineWidth', 1.5);
    yline(3.2, '--','Color',[190, 70, 70]/255 , 'LineWidth', 1);
    ylabel('$l_{QUAV-O_3}$ (m)', 'Interpreter', 'latex');
    xlabel('Time (s)','Interpreter', 'latex')
    grid on;
    
end

% 
subplot(3, 1, 2);
legend([h1(1),h1(4),h1(2),h1(3),h2], ...
       {'The Proposed Method (R-HO-TV-CBF)','Comparison Algorithm 1 (APF)', 'Comparison Algorithm 2 (R-HO-CBF)', 'Comparison Algorithm 3 (HO-TV-CBF)','Safe Distance Lower Limit'}, ...
       'Interpreter', 'latex','FontSize',10);


