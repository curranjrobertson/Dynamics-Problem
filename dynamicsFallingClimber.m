% Curran Robertson
% A climber falls. Find velocity, angular velocity, and force of rope on
% climber at bottom of fall. Vary height and distance from wall. 
clear all;clc;close all

% Constants
a = 72; % Climber is 72 inches tall
r = 6; % Location of centroid is 6 inches from T
y = 3; % Location of T is 3 inches below centroid
g = 32.2; % acceleration due to gravity in ft/s^2
W = 190; % weight is 190 lbf

% Variables
t = 0.1; % step constant
h = (0:t:100); % height varies from 0 to 100 feet
d = (0:t/20:5); % distance from wall varies from 0 to 5 feet (column vector)

% Create meshgrid for h and d
[H,D] = meshgrid(h,d);

% Derived Constants
m = W/g; % mass
Ig = (1/12)*m*(3*r^2+a^2); % Moment of inertia of a cylinder
rg = sqrt(r^2+y^2); % distance from T to G

% Derived Variables
theta = atan(D./H); % angle
L = H./cos(theta); % length of rope

% Conservation of Energy
V2 = sqrt(4.*H.*g); % velocity at bottom of fall

% Principal of Linear Impulse and Momentum
V2t = V2.*sin(theta); % Velocity in the t-direction after impact

% Conservation of Angular Momentum
wp = ((m*r)/Ig).*sqrt(4.*H.*g) + m*rg.*V2t.*(sin(theta).^2); % angular velocity in k direction after impact

% Sum of the forces in the t-direction
F = m*g.*cos(theta) + m.*V2.^2./L

% Plot Functions vs. h and d
figure

mesh(H,D,V2t)
hold on
grid on
title('Velocity as a function of Height and Distance')
xlabel('Height (feet)')
ylabel('Distance (feet)')
zlabel('Velocity (ft/s)')
%legend
hold off

figure

mesh(H,D,wp)
hold on
grid on
title('Angular Velocity as a function of Height and Distance')
xlabel('Height (ft)')
ylabel('Distance (ft)')
zlabel('Angular Velocity (rad/s)')
%legend
hold off

figure

mesh(H,D,F)
hold on
grid on
title('Tension Force as a function of Height and Distance')
xlabel('Height (ft)')
ylabel('Distance (ft)')
zlabel('Tension Force (lbf)')
%legend
hold off
