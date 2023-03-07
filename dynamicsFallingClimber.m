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
h = 0:t:100; % height varies from 0 to 100 feet
d = (0:t/20:5)'; % distance from wall varies from 0 to 5 feet (column vector)

% Derived Constants
m = W/g; % mass
Ig = (1/12)*m*(3*r^2+a^2); % Moment of inertia
rg = sqrt(r^2+y^2); % distance from T to G

% Derived Variables
theta = atan(d./h); % angle
L = h./cos(theta); % length of rope

% Conservation of Energy
V2 = sqrt(4.*h.*g) % velocity at bottom of fall

% Principal of Linear Impulse and Momentum
V2t = V2.*sin(theta); % Velocity in the t-direction after impact

% Conservation of Angular Momentum
wp = ((m*r)/Ig).*sqrt(4.*h.*g) + m*rg*V2.*sin(theta).^2; % angular velocity in k direction after impact

% Sum of the forces in the t-direction
F = m*g.*cos(theta);

plot(theta, V2t)
hold on
grid on
title('Velocity vs. Theta')
xlabel('theta')
ylabel('Velocity (ft/s)')
%legend
hold off

figure

plot(theta, wp)
hold on
grid on
title('Angular Velocity vs. Theta')
xlabel('theta')
ylabel('Angular Velocity (rad/s)')
%legend
hold off

figure

plot(theta,F)
hold on
grid on
title('Tension Force vs. Theta')
xlabel('theta')
ylabel('Tension (lbmft/s^2)')
%legend
hold off

% Height vs Functions
plot(h, V2t)
hold on
grid on
title('Velocity vs. Height')
xlabel('height (feet)')
ylabel('Velocity (ft/s)')
%legend
hold off

figure

plot(h, wp)
hold on
grid on
title('Angular Velocity vs. Height')
xlabel('height (feet)')
ylabel('Angular Velocity (rad/s)')
%legend
hold off

figure

plot(h,F)
hold on
grid on
title('Tension Force vs. Height')
xlabel('Height')
ylabel('Tension (lbmft/s^2)')
%legend
hold off

% Distance from wall vs functions
plot(d, V2t)
hold on
grid on
title('Velocity vs. Distance from Wall')
xlabel('distance (feet)')
ylabel('Velocity (ft/s)')
%legend
hold off

figure

plot(h, wp)
hold on
grid on
title('Angular Velocity vs. Distance From Wall')
xlabel('distance (feet)')
ylabel('Angular Velocity (rad/s)')
%legend
hold off

figure

plot(h,F)
hold on
grid on
title('Tension Force vs. Distance From Wall')
xlabel('Distance (feet)')
ylabel('Tension (lbmft/s^2)')
%legend
hold off






