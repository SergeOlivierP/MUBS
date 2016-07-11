

H=[1,1;1,-1];
H4=kron(kron(H,H),kron(H,H));
D=1i.*diag([1,-1i,1,-1i,-1i,-1,1i,1,-1i,1,1i,-1,1,1i,1,1i]);
b=(1/4).*H4*D;

for i=1:16
	B(:,:,i)=b^i;
end;



for k=1:10000

base1=randi(16);
base2=randi(16);
elem1=randi(16);
elem2=randi(16);


prob=abs(B(:,elem1,base1)'*B(:,elem2,base2))^2;

if (base1==base2) && (elem1==elem2) && (prob != 1)
	disp("erreur 1")
	disp([base1,elem1,base2,elem2])
	elseif (base1==base2) && (elem1 != elem2) && (prob != 0)
	disp("erreur 2")
	disp([base1,elem1,base2,elem2])
	elseif (base1 != base2) && (prob != 1/16)
	disp("erreur 3")
	disp([base1,elem1,base2,elem2])
end;
end;
