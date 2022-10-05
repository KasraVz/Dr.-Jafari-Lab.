function dM = net4(M,N,G1,G2,d,gc)
% global N G1 G2 d gc
dM = zeros(size(M));
x=M(1:N,1);y=M(N+1:2*N,1);z=M(2*N+1:3*N,1);

epsilon = 0.4995;



dM(1:N,1)= (a./(1+x.^2))+y+dc1+dc2;
dM(N+1:2*N,1)= y-0.001.*(x+1.6);
end
