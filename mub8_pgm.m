%diary on
tic


for j=1:1000
M=0;
A=zeros(256);

	for k=1:256
		el=randi(256);
		P(:,:,k)=Ba(:,el,k)*Ba(:,el,k)';
		M=M+P(:,:,k);
		A(:,k)=Ba(:,el,k);
	end;

rho=(1/256).*M;
E=sqrtm(inv(M));

p=0;

	for k=1:256

		PGM(:,:,k)=E*P(:,:,k)*E;
		p=p+abs(trace(PGM(:,:,k)'*P(:,:,k)));
	end;

prob=p/256;

	if (rank(A)!=256)
		rang=rank(A)
		prob_PGM
	end;

Moy(end+1)=prob;


end;


disp("Prob moyenne:"), disp(mean(Moy))
disp("variance:"),disp(var(Moy))

toc

%diary off
