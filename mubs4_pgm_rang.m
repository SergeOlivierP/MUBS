
H=[1,1;1,-1];
H4=kron(kron(H,H),kron(H,H));
D=1i.*diag([1,-1i,1,-1i,-1i,-1,1i,1,-1i,1,1i,-1,1,1i,1,1i]);
b=(1/4).*H4*D;

Moy=[];

for i=1:16
	B(:,:,i)=b^i;
end;


for j=1:1000

M=0;
A=zeros(16);	
	for k=1:16
		el=randi(16);
		P(:,:,k)=B(:,el,k)*B(:,el,k)';
		M=M+P(:,:,k);
		A(:,k)=B(:,el,k);
	end;

rho=(1/16).*M;
E=sqrtm(inv(M));

p=0;

	for k=1:16

		PGM(:,:,k)=E*P(:,:,k)*E;
		p=p+abs(trace(PGM(:,:,k)'*P(:,:,k)));

	end;

prob_PGM=p/16;
	if (rank(A)!=16)
		rang=rank(A)
		prob_PGM
	end;

Moy(end+1)=prob;

end;


disp("Prob moyenne:"), disp(mean(Moy))
disp("variance:"),disp(var(Moy))


