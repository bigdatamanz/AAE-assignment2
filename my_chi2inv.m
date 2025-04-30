function T = my_chi2inv(p, v)
% 自定义 chi2inv 函数
% p: 置信度，例如 1 - PFA
% v: 自由度（卫星数 - 4）

% 检查输入
if p <= 0 || p >= 1
    error('输入p必须在(0,1)之间');
end
if v <= 0
    error('自由度v必须是正数');
end

% 初始估计
T = v; % 初值设为自由度（经验上不错）

% 牛顿迭代法逼近
maxIter = 100;
tol = 1e-8;

for iter = 1:maxIter
    % 计算当前累积分布CDF
    cdf = gammainc(T/2, v/2);
    % 计算CDF的一阶导数（即PDF）
    pdf = (0.5^(v/2)) * (T^(v/2-1)) * exp(-T/2) / gamma(v/2);
    
    % 牛顿迭代更新
    T_new = T - (cdf - p) / pdf;
    
    % 保证T始终大于0
    if T_new <= 0
        T_new = T/2;
    end
    
    % 收敛判断
    if abs(T_new - T) < tol
        T = T_new;
        return;
    end
    
    T = T_new;
end

warning('my_chi2inv: did not converge within maximum iterations.');
end
