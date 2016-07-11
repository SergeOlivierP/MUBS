diary on

H=[1,1;1,-1];
H4=kron(kron(H,H),kron(H,H));
D=1i.*diag([1,-1i,1,-1i,-1i,-1,1i,1,-1i,1,1i,-1,1,1i,1,1i]);
b=(1/4).*H4*D;
Moy=[];


for i=1:16
	B(:,:,i)=b^i;
end;


for j=1:100

M=0;
	
	for k=1:16
		el=randi(16);
		P(:,:,k)=B(:,el,k)*B(:,el,k)';
		M=M+P(:,:,k);
	end;

rho=(1/16).*M;


E=sqrtm(inv(M));

p=0;

	for k=1:16

		PGM(:,:,k)=E*P(:,:,k)*E;
		p=p+abs(trace(PGM(:,:,k)'*P(:,:,k)));

	end;

prob=p/16;




cvx_begin sdp quiet

variable X1(16,16) complex semidefinite
variable X2(16,16) complex semidefinite
variable X3(16,16) complex semidefinite
variable X4(16,16) complex semidefinite
variable X5(16,16) complex semidefinite
variable X6(16,16) complex semidefinite
variable X7(16,16) complex semidefinite
variable X8(16,16) complex semidefinite
variable X9(16,16) complex semidefinite
variable X10(16,16) complex semidefinite
variable X11(16,16) complex semidefinite
variable X12(16,16) complex semidefinite
variable X13(16,16) complex semidefinite
variable X14(16,16) complex semidefinite
variable X15(16,16) complex semidefinite
variable X16(16,16) complex semidefinite

eye(16)-(X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16) == hermitian_semidefinite(16)


maximize ((1/16)*trace(P(:,:,1)*X1+P(:,:,2)*X2+P(:,:,3)*X3+P(:,:,4)*X4+P(:,:,5)*X5+P(:,:,6)*X6+P(:,:,7)*X7+P(:,:,8)*X8+P(:,:,9)*X9+P(:,:,10)*X10+P(:,:,11)*X11+P(:,:,12)*X12+P(:,:,13)*X13+P(:,:,14)*X14+P(:,:,15)*X15+P(:,:,16)*X16))



cvx_end


Moy(end+1)=abs(cvx_optval);

end;

mean(Moy)
var(Moy)

diary off
