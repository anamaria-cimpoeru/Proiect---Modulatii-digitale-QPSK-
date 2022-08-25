 %generator date cu probabilitate egala de 0 si 1
clear all; 
LDate = 16;  %lungimea sirului de date
PropD = 0; 
Fb=3;
Fd=Fb/3;
Fc=20;  %frecventa purtatoarei
Tc=1/Fc; %perioada
M=4;
Fes=20*Fc; %frecventa de esantionare
sincro=1;
tipsemnal=0;
if tipsemnal==1
x = (randsrc(LDate, 1)+1)/2; %date binare              
else 
x=[0 0, 0 1, 1 0, 1 1, 0 0, 0 1, 1 0, 1 1];
end
tx = ([PropD: PropD + LDate - 1] ./ Fd);
figure(1)
subplot(1,1,1), stem(tx, x, 'kx'),grid on,title('datele de intrare'); 

%convertor binar-zecimal(generare alfabet cu M=4)
for i=1:3:LDate
    %j=(i+2)/3;
   % x_dec(j)=4*x(i+1)+2*x(i+0)+1*x(i+0);
   x_dec = bin2dec(num2str(x));
end

tx3=[0:length(x_dec)-1];

fi=2*pi*x_dec/M;
if sincro==1
fi=[0, pi/2, 0, fi ];
end
I=cos(fi);
Q=sin(fi);

[o,ro]=cart2pol(I,Q);

%end

figure(2)
subplot(2,1,1), stem(I, Q), grid on,title('constelatia')
subplot(2,1,2), polar(o,ro,'*')