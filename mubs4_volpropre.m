
H=[1,1;1,-1];
H4=kron(kron(H,H),kron(H,H));
D=1i.*diag([1,-1i,1,-1i,-1i,-1,1i,1,-1i,1,1i,-1,1,1i,1,1i]);
b=(1/4).*H4*D;


Max=[];


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

Max(end+1)=max(eig(M));


end;

max(Max)



