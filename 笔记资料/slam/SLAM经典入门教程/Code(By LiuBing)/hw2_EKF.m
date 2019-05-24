
%-------------------------------------------------------------------------
% FILE: data.m
% AUTH: Liu Bing
% Created: 2009/07/16
% Problem: 1.结果中的kalman曲线的前段与答案相比不准确；（特别是figure2）
%          2.原模型图形绘制不准确，theta值计算正确，x值误差较大（扩大1.2被才能正常）
%-------------------------------------------------------------------------

clear all; clc;

N = 10;
t = [1:N];

%---------------------SIMULATE NOISY MEASUREMENT--------------------------
z = zeros(3,N);
z(1,:) = [0, 2, 4, 10, 11, 10, 10, 10, 9, 8];
z(2,:) = [0, 1, 3, 1, 5, 9, 12, 14, 16, 18];
z(3,:) = [0, 0.25, 0.65, 1.0, 1.05, 1.4, 1.8, 2.0, 2.3, 2.5];
deltaT = 1;     % time between samples
%-------------------------------------------------------------------------

%-------------- initialize some varibles ---------------------------------
L = 1;
vel = 3;
phi = 0.1;
delta_t = 1;
Q = zeros(3,3);
R = eye(3);
W = zeros(3,3);
J = eye(3);
V = eye(3);
I = eye(3);
xhat = [0;0;0];
p0 = ones(3,3);
%-------------------------------------------------------------------------


result(:,1) = xhat;  %第一个点存入结果数组


%------------ kalman计算第二个点的值 --------------------------------------
theta0 = xhat(3,1);
x_1 = xhat + delta_t*vel*[cos(theta0); sin(theta0); tan(phi)/L];
theta1 = x_1(3,1);
F1 = [1 0 -vel*sin(theta1); 0 1 vel*cos(theta1); 0 0 1];
p_1 = F1*p0*F1' + W*Q*W';
K = p_1*J'/(J*p_1*J' + V*R*V');
x1 = x_1 + K*(z(:,2)-x_1);
p1 = (I-K*J)*p_1;
result(:,2) = x1;
%-------------------------------------------------------------------------


%------------ kalman计算后面点的值 ---------------------------------------
for i=2:N-1
    theta1 = x1(3,1);
    x_1 = x1 + delta_t*vel*[cos(theta1); sin(theta1); tan(phi)/L];
    theta1 = x_1(3,1);
    F1 = [1 0 -vel*sin(theta1); 0 1 vel*cos(theta1); 0 0 1];
    p_1 = F1*p1*F1' + W*Q*W';
    K = p_1*J'/(J*p_1*J' + V*R*V');
    x1 = x_1 + K*(z(:,i+1)-x_1);
    P1 = (I-K*J)*p_1;
    result(:,i+1) = x1;
end
%-------------------------------------------------------------------------


%--------------- calculate the model value -------------------------------
m_theta = (t-1)*vel*tan(phi)/L;  % 原模型的theta值
m_x = L*sin(m_theta)/tan(phi) % 原模型的x值，x=L*sin(theta)/tan(phi)
m_y = (1-cos(m_theta))*L/tan(phi)  % 原模型的y值，y=L*(1-cos(theta))/tan(phi)


%-------------------------- plot figures ---------------------------------
% figure1
plot(m_x, m_y, '-b'); hold on;    
plot(z(1,:), z(2,:), '-r'); 
plot(result(1,:), result(2,:), '-g');
axis([0 20 0 20]);
xlabel('x [meters]');
ylabel('y [meters]');
legend('sys model', 'measured', 'filtered');
% figure2
figure(2);
plot(t-1, m_theta*180/pi, '-b'); hold on;
plot(t-1, z(3,:)*180/pi, '-r'); 
plot(t-1, result(3,:)*180/pi, '-g');
axis([0 9 0 180]);
xlabel('time');
ylabel('θ[degrees]');
legend('sys model', 'measured', 'filtered', 2);
%-------------------------------------------------------------------------








