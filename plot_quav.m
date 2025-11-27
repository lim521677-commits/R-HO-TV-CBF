
morandi_red = [190, 70, 70]/255;
morandi_red1 = [160, 50, 50]/255;
morandi_blue = [90, 130, 180] / 255;
morandi_orange=[210, 120, 60] / 255;
morandi_orange1=[252, 220, 180] / 255;
morandi_yellow=[220, 190, 70] / 255;
morandi_per=[140, 100, 160] / 255;

%
T_total = 100;
K = length(x1);  
k_20 = round(100 / T_total * K);  

figure;
axis equal; 
grid on; 
view(3);
xlabel('$x$~(m)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('$y$~(m)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('$z$~(m)', 'Interpreter', 'latex', 'FontSize', 12);
hold on;


% 
[sx, sy, sz] = sphere(20);  

% 
[~, N_obs] = size(ox);
static_idx = find(is_dynamic(1,:) == 0);
for si = 1:length(static_idx)
        i = static_idx(si);
        if si == 1
        h11=plot3(ox(1,i), oy(1,i), oz(1,i), 'o', 'MarkerSize', 3, 'MarkerFaceColor', morandi_per,'MarkerEdgeColor', 'none');
        xs = ox(1,i) + r(1,i)*sx;
        ys = oy(1,i) + r(1,i)*sy;
        zs = oz(1,i) + r(1,i)*sz;
        surf(xs, ys, zs, 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'FaceColor', morandi_per);
        else
        plot3(ox(1,i), oy(1,i), oz(1,i), 'o', 'MarkerSize', 3,'MarkerFaceColor', morandi_yellow, 'MarkerEdgeColor', 'none');
        xs = ox(1,i) + r(1,i)*sx;
        ys = oy(1,i) + r(1,i)*sy;
        zs = oz(1,i) + r(1,i)*sz;
        surf(xs, ys, zs, 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'FaceColor', morandi_yellow);
        end
end

% 
for i = 1:N_obs
    if is_dynamic(1,i) == 1
        h15=plot3(ox(k_20,i), oy(k_20,i), oz(k_20,i), 'o', ...
                    'MarkerSize', 3, 'MarkerFaceColor', morandi_orange, 'MarkerEdgeColor', 'none');
        x_o = ox(k_20,i) + r(1,i)*sx;
        y_o = oy(k_20,i) + r(1,i)*sy;
        z_o = oz(k_20,i) + r(1,i)*sz;
        surf(x_o, y_o, z_o, ...
            'FaceAlpha', 0.3, ...
            'EdgeColor','none', ...
            'FaceColor', morandi_orange);
    end
    plot3(ox(:,i), oy(:,i), oz(:,i), ':', 'Color', morandi_red1, 'LineWidth', 1.2)
end

% 

plot3(xd, yd, zd, '--', 'Color', morandi_red, 'LineWidth', 1.5);


% 

plot3(x1(1:k_20), y1(1:k_20), z1(1:k_20), '-', 'Color', morandi_blue, 'LineWidth', 2);

% 
x_uav0 = x1(1);
y_uav0 = y1(1);
z_uav0 = z1(1);
plot3(x_uav0, y_uav0, z_uav0, 'kx', 'MarkerSize', 12, 'LineWidth', 2);


% 
uav_body = [ 1.2  -0.6  -0.6;
             0     0.4  -0.4;
             0     0     0];  

% 
body_now = uav_body + [x1(k_20); y1(k_20); z1(k_20)];
fill3(body_now(1,:), body_now(2,:), body_now(3,:), morandi_blue, 'FaceAlpha', 1);
set(get(get(h21,'Annotation'),'LegendInformation'),'IconDisplayStyle','off')









































%画出静态障碍物（无工作区）
% % 定义障碍物球心和半径
% obstacles = [
%     -5, -10, 6,  7.2;
%      9,   3, 11, 2
%      6, -7,13,2
% ];
% num_obs = size(obstacles, 1);
% 
% % 统一球面网格生成
% [theta, phi] = meshgrid(linspace(0, pi, 50), linspace(0, 2*pi, 50));
% 
% % 绘制多个球体
% for i = 1:num_obs
%     ox = obstacles(i, 1);
%     oy = obstacles(i, 2);
%     oz = obstacles(i, 3);
%     r  = obstacles(i, 4);
%     
%     % 球体坐标
%     x = ox + r * sin(theta) .* cos(phi);
%     y = oy + r * sin(theta) .* sin(phi);
%     z = oz + r * cos(theta);
%     
%     % 绘制球体
%     surf(x, y, z, ...
%         'FaceAlpha', 0.8, ...
%         'FaceColor', [0.2, 0.4, 0.8], ...
%         'EdgeColor', 'none');
% end
% 
% xlabel('X'); ylabel('Y'); zlabel('Z');
% title('轨迹与障碍物分布');
% view(3);






% QUAV0=[t,vxd,vyd,vzd,xd,yd,zd];
% QUAV1=[t,vx1,vy1,vz1,x1,y1,z1];
% QUAV2=[t,vx2,vy2,vz2,x2,y2,z2];
% QUAV3=[t,vx3,vy3,vz3,x3,y3,z3];

% 分别保存到不同的 .mat 文件
% save('QUAV0.mat', 'QUAV0');
% save('QUAV1.mat', 'QUAV1');
% save('QUAV2.mat', 'QUAV2');
% save('QUAV3.mat', 'QUAV3');
% 







grid on;
% axis square 