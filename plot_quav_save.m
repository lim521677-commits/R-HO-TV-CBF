
clc; clear; close all;

% 
snapshot_time =110;  
line_styles = {'-', '-', '-'};
colors = [
90, 130, 180; 
130, 90, 60; 
185, 195, 165; 
140, 100, 160;
] / 255;  
morandi_orange=[210, 120, 60] / 255;
morandi_orange1=[252, 220, 180] / 255;
morandi_yellow=[220, 190, 70] / 255;
morandi_per=[140, 100, 160] / 255;
morandi_red = [190, 70, 70]/255;
morandi_red1 = [160, 50, 50]/255;
[sx, sy, sz] = sphere(20);  % 

% 
load('UAV_all_data.mat', 'UAV_data_all');
load('Obstacle_data_all.mat', 'OBS1_data_all', 'OBS2_data_all', 'OBS3_data_all','OBS4_data_all','OBS5_data_all','OBS6_data_all');
load('UAV_desired_all.mat', 'UAV_desired');

% 
group_id = 1;  

% 
figure; hold on; grid on; axis equal; view(3);
xlabel('$x$~(m)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('$y$~(m)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('$z$~(m)', 'Interpreter', 'latex', 'FontSize', 12);


%% 
for idx = 1:1
    data = UAV_data_all{idx};
    t = data(:,1);
    x = data(:,2);
    y = data(:,3);
    z = data(:,4);
    
    [~, k_snap] = min(abs(t - snapshot_time));  % 
    
    % 
    ls = line_styles{mod(idx-1, length(line_styles)) + 1};
    col = colors(idx, :);
    
    % 
    h1(idx)=plot3(x(1:k_snap), y(1:k_snap), z(1:k_snap), 'LineStyle', ls, 'Color', col, 'LineWidth', 1.5);
    
    % 
    if idx == 1
        h2 = plot3(x(1), y(1), z(1), 'x', 'MarkerSize', 10, 'LineWidth', 2, 'Color', 'k');
    else
        % 
        plot3(x(1), y(1), z(1), 'x', 'MarkerSize', 10, 'LineWidth', 2, 'Color', 'k', ...
              'HandleVisibility', 'off');
    end
    
% 
% 
uav_body = 0.3*[1.2  -0.6  -0.6;  
            0     0.4  -0.4;  
            0     0     0];   

% 
if k_snap > 1
     v = [x(k_snap) - x(k_snap-1);
          y(k_snap) - y(k_snap-1);
          z(k_snap) - z(k_snap-1)];
else
     v = [1; 0; 0];  
end

%
if norm(v) > 1e-6
     v_norm = v / norm(v);
else
     v_norm = [1; 0; 0];  
end

% 
default_dir = [1; 0; 0];
axis_rot = cross(default_dir, v_norm);

if norm(axis_rot) < 1e-6
    R = eye(3);  
else
    axis_rot = axis_rot / norm(axis_rot);
    angle_rot = acos(dot(default_dir, v_norm));
    K = [0 -axis_rot(3) axis_rot(2);
         axis_rot(3) 0 -axis_rot(1);
         -axis_rot(2) axis_rot(1) 0];
    R = eye(3) + sin(angle_rot)*K + (1-cos(angle_rot))*(K^2);  
end

% 
rotated_body = R * uav_body;
body_now = rotated_body + [x(k_snap); y(k_snap); z(k_snap)];

% 
h3 = fill3(body_now(1,:), body_now(2,:), body_now(3,:), col, 'FaceAlpha', 0.5);
set(get(get(h3,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

% 
[Xs, Ys, Zs] = sphere(30);   
Xs = Xs*0.5 + x(k_snap);
Ys = Ys*0.5 + y(k_snap);
Zs = Zs*0.5 + z(k_snap);

h_sphere = surf(Xs, Ys, Zs, ...
    'FaceColor', col, ...      
    'FaceAlpha', 0.1, ...      
    'EdgeColor', 'none');      
set(get(get(h_sphere,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

end

% 
OBS = {OBS1_data_all, OBS2_data_all, OBS3_data_all, OBS4_data_all, OBS5_data_all,OBS6_data_all};
dynamic_idx = []; 
static_idx = [];  

for obs_idx = 1:6
    data_all = OBS{obs_idx};
    if group_id > length(data_all)
        continue;
    end
    
    data = data_all{group_id};
    state = data(:,6);
    
    % 
    if any(state == 1)
        dynamic_idx(end+1) = obs_idx;
    else
        static_idx(end+1) = obs_idx;
    end
end

% 
for i = dynamic_idx
    data = OBS{i}{group_id};
    t = data(:,1);
    ox = data(:,2);
    oy = data(:,3);
    oz = data(:,4);
    r = data(:,5);
    state = data(:,6);
    [~, k_snap] = min(abs(t - snapshot_time));
    
    % 
    h4(i)=plot3(ox(k_snap), oy(k_snap), oz(k_snap), 'o', 'MarkerSize', 3, 'MarkerFaceColor', morandi_orange, 'MarkerEdgeColor', 'none');
    xs = ox(k_snap) + r(k_snap)*sx;
    ys = oy(k_snap) + r(k_snap)*sy;
    zs = oz(k_snap) + r(k_snap)*sz;
    h5(i)=surf(xs, ys, zs, 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'FaceColor', morandi_orange);
    h6(i)=plot3(ox, oy, oz, '-', 'Color', morandi_orange, 'LineWidth', 0.5);
end

% 
for si = 1:length(static_idx)
    i = static_idx(si);
    data = OBS{i}{group_id};
    t = data(:,1);
    ox = data(:,2);
    oy = data(:,3);
    oz = data(:,4);
    r = data(:,5);
    [~, k_snap] = min(abs(t - snapshot_time));
    
    if si == 1
        obs_col = [0.5 0.5 0.5]; 
    elseif si == 2
        obs_col = [0.5 0.5 0.5];
    else
        obs_col = [0.5 0.5 0.5];  
    end
    
    h7(si)=plot3(ox(1), oy(1), oz(1), 'o', 'MarkerSize', 3, 'MarkerFaceColor', obs_col, 'MarkerEdgeColor', 'none');
    xs = ox(1) + r(1)*sx;
    ys = oy(1) + r(1)*sy;
    zs = oz(1) + r(1)*sz;
    h8(si)=surf(xs, ys, zs, 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'FaceColor', obs_col);
end


data = UAV_desired;  
t = data(:,1);
xd = data(:,2);
yd = data(:,3);
zd = data(:,4);

% 
h9=plot3(xd, yd, zd,'--', 'Color',morandi_red , 'LineWidth', 1.5);




legend([h1(1),h1(4),h1(2),h1(3)], ...
       {'The Proposed Method (R-HO-TV-CBF)','Comparison Algorithm 1 (APF)', 'Comparison Algorithm 2 (R-HO-CBF)', 'Comparison Algorithm 3 (HO-TV-CBF)'}, ...
       'Interpreter', 'latex','FontSize',10)








