

Max=[];
for i=1:256
	U8B(:,:,i)=(U8)^i;
end;

for j=1:10000
	M=0;

	for k=1:256
		el=randi(256);
		P(:,:,k)=Ba(:,el,k)*Ba(:,el,k)';
		M=M+P(:,:,k);
	end;

Max(end+1)=max(eig(M));
end;


max(Max)
