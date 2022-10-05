clc; close all; clear all;
rng('default')


N = 200;    %Number of maps
iter = 500000;     %Number of iterations

% for c = linspace(0.00001,1 - 0.01, 10)

%Initial condition

init = c + 0.01 * rand(N, 1);
% save init init
% load init

out = zeros(N, iter + 1);
out(:, 1) = init;
r = 4;
epsilon = 0.4995;
trans = 300000;



for i = 1: iter
    out(:, i+1) = logistic(out(:,i), r) + epsilon * (mean(logistic(out(:, i), r)) - logistic(out(:, i), r));
end
% save out out
% load out

Y = out(:, 447885);
disp(length(unique(fix(  Y * 1e4)/1e4   )))

if (length(unique(fix(  Y * 1e4)/1e4    )))== 2 

    figure
    plot(1:N, Y, 'o');
    ylabel('x_{447885}(i)');    
    xlabel('i');

    figure;
    plot(447850:447900, out(Y>mean(Y), 447850:447900), 'r', LineWidth=1);
    ylabel('x_n(i)');
    xlabel('n');

    hold on;
    plot(447850:447900, out(Y<mean(Y), 447850:447900),'b', LineWidth=1);
end


% end


% N1 = length(Y(Y > mean(Y)));
% N2 = N - N1;
% p1 = N1/N;
% p2 = N2/N;
% 
% y1 = zeros(1, iter + 1);
% xn1 = Y(Y > mean(Y));
% y1(1) = xn1(1);
% 
% y2 = zeros(1, iter + 1);
% xn2 = Y(Y < mean(Y));
% y2(1) = xn2(1);
% 
% D = zeros(1, iter - trans);
% 
% for i = 1: iter
%     y1(i+1) = (1 - epsilon)*logistic(y1(i), r) + epsilon*p1*logistic(y1(i), r) + epsilon*p2*logistic(y2(i), r);
%     y2(i+1) = (1 - epsilon)*logistic(y2(i), r) + epsilon*p1*logistic(y1(i), r) + epsilon*p2*logistic(y2(i), r);
% end

% save y1 y1
% save y2 y2

% load y1
% load y2

% D(:) = norm(y1(trans:iter) - y2(trans:iter));
% figure;
% plot(D)



%% Function
% compare = @(n1,n2,n_dcp) round(n1*10^n_dcp)==round(n2*10^n_dcp);
% >> compare(1.23,1.236,2)