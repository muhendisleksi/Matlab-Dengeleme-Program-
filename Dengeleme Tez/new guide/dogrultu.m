function dogrultu(path)
global  knan num K K1 K2 dog_olc DNdog BNdog n1 u f YON_BLNM dogrultular...
    tik0 Sik0_dog dgrltlr tik0ri Zort lik_dog aik_dog bik_dog A l  s0_dog...
    P N n Qxx dx KSNKOORD V DNGELOLCU mo mx ms ml Qll Qvv mv...
    alf T q T_UYSM q_UYSM Ny G all blnmynokta cevap nokta_ad
[num,txt,all]=xlsread(path);
knan = nansum(cell2mat(all(3,1)));
if knan ~= 0
% Nokta Verilerinin Tamamý
k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
k3 = num(:,3); k3 = k3(~isnan(k3));
K1 = [k1 k2 k3];
k4 = num(:,4); k4 = k4(~isnan(k4));
k5 = num(:,5); k5 = k5(~isnan(k5));
k6 = num(:,6); k6 = k6(~isnan(k6));
K2 = [k4 k5 k6];
K = [K1;K2];
nokta_ad = [K(:,1)];
% Doðrultular
dog_olc = num(:,11:14);
dog_olc = dog_olc(isfinite(dog_olc(:,1)),:);
% DURULAN NOKTALAR
DNdog = num(:,11);                         
DNdog=DNdog(~isnan(DNdog));
% BAKILAN NOKTALAR
BNdog = num(:,12);                         
BNdog=BNdog(~isnan(BNdog));
% ÖLÇÜ SAYISI
n1 = length(DNdog);
% KOORDÝNATLARI BÝLÝNMEYEN NOKTALAR
blnmynokta = num(:,4);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
% BÝLÝNMEYEN SAYISI
u = length(blnmynokta)*2+length(unique(num(:,11)));
% SERBESTLÝK  DERECESÝ
f = n1-u;
if f==0 || f <0
    Message = sprintf('SERBESTLÝK DERECESÝ   %d\n DENGELEME YOK!!! ',f);
    errordlg(Message,...
        'Dikkat');
else
% ALET KURULAN NOKTALAR
YON_BLNM = unique(num(:,11));
% HER NOKTADA YAPILAN GÖZLEM SAYILARI
GOZ_SAY = histc(DNdog,YON_BLNM(:,1));
YON_BLNM = unique(num(:,11),'stable');
% DOÐRULTULARIN TABLO HALÝNDE YAZILMASI
for i = 1:length(DNdog)
    if (K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))>0 & (K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))>0
        tik(i,1) = (atan((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))/(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))))*(200/pi);
elseif (K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))>0 & (K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))<0
        tik(i,1) = (atan((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))/(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))))*(200/pi)+200;
    elseif (K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))<0 & (K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))<0
        tik(i,1) = (atan((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))/(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))))*(200/pi)+200;
    elseif (K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))<0 & (K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))>0
        tik(i,1) = (atan((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))/(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))))*(200/pi)+400;
    end
    Sik_dog(i,1) = [sqrt((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))^2+(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))^2)];
    aik0_dog(i,1) = [(sin(tik(i,1)*(pi/200))/Sik_dog(i,1))*(2000/pi)];
    bik0_dog(i,1) = -[(cos(tik(i,1)*(pi/200))/Sik_dog(i,1))*(2000/pi)];
end
dogrultular = num(:,13);
for i = 1:length(YON_BLNM)
    tik0{i} = tik(DNdog==YON_BLNM(i),1);
    Sik0_dog{i} = Sik_dog(DNdog==YON_BLNM(i),1);
    dgrltlr{i} = dogrultular(DNdog==YON_BLNM(i),1);
    tik0ri{i} = [tik0{i}-dgrltlr{i}];
    Zort{i} = mean(tik0ri{i});
    lik_dog{i} = [Zort{i}-tik0ri{i}]*10000;
    aik_dog{i} = aik0_dog(DNdog==YON_BLNM(i),1);
    bik_dog{i} = bik0_dog(DNdog==YON_BLNM(i),1);
end
Denetim_Zort=cell2mat(Zort');
% DOÐRULTULARIN KATSAYILAR MATRÝSÝNÝ OLUÞTURMA
for i = 1:length(DNdog)
    for j = 1:(length(blnmynokta))
        if DNdog(i) == blnmynokta(j)
            Adog1(i,2*j-1:2*j) = [aik0_dog(i,1) bik0_dog(i,1)];
        elseif BNdog(i) == blnmynokta(j)
            Adog1(i,2*j-1:2*j) = [-aik0_dog(i,1) -bik0_dog(i,1)];
        else 
            Adog1(i,2*j-1:2*j) = [0 0];
        end
    end
end
for i = 1:length(YON_BLNM)
    Adog2{i} = Adog1(DNdog==YON_BLNM(i),1:length(blnmynokta)*2);
    Adog2_sum{i} = sum(Adog2{i});
    Adog2_sum1{i} = Adog2_sum{i}/(-GOZ_SAY(i));
    A_dog{i} = [Adog2{i}]+[[Adog2_sum1{i}]'*ones(1,GOZ_SAY(i))]';
end
Adog = cell2mat(A_dog');
Adog2 = cell2mat(Adog2_sum1');
% A KATSAYILAR MATRISININ OLUSTURULMASI
A = [Adog];
dz=[Adog2];
% L OTELEME VEKTORUNUN OLUSTURULMASI
l = [cell2mat(lik_dog')];
% P AGIRLIK MATRISININ OLUSTURULMASI
  s0_dog = num(1,9);
for i = 1:length(DNdog)
    P_dog(i,1) = [(s0_dog^2)/(num(i,14)^2)];
end
P1 = [P_dog];
for i = 1:n1
    P(i,i) = [P1(i,1)];
end
% N NORMAL DENKLEMLER KATSAYILAR MATRISI
N = A'*P*A;
% nn SAG TARAF VEKTORU
n = A'*P*l;
% Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx = inv(N);
% x DENGELEME BILINMEYENLERI
dx = Qxx*n;
% KESIN KOORDINAT DEGERLERI
for i = 1:length(blnmynokta)
    koord_kms{i} = [num(i,5);num(i,6)];
end
KSNKOORD = cell2mat(koord_kms') + (dx/1000);
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
    'Kontrol','custom',myicon);
cevap = 0;
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

% DENGELÝ ÖLÇÜLER
DNGELOLCU = dogrultular + V/10000;
%DENGELI OLCULERIN DENETIMI
for i = 1:length(YON_BLNM)
    dzltmlr_dog{i} = V(DNdog==YON_BLNM(i),1);
end
% KARESEL ORTALAMA HATA
 mo=sqrt((V'*P*V)/(f));
 % BÝLÝNMEYENLERÝN ORTALAMA HATASI
 Qxx=inv(N);
 mx=mo*sqrt(diag(Qxx));
 %  ÖLÇÜLERÝN ORTALAMA HATASI
 ms=mo./sqrt(diag(P));
 % DENGELÝ ÖLÇÜLERÝN ORTALAMA HATASI
 Qll=A*Qxx*A';
 ml=mo*sqrt(diag(Qll));
% DÜZELTMELERÝN ORTALAMA HATASI
 Qvv=inv(P)-Qll;
 mv=mo*sqrt(diag(Qvv));
 % MATEMATIK MODEL TESTI
alf = 0.95 ;  % GUVEN ARALIGI
T = f*(mo^2/s0_dog^2);
q = chi2inv(alf,f);
for i = 1:n1
 T_UYSM(i,1) = [abs(V(i,1))/(mo*sqrt(Qvv(i,i)))];
end
 q_UYSM = tinv(alf,f);
end
 
else
d = 4;
 % Nokta Verilerinin Tamamý
k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
k3 = num(:,3); k3 = k3(~isnan(k3));
K = [k1 k2 k3];
nokta_ad = [K(:,1)];
% Doðrultular
dog_olc = num(:,8:11);
dog_olc = dog_olc(isfinite(dog_olc(:,1)),:);
% AÐDAKÝ NOKTA SAYISI
[p p1] = size(K);
% DURULAN NOKTALAR
DNdog = num(:,8);                         
DNdog=DNdog(~isnan(DNdog));
% BAKILAN NOKTALAR
BNdog = num(:,9);                         
BNdog=BNdog(~isnan(BNdog));
% KOORDÝNATLARI BÝLÝNMEYEN NOKTALAR
blnmynokta = num(:,1);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
% ÖLÇÜ SAYISI
n1 = length(DNdog);
% BÝLÝNMEYEN SAYISI
u = length(blnmynokta)*2+length(unique(DNdog));
% SERBESTLÝK  DERECESÝ
f = n1-u+d;
if f==0 || f <0
    Message = sprintf('SERBESTLÝK DERECESÝ   %d\n DENGELEME YOK!!! ',f);
    errordlg(Message,...
        'Dikkat');
else
% ALET KURULAN NOKTALAR
YON_BLNM = unique(DNdog);
% HER NOKTADA YAPILAN GÖZLEM SAYILARI
GOZ_SAY = histc(DNdog,YON_BLNM(:,1));
YON_BLNM = unique(DNdog,'stable');
% DOÐRULTULARIN TABLO HALÝNDE YAZILMASI
for i = 1:length(DNdog)
    if (K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))>0 & (K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))>0
        tik(i,1) = (atan((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))/(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))))*(200/pi);
elseif (K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))>0 & (K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))<0
        tik(i,1) = (atan((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))/(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))))*(200/pi)+200;
    elseif (K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))<0 & (K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))<0
        tik(i,1) = (atan((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))/(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))))*(200/pi)+200;
    elseif (K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))<0 & (K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))>0
        tik(i,1) = (atan((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))/(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))))*(200/pi)+400;
    end
    Sik_dog(i,1) = [sqrt((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))^2+(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3))^2)];
    aik0_dog(i,1) = [(sin(tik(i,1)*(pi/200))/Sik_dog(i,1))*(2000/pi)];
    bik0_dog(i,1) = -[(cos(tik(i,1)*(pi/200))/Sik_dog(i,1))*(2000/pi)];
