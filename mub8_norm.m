
N=[];

for j=1:1000
M=0;
A=zeros(256);

	for k=1:256
		el=randi(256);
		P(:,:,k)=Ba(:,el,k);
		M=M+P(:,:,k);
		n=norm(M);
	end;
N(end+1)=n;

end;

Max=max(N)
Min=min(N)
moyenne=mean(N)
variance=var(N)
