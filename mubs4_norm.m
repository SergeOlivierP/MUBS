
H=[1,1;1,-1];
H4=kron(kron(H,H),kron(H,H));
D=1i.*diag([1,-1i,1,-1i,-1i,-1,1i,1,-1i,1,1i,-1,1,1i,1,1i]);
b=(1/4).*H4*D;

N=[];

for i=1:16
	B(:,:,i)=b^i;
end;


for j=1:1000

M=0;
A=zeros(16);	
	for k=1:16
		el=randi(16);
		P(:,:,k)=B(:,el,k);
		M=M+P(:,:,k);
		n=norm(M);
	end;
N(end+1)=n;

end;

Max=max(N)
Min=min(N)
moyenne=mean(N)
variance=var(N)
