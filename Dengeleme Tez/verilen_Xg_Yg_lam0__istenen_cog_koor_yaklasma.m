clear
clc
Xg = 8404.180;
Yg = 342.246;
R = 6373000;
lam0 = 27;
ro = 180/pi;
datum = 'itrf';
if strcmp(datum,'grs80')
    a=6378137.0;
    b=6356752.314;
elseif strcmp(datum,'itrf')
    a=6378388.0;
    b=6356911.946;
elseif strcmp(datum,'basel')
    a=6377937.155;
    b=6356078.963;
    
end
c=a^2/b;
f=(a-b)/a;
n=a-b/a+b;
e=sqrt( (a^2)-(b^2) )/a ;
ee=sqrt( (a^2)-(b^2) )/b;
yfi = Xg*ro/R;
fprintf('~Fif= %1.8f\r\n',yfi);
alfa = 111136.536;
beta = -16107.035;
gama = 16.976;
q = -0.022;
fi = (Xg - beta*sind(2*yfi) - gama*sind(4*yfi) - q*sind(6*yfi))/alfa;
fprintf('Fif= %1.8f\r\n',fi);
fifark = 1; sayac=0;
while fifark >= 10^-8
    fi0 = (Xg - beta*sind(2*fi) - gama*sind(4*fi) - q*sind(6*fi))/alfa;
    fifark = fi0-fi;
    fi = fi0;
    sayac = sayac + 1
    fprintf('Fif=%.8f\n',fi);
end
Vf = sqrt(1+ee^2*cosd(fi)^2);
Nf = c/Vf;
tf = tand(fi);
nf = ee^2*cosd(fi)^2;
fi = fi - (ro*tf/2)*(Yg/Nf)^2 + (ro*tf/23)*(5+3*tf^3+6*nf^2-6*nf^2*tf^2)*(Yg/Nf)^4;
lamda = lam0 + (ro/cosd(fi))*(Yg/Nf) - ((ro*(1+2*tf^2+nf^2))/(6*cosd(fi)) * (Yg/Nf)^3) + ((ro*(5+28*tf^2+24*tf^4)/(120*cos(fi)) * (Yg/Nf)^5));
c_Yaklasma_acisi = (ro*tf)*(Yg/Nf) - (((ro*tf)*(1+tf^2-nf^2))/3)*(Yg/Nf)^3;
fprintf('Vf= %1.8f\r\n',Vf);
fprintf('Nf= %1.3f\r\n',Nf);
fprintf('tf= %1.9f\r\n',tf);
fprintf('nf= %1.9f\r\n',nf);
fprintf('fi= %1.8f\r\n',fi);
fprintf('lamda= %1.8f\r\n',lamda);
fprintf('c= %1.9f\r\n',c_Yaklasma_acisi);