end

dogrultular = num(:,10);
for i = 1:length(YON_BLNM)
    tik0{i} = tik(DNdog==YON_BLNM(i),1);
    Sik0_dog{i} = Sik_dog(DNdog==YON_BLNM(i),1);
    dgrltlr{i} = dogrultular(DNdog==YON_BLNM(i),1);
    tik0ri{i} = [tik0{i}-dgrltlr{i}];
    Zort{i} = mean(tik0ri{i});
    lik_dog{i} = [Zort{i}-tik0ri{i}]*10000;
    aik_dog{i} = aik0_dog(DNdog==YON_BLNM(i),1);
    bik_dog{i} = bik0_dog(DNdog==YON_BLNM(i),1);
end
Denetim_Zort=cell2mat(Zort');
% DO,ÐRULTULARIN KATSAYILAR MATRÝSÝNÝ OLUÞTURMA
for i = 1:length(DNdog)
    for j = 1:(length(blnmynokta))
        if DNdog(i) == blnmynokta(j)
            Adog1(i,2*j-1:2*j) = [aik0_dog(i,1) bik0_dog(i,1)];
        elseif BNdog(i) == blnmynokta(j)
            Adog1(i,2*j-1:2*j) = [-aik0_dog(i,1) -bik0_dog(i,1)];
        else 
            Adog1(i,2*j-1:2*j) = [0 0];
        end
    end
end
for i = 1:length(YON_BLNM)
    Adog2{i} = Adog1(DNdog==YON_BLNM(i),1:length(blnmynokta)*2);
    Adog2_sum{i} = sum(Adog2{i});
    Adog2_sum1{i} = Adog2_sum{i}/(-GOZ_SAY(i));
    A_dog{i} = [Adog2{i}]+[[Adog2_sum1{i}]'*ones(1,GOZ_SAY(i))]';
end
Adog = cell2mat(A_dog');
Adog2 = cell2mat(Adog2_sum1');
% A KATSAYILAR MATRISININ OLUSTURULMASI
A = [Adog];
dz=[Adog2];
% L OTELEME VEKTORUNUN OLUSTURULMASI
l = [cell2mat(lik_dog')];
% P AGIRLIK MATRISININ OLUSTURULMASI
  s0_dog = num(1,6);
  for i = 1:length(DNdog)
    P_dog(i,1) = [(s0_dog^2)/(num(i,11)^2)];
end
P1 = [P_dog];
for i = 1:n1
    P(i,i) = [P1(i,1)];
end
% N NORMAL DENKLEMLER KATSAYILAR MATRISI
N = A'*P*A;
% nn SAG TARAF VEKTORU
n = A'*P*l;
% DATUM MATRÝSÝ
xg = (sum(k3)/p);
yg = (sum(k2)/p);
xi = k3-xg;
yi = k2-yg;
for i = 1:p
c(i,1) = 1/sqrt(xi(i)^2+yi(i)^2);
xii(i,1) = c(i)*xi(i);
yii(i,1) = c(i)*yi(i);
end
for i=1:p
    G{i,1} = [1/sqrt(p) 0 -yii(i) xii(i)
        0 1/sqrt(p) xii(i) yii(i)];
end
G = cell2mat(G);
GG = G*G';
%YENÝ OLUÞAN N NORMAL DENKLEMLER KATSAYILAR MATRÝSÝ
Ny = (N+GG)^-1;
% Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx = Ny-GG;
% x DENGELEME BILINMEYENLERI
dx = Qxx*n;
% KESIN KOORDINAT DEGERLERI
for i = 1:length(blnmynokta)
    koord_kms{i} = [num(i,2);num(i,3)];
end
KSNKOORD = cell2mat(koord_kms') + (dx/1000);
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
    'Kontrol','custom',myicon);
cevap = 0;
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
% DENGELÝ ÖLÇÜLER
DNGELOLCU = dogrultular + V/10000;
%DENGELI OLCULERIN DENETIMI
for i = 1:length(YON_BLNM)
    dzltmlr_dog{i} = V(DNdog==YON_BLNM(i),1);
end
% KARESEL ORTALAMA HATA
 mo=sqrt((V'*P*V)/(f+d));
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
T = f*(mo^2/s0_dog^2);
q = chi2inv(alf,f);
for i = 1:n1
 T_UYSM(i,1) = [abs(V(i,1))/(mo*sqrt(Qvv(i,i)))];
end
 q_UYSM = tinv(alf,f);
end

end
end
 