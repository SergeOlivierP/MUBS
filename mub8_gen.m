
H=[1,1;1,-1];
H4=kron(kron(H,H),kron(H,H));
H8=kron(H4,H4);


D4=diag([1,-1i,1,-1i,-1i,-1,1i,1,-1i,1,1i,-1,1,1i,1,1i]);
V4=H4*D4;
M4=reshape(transpose(V4),1,16^2);
V8=H8*diag(M4);
U8=-V8/(trace(V8));

Moy=[];


for i=1:256
	Ba(:,:,i)=(U8)^i;
end;

