function gen = base2s(b1,b2)
	k=1;
	for i=1:2
	for j=1:2

		B(:,:,k)=kron(kron(b1(:,i),b2(:,j)),kron(b1(:,i),b2(:,j))');
		k=k+1;
	end; end;

gen=B;

