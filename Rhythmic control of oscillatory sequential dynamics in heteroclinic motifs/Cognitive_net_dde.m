% % % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% % %   Dr Jafari's Lab.
% % % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% % %   Module Name:    Cogniitive_net 
% % %   Author:         F. Nazarimehr, A. Ahmadi, K. Vaziri
% % %   Creation Date:  January 2022
% % %   Revision:       1.0
% % % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function dM = Cognitive_net_dde(t,M, Z)

% Defining 2 different delay for phi and psi
lagy = Z(:,1);
lagz = Z(:,2);

N = size(M,1)/3;
dM = zeros(size(M));

x = M(1 : N);
y = M(N+1 : 2*N);
z = M(2*N+1:3*N);

% Defining constant parameters

A = 0.16;           % This is the maximum amplitude for noise
sigma = [0.301 0.474 0.585 0.601 0.203 0.114];
omega = 0.35;

% Q = 0;            % In figure 1, uncomment this part.
Q = 7.81;

w = [1.177 1.177 1.177 0.333 0.333 0.333];
wo = 1;
a0 = 1;
b0 = 1.28;
eps = 24.78;
rho = [ 1     0    3.98    0     0    1.5   ;
       2.97   1     0     0.69   0     0    ;
        0    4.88   1      0    2.03   0    ;
       0.45   0    1.69    1     0    1.84  ;
       1.93   0     0     2.21   1     0    ;
        0    1.21   0      0    1.55   1    ];

% Defining the differential equation
dM(1 : N) = x.*(sigma' + A*randn(6, 1) + Q/(a0*eps).*(sin(y-z) - sin(lagy(2) - lagz(3)))- rho * x);
dM(N+1 : 2*N) = w' + (wo' / (b0^2)) .*x .*Q' .* sin(y -z) ;
dM(2*N+1 : 3*N) = omega;

end
