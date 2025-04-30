function skymask()
% GNSS天空遮挡掩膜可视化（基于skymask_A1_urban.csv）
% 白色区域为可见区域，灰色区域为不可见区域。

% 加载遮挡掩膜数据
data = readmatrix('C:\Users\u\Downloads\AAE6102_Assignment2-main\Q2\skymask_A1_urban.csv');
% === GNSS Skyplot 可视化（0°在上，顺时针递增） ===

% Step 1: 读取数据
%data = readmatrix('skymask_A1_urban.csv');
az_mask = data(:,1);
el_mask = data(:,2);

% 确保 0~360 连续
if az_mask(end) ~= 360
    az_mask = [az_mask; 360];
    el_mask = [el_mask; el_mask(1)];
end

% 插值成每度一个
az_full = 0:359;
el_full = interp1(az_mask, el_mask, az_full, 'linear');

% Step 2: 网格生成与可见性判断
[AZ, EL] = meshgrid(az_full, 0:1:90);
visibility = EL >= repmat(el_full, size(EL,1), 1);

% 极坐标转直角坐标 —— ✅ 核心修正：顺时针 + 0°在顶部
theta = deg2rad(-(AZ - 90));  % ✅ 修正后的角度映射
r = 90 - EL;
[X, Y] = pol2cart(theta, r);

% Step 3: 开始绘图
figure; 
hold on; axis equal;
set(gca, 'XColor', 'none', 'YColor', 'none');
xlim([-95 95]); ylim([-95 95]);

% 白色背景圆
rectangle('Position', [-90, -90, 180, 180], 'Curvature', [1 1], 'FaceColor', 'w');

% 遮挡区域（灰色 patch）
for az = 1:360
    for el = 1:90
        if visibility(el, az) == 0
            X_patch = [X(el,az), X(el,mod(az,360)+1), X(el+1,mod(az,360)+1), X(el+1,az)];
            Y_patch = [Y(el,az), Y(el,mod(az,360)+1), Y(el+1,mod(az,360)+1), Y(el+1,az)];
            patch(X_patch, Y_patch, [0.7 0.7 0.7], 'EdgeColor', 'none');
        end
    end
end

% Step 4: 绘制仰角圈（每15°）
for elevation = 15:15:75
    rectangle('Position', [-elevation, -elevation, 2*elevation, 2*elevation], ...
              'Curvature', [1 1], 'LineStyle', ':', 'EdgeColor', [0.5 0.5 0.5]);
    text(0, elevation, [num2str(90 - elevation), '°'], ...
         'HorizontalAlignment','center','VerticalAlignment','bottom','BackgroundColor','w');
end

% 方位角线 & 标注（顺时针）
for az = 0:30:330
    [x_line, y_line] = pol2cart(deg2rad(-(az - 90)), [0, 90]);  % 同步顺时针
    plot(x_line, y_line, ':', 'Color', [0.5 0.5 0.5]);

    [x_txt, y_txt] = pol2cart(deg2rad(-(az - 90)), 95);
    switch az
        case 0
            label = '0° (N)';
        case 90
            label = '90° (E)';
        case 180
            label = '180° (S)';
        case 270
            label = '270° (W)';
        otherwise
            label = [num2str(az), '°'];
    end
    text(x_txt, y_txt, label, 'HorizontalAlignment','center', 'VerticalAlignment','middle');
end

title('skymask');
hold off;
