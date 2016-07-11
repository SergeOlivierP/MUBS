
H=[1,1;1,-1];
H4=kron(kron(H,H),kron(H,H));
D=1i.*diag([1,-1i,1,-1i,-1i,-1,1i,1,-1i,1,1i,-1,1,1i,1,1i]);
b=(1/4).*H4*D;

Moy=[];

for i=1:16
	B(:,:,i)=b^i;
end;


for j=1:100

M=0;
	
	for k=1:16
		el=randi(16);
		P(:,:,k)=B(:,el,k)*B(:,el,k)';
		M=M+P(:,:,k);
	end;

rho=(1/16).*M;
E=sqrtm(inv(M));

p=0;

	for k=1:16

		PGM(:,:,k)=E*P(:,:,k)*E;
		p=p+abs(trace(PGM(:,:,k)'*P(:,:,k)));

	end;

prob=p/16;

Moy(end+1)=prob;

end;


mean(Moy)
var(Moy)


