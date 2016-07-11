diary on
tic

H=[1,1;1,-1];
H4=kron(kron(H,H),kron(H,H));
D=1i.*diag([1,-1i,1,-1i,-1i,-1,1i,1,-1i,1,1i,-1,1,1i,1,1i]);
b=(1/4).*H4*D;

En=[];
maxi=0;
mini=4;





for i=1:16
	B(:,:,i)=b^i;
end;





for j=1:10000
M=0;
for k=1:16
el=randi(16);
	P(:,:,k)=B(:,el,k)*B(:,el,k)';
	M=M+P(:,:,k);
end;
rho=(1/16).*M;



en=0;
transpose(eig(rho));
sum(transpose(eig(rho)));
	for E = transpose(eig(rho));
		en=en+E*log2(E);
	end;

	entr=-en;

		if entr > maxi
			maxi=entr;
		end;

		if entr < mini
			mini=entr;
		end;

En(end+1)=entr;

end;


disp("entropie moyenne:"), disp(mean(En))
disp("variance:"),disp(var(En))
disp("max:"), disp(maxi)
disp("min:"), disp(mini)

toc

diary off


