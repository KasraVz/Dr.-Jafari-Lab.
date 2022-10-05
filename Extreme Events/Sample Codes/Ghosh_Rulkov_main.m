clc;clear all;close all
rng('default')

% global N G1 G2 d gc

N=2;
degree=1;
d= .25;
gc = .01;

G1=connectivity_matrix(N,degree);
G2 = zeros(N);
A = G1;
for i = 1:N
    A(i,i)=0;
end
G2 = A;
% save G1 G1
% save G2 G2

x_init = rands(N,1);
y_init = rands(N,1);
z_init = zeros(N,1);
init=vertcat(x_init,y_init,z_init);

n = 1000000;
V(:,1) = init;

for i = 1:n
    V(:,i+1) = net4(init,N,G1,G2,d,gc);
    init = V(:,end);
end

X = V(1:N,:);
Y = V(N+1:2*N,:);
% Z = V(2*N+1:3*N,:);

p = 0.5;
sizi = size(X,2);
X1 = X(:,floor(sizi*p):end)';
Y1 = Y(:,floor(sizi*p):end)';
% Z1 = Z(:,floor(sizi*p):end)';
T = size(X1,1);
% +((Z1(:,2:end)-repmat(Z1(:,1),1,N-1)).^2)
E=(sum(sum(sqrt(((X1(:,2:end)-repmat(X1(:,1),1,N-1)).^2)+((Y1(:,2:end)-repmat(Y1(:,1),1,N-1)).^2))))/T)/(N-1); 

figure
plot(1:n+1,X)
xlim([90000 100000])
figure
plot(1:n+1,Y)
xlim([90000 100000])
% axis tight
%%
figure
subplot(311)
plot(1:n+1,X)
set(gca, 'FontSize',10, 'FontName','Arial')
xlabel('t', 'FontSize',14, 'FontName','Arial')
ylabel('x', 'FontSize',14, 'FontName','Arial')
title(['\epsilon = ',num2str(d), ', g_c = ',num2str(gc)], 'FontSize',14, 'FontName','Arial')
axis tight
subplot(312)
A = X(:,end-200:end);
imagesc(A')
set(gca, 'FontSize',10, 'FontName','Arial')
xlabel('No.', 'FontSize',14, 'FontName','Arial')
ylabel('t', 'FontSize',14, 'FontName','Arial')
subplot(313)
plot(1:N,X(:,end),'.')
set(gca, 'FontSize',10, 'FontName','Arial')
xlabel('No.', 'FontSize',14, 'FontName','Arial')
ylabel('t', 'FontSize',14, 'FontName','Arial')
