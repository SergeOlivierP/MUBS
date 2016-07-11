

x=(1/(sqrt(2))).*[1,1;1,-1];
z=[1,0;0,1];
y=(1/(sqrt(2))).*[1,1;1i,-1i];

B1=base2s(z,z);
B2=base2s(x,y);
B3=base2s(y,x);
B4=base2b(z,x);
Max=[];


for j1=1:4
	for j2=1:4
		for j3=1:4
			for j4=1:4

M=B1(:,:,j1)+B2(:,:,j2)+B3(:,:,j3)+B4(:,:,j4);

Max(end+1)=max(eig(M));

			end;	
		end;	
	end;	
end;


max(Max)


