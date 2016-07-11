diary on

x=(1/(sqrt(2))).*[1,1;1,-1];
z=[1,0;0,1];
y=(1/(sqrt(2))).*[1,1;1i,-1i];

B1=base2s(z,z);
B2=base2s(x,y);
B3=base2s(y,x);
B4=base2b(z,x);
Moy1=[];
Moy2=[];

for j1=1:4
	for j2=1:4
		for j3=1:4
			for j4=1:4

M=B1(:,:,j1)+B2(:,:,j2)+B3(:,:,j3)+B4(:,:,j4);


E=sqrtm(inv(M));


PGM(:,:,1)=E*B1(:,:,j1)*E;
PGM(:,:,2)=E*B2(:,:,j2)*E;
PGM(:,:,3)=E*B3(:,:,j3)*E;
PGM(:,:,4)=E*B4(:,:,j4)*E;

	

prob=(1/4)*trace(PGM(:,:,1)'*B1(:,:,j1)+PGM(:,:,2)'*B2(:,:,j2)+PGM(:,:,3)'*B3(:,:,j3)+PGM(:,:,4)'*B4(:,:,j4));

Moy1(end+1)=abs(prob);



cvx_begin sdp quiet

variable X1(4,4) complex semidefinite
variable X2(4,4) complex semidefinite
variable X3(4,4) complex semidefinite
variable X4(4,4) complex semidefinite


eye(4)-(X1+X2+X3+X4) == hermitian_semidefinite(4)


maximize ((1/4)*trace(B1(:,:,j1)*X1+B2(:,:,j2)*X2+B3(:,:,j3)*X3+B4(:,:,j4)*X4))



cvx_end

Moy2(end+1)=abs(cvx_optval);


			end;	
		end;	
	end;	
end;

mean(Moy1)
var(Moy1)

mean(Moy2)
var(Moy2)

diary off
