function GausDonusum(Xg,Yg,lam0)
global fi landa
R = 6373000;
ro = 180/pi;
a=6378137.0;
b=6356752.314;
c=a^2/b;
f=(a-b)/a;
n=a-b/a+b;
e=sqrt( (a^2)-(b^2) )/a ;
ee=sqrt( (a^2)-(b^2) )/b;
for i = 1:length(Xg)
yfi(i) = Xg(i)*ro/R;
end
alfa = 111136.536;
beta = -16107.035;
gama = 16.976;
q = -0.022;
for i = 1:length(yfi)
fi(i) = (Xg(i) - beta*sind(2*yfi(i)) - gama*sind(4*yfi(i)) - q*sind(6*yfi(i)))/alfa;
end

fifark = 1; sayac=0;
for i = 1:length(Xg)
    while fifark >= 10^-8
        fi0(i) = (Xg(i) - beta*sind(2*fi(i)) - gama*sind(4*fi(i)) - q*sind(6*fi(i)))/alfa;
        fifark(i) = fi0(i)-fi(i);
        fi(i) = fi0(i);
        sayac = sayac + 1;
    end
end
for i = 1:length(Xg)
Vf(i) = sqrt(1+ee^2*cosd(fi(i))^2);
Nf(i) = c/Vf(i);
tf(i) = tand(fi(i));
nf(i) = ee^2*cosd(fi(i))^2;
fi(i) = fi(i) - (ro*tf(i)/2)*(Yg(i)/Nf(i))^2 + (ro*tf(i)/23)*(5+3*tf(i)^3+6*nf(i)^2-6*nf(i)^2*tf(i)^2)*(Yg(i)/Nf(i))^4;
landa(i) = lam0 + (ro/cosd(fi(i)))*(Yg(i)/Nf(i)) - ((ro*(1+2*tf(i)^2+nf(i)^2))/(6*cosd(fi(i))) * (Yg(i)/Nf(i))^3) + ((ro*(5+28*tf(i)^2+24*tf(i)^4)/(120*cos(fi(i))) * (Yg(i)/Nf(i))^5));
c_Yaklasma_acisi(i) = (ro*tf(i))*(Yg(i)/Nf(i)) - (((ro*tf(i))*(1+tf(i)^2-nf(i)^2))/3)*(Yg(i)/Nf(i))^3;
end
end