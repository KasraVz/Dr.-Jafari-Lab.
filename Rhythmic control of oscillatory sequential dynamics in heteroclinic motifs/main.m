% % % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% % %   Dr Jafari's Lab.
% % % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% % %   Module Name:    main 
% % %   Instructor:     Dr Sajad Jafari
% % %   Author:         F. Nazarimehr, A. Ahmadi, K. Vaziri
% % %   Creation Date:  January 2022
% % %   Revision:       1.0
% % % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

clear all; close all; clc

% Initial parameters and parameteres needed for solver

start_time = 0;
run_time = 500;
tspan = [0 run_time];
Er = 1e-5;

% Defining the delay value for phi and psi
lag = 24.78*ones(2, 1);
 
% Solving the equation
sol = dde23(@Cognitive_net_dde,lag, @history, tspan);

% Plotting time series for each A_i
figure
for i = 1:6
    subplot(6,1,i);
    plot(sol.x, sol.y(i, :));
%     ylim([0 6]);            % ylim was used to match the scale of the figures with the paper's figures
end

% Plotting State Space 
figure
plot3(sol.y(1,:), sol.y(2,:), sol.y(3,:))
figure
plot3(sol.y(4,:), sol.y(5,:), sol.y(6,:))
figure
plot3(sol.y(1,:), sol.y(2,:), sol.y(4,:))