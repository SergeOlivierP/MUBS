x=(1/(sqrt(2))).*[1,1;1,-1];
z=[1,0;0,1];
y=(1/(sqrt(2))).*[1,1;1i,-1i];

B1=base2s(z,z);
B2=base2s(x,y);
B3=base2s(y,x);
B4=base2b(z,x);

maxi=0;
mini=2;
En=[0];
for j1=1:4
	for j2=1:4
		for j3=1:4
			for j4=1:4

P=(1/4).*(B1(:,:,j1)+B2(:,:,j2)+B3(:,:,j3)+B4(:,:,j4));

en=0;

	for E = transpose(eig(P));
		en=en+E*log2(E);
	end;

	ent=-en;

		if ent > maxi
			maxi=ent;
		end;

		if ent < mini
			mini=ent;
		end;


En(end+1)=ent;
			end;	
		end;	
	end;	
end;

disp("entropie moyenne:"), disp(mean(En))
disp("variance:"),disp(var(En))
disp("max:"), disp(maxi)
disp("min:"), disp(mini)
disp("entropie max:"), disp(maxi)
disp("entropie min:"), disp(mini)
