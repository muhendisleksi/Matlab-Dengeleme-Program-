function GPSnivelman(path)
global K1 K2 d A P l N n Qxx  dx V yeni_N yeni_H...
    s0 mo mx number alf T q T_UYSM q_UYSM ...
    Qvv Qll ml mv u ms n1 blnmynlr cevap k1 k2 k3...
    f
[number,txt,all]=xlsread(path);
% Nokta Verilerinin Tamamý
k1 = number(:,1); k1 = k1(~isnan(k1));
k2 = number(:,2); k2 = k2(~isnan(k2));
k3 = number(:,3); k3 = k3(~isnan(k3));
k4 = number(:,4); k4 = k4(~isnan(k4));
k5 = number(:,5); k5 = k5(~isnan(k5));
k6 = number(:,6); k6 = k6(~isnan(k6));
k7= number(:,7); k7 = k7(~isnan(k7));
k8 = number(:,8); k8 = k8(~isnan(k8));
k9 = number(:,9); k9 = k9(~isnan(k9));
k10 = number(:,10); k10 = k10(~isnan(k10)); 
k11 = number(:,11); k11 = k11(~isnan(k11)); 
k12 = number(:,12); k12 = k12(~isnan(k12)); 
K1 = [k1 k2 k3 k4 k5 k6];
K2 = [k7 k8 k9];
polinom_derecesi = number(1,12);
grid_aralik = 5;
d = polinom_derecesi;
gr = grid_aralik/1000;
[m,n]=size(number);
% BÝLÝNMEYEN SAYISI
u = size(K2,1)*3;
f = m-u;
if f==0 || f <0
    Message = sprintf('SERBESTLÝK DERECESÝ   %d\n DENGELEME YOK!!! ',f);
    errordlg(Message,...
        'Dikkat');
end

x=(mean(number(:,2))-number(:,2))/1000;
y=(mean(number(:,3))-number(:,3))/1000;
l=[number(:,6)];
yx = number(:,7); yx = yx(~isnan(yx));
yy = number(:,8); yy = yy(~isnan(yy));
yh =  number(:,9); yh = yh(~isnan(yy));
if d==1;
A=[ones(m,1) x y];
n1 = 3;
else if d==2;
A=[ones(m,1) x y x.^2 x.*y y.^2];
n1 = 6;
else if d==3;
 A=[ones(m,1) x y x.^2 x.*y y.^2 x.^3 (x.^2).*y (y.^2).*x y.^3];
 n1 = 10;
else if  d==4
 A=[ones(m,1) x y x.^2 x.*y y.^2 x.^3 (x.^2).*y (y.^2).*x y.^3 ...
     x.^4 (x.^3).*y (x.^2).*(y.^2) (y.^3).*x y.^4];
 n1 = 15;
    else 
            errordlg('4. dereceden büyük polinomlar için yüzey hesaplanamaz')
    end
    end
    end
end
if d == 1
    blnmynlr = 1:3;
elseif d == 2
    blnmynlr = 1:6;
elseif d == 3
    blnmynlr = 1:10;
elseif d == 4
    blnmynlr = 1:15;
end
blnmynlr = blnmynlr';
% P AGIRLIK MATRISININ OLUSTURULMASI
s0 = number(1,13);
if sum(k11)==0 & sum(k10)==0
    Kll = eye(m);
else
for i = 1:m
    Kll(i,i) = [sqrt(k10(i)^2+k11(i)^2)];
end
end
Qll = Kll/s0^2 ;
if Kll== eye(m)
    P = eye(m);
else
    P = inv(Qll);    
end
% N NORMAL DENKLEMLER KATSAYILAR MATRISI
N=A'*P*A;
% nn SAG TARAF VEKTORU
n=A'*P*l;
% Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx=N^-1;
% x DENGELEME BILINMEYENLERI
dx=Qxx*n;
% DUZELTMELER
V = A*dx - l;
d1=A'*P*V;
d2=V'*P*V;
d3=-l'*P*V;
d4=l'*P*l-n'*dx;
myicon = imread('tik.png');
if  -0.000001<=d1 & 0.0000001>=d1... 
    &-0.000001<=d2-d3 & 0.000001>=d2-d3...
        & -0.000001<=d2-d4 & 0.000001>=d2-d4...
        & -0.000001<=d4-d3 & 0.000001>=d4-d3... 
    h=msgbox({'Düzeltme Matrisi Denetimi'   'BAÞARILI!!!'},...
    'Kontrol','custom',myicon); cevap = 0;
else
    soru = sprintf('Dikkat! Düzeltme Matrisi Denetimde Uyuþumsuzluk Var!');
    dikkat = questdlg(soru, ...
	'Devam Edilsin Mi?', ...
	'Evet','Hayýr','');
switch dikkat
    case 'Evet'
        cevap = 1;
    case 'Hayýr'
        cevap = 2;   
    case ''
        cevap = 0;
end
end


% Yeni Nokta Yüksekliði
yeni_nokx=(mean(number(:,2))-number(:,7))/1000;
yeni_noky=(mean(number(:,3))-number(:,8))/1000;
yeni_nokx = yeni_nokx(~isnan(yeni_nokx));
yeni_noky = yeni_noky(~isnan(yeni_noky));
[p r] = size(yeni_nokx);
YN = [ones(1,p) yeni_nokx yeni_noky];
yeni_N = YN*dx;
yeni_H = yh-yeni_N;
% KARESEL ORTALAMA HATA
 mo = sqrt((V'*P*V)/(m-n1));
 mokont = mo;
  if mokont > 5.001
    errordlg({'Sonsay varyans yönetmeliðe göre' '5 cm yi geçemez'},'Hata')
 end     
  % BÝLÝNMEYENLERÝN ORTALAMA HATASI
 mx=mo*sqrt(diag(Qxx));
% ÖLÇÜLERÝN ORTALAMA HATASI
 ms=mo./sqrt(diag(P));
% DENGELÝ ÖLÇÜLERÝN ORTALAMA HATASI
 Qll=A*Qxx*A';
 ml=mo*sqrt(diag(Qll));
% DÜZELTMELERÝN ORTALAMA HATASI
 Qvv=inv(P)-Qll;
 mv=mo*sqrt(diag(Qvv));
  % MATEMATIK MODEL TESTI
alf = 0.95 ;  % GUVEN ARALIGI
T = f*(mo^2/s0^2);
q = chi2inv(alf,f);
for i = 1:n1
 T_UYSM(i,1) = [abs(V(i,1))/(mo*sqrt(Qvv(i,i)))];
end
q_UYSM = tinv(alf,f);
