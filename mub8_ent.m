diary on
tic


H=[1,1;1,-1];
H4=kron(kron(H,H),kron(H,H));
H8=kron(H4,H4);


D4=diag([1,-1i,1,-1i,-1i,-1,1i,1,-1i,1,1i,-1,1,1i,1,1i]);
V4=H4*D4;
M4=reshape(transpose(V4),1,16^2);
V8=H8*diag(M4);
U8=-V8/(trace(V8));

maxi=0;
mini=8;

En=[];

for i=1:256
	B(:,:,i)=(U8)^i;
end;

for j=1:1000
M=0;
for k=1:256
el=randi(256);
	P(:,:,k)=B(:,el,k)*B(:,el,k)';
	M=M+P(:,:,k);
end;
rho=(1/256).*M;



en=0;

for E = transpose(eig(rho))
en = en+E*log2(E);
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

