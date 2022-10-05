function dM = net4(M,N,G1,G2,d,gc)
% global N G1 G2 d gc
dM = zeros(size(M));
x=M(1:N,1);y=M(N+1:2*N,1);z=M(2*N+1:3*N,1);

a=4.1;
vs=-1.4;kk=50;tr=-1.4;

dc1 = d*G1*((a./(1+x.^2))+y);
dc2 = gc*(vs-x).*(G2*(1./(1+exp(-kk.*(x-tr)))));

dM(1:N,1)= (a./(1+x.^2))+y+dc1+dc2;
dM(N+1:2*N,1)= y-0.001.*(x+1.6);
end