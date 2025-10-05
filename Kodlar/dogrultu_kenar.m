function dogrultu_kenar(path)
global knan num  K K1 K2 dog_olc DNdog BNdog n1 u f YON_BLNM dogrultular...
    blnmynokta tik0 Sik0_dog dgrltlr tik0ri Zort lik_dog aik_dog bik_dog A l  s0_dog...
    P N n Qxx dx KSNKOORD V DNGELOLCU mo mx ms ml Qll Qvv mv...
    alf T q T_UYSM q_UYSM Ny G ken_olc DNken BNken  DY DX Sik0_ken...
    lik_ken aik_ken bik_ken s0_ken ONCUL_KOH dog_n ken_n Kenarlar TDN TBN...
    cevap nokta_ad

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
ken_olc = num(:,7:10);
ken_olc = ken_olc(isfinite(ken_olc(:,1)),:);
dog_olc = num(:,11:14);
dog_olc = dog_olc(isfinite(dog_olc(:,1)),:);

% DURULAN NOKTALAR
DNken = num(:,7);                         
DNken=DNken(~isnan(DNken));
DNdog = num(:,11);                         
DNdog=DNdog(~isnan(DNdog));
% BAKILAN NOKTALAR
BNken = num(:,8);                         
BNken=BNken(~isnan(BNken));
BNdog = num(:,12);                         
BNdog=BNdog(~isnan(BNdog));
TDN = [DNdog(:,1);DNken(:,1)];
TBN = [BNdog(:,1);BNken(:,1)];
% ÖLÇÜ SAYISI
n1 = length(DNdog)+length(DNken);
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
    tik0ri{i} = mod([tik0{i}-dgrltlr{i}],400);
    Zort{i} = mean(tik0ri{i});
    lik_dog{i} = [Zort{i}-tik0ri{i}]*10000;
    aik_dog{i} = aik0_dog(DNdog==YON_BLNM(i),1);
    bik_dog{i} = bik0_dog(DNdog==YON_BLNM(i),1);
end
Denetim_Zort=cell2mat(Zort');
% KENARLARIN TABLO HALÝNDE YAZILMASI
for i = 1:length(DNken)
    DY(i,1) = [K(nokta_ad==BNken(i),2)-K(nokta_ad==DNken(i),2)];
    DX(i,1) = [K(nokta_ad==BNken(i),3)-K(nokta_ad==DNken(i),3)];
    Sik0_ken(i,1) = [sqrt((K(nokta_ad==BNken(i),2)-K(nokta_ad==DNken(i),2))^2+(K(nokta_ad==BNken(i),3)-K(nokta_ad==DNken(i),3))^2)];
end
Kenarlar = num(:,9);
Kenarlar = Kenarlar(~isnan(Kenarlar));
lik_ken = [Kenarlar-Sik0_ken(:,1)]*1000;
for i = 1:length(DNken)
    aik_ken(i,1) = -[DX(i,1)/Sik0_ken(i,1)];
    bik_ken(i,1) = -[DY(i,1)/Sik0_ken(i,1)];
end

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
dz=[Adog2'];
% KENARLARIN KATSAYILAR KISMI
for i = 1:length(DNken)
    for j = 1:(length(blnmynokta))
        if DNken(i) == blnmynokta(j)
            Aken1(i,2*j-1:2*j) = [aik_ken(i,1) bik_ken(i,1)];
        elseif BNken(i) == blnmynokta(j)
            Aken1(i,2*j-1:2*j) = [-aik_ken(i,1) -bik_ken(i,1)];
        else 
            Aken1(i,2*j-1:2*j) = [0 0];
        end
    end
end
% A KATSAYILAR MATRISININ OLUSTURULMASI
A = [Adog;Aken1];
% L OTELEME VEKTORUNUN OLUSTURULMASI
l = [cell2mat(lik_dog');lik_ken];
% P AGIRLIK MATRISININ OLUSTURULMASI
    s0_dog = num(1,15);
    s0_ken = num(1,15);
    ONCUL_KOH = [num(:,14);num(:,10)];
for i = 1:length(DNdog)
    P_dog(i,1) = [(s0_dog^2)/(num(i,14)^2)];
end
for i = 1:length(DNken)
    P_ken(i,1) = [(s0_ken^2)/(num(i,10)^2)];
end
P1 = [P_dog;P_ken];
for i = 1:n1
    P(i,i) = [P1(i,1)];
end

% N NORMAL DENKLEMLER KATSAYILAR MATRISI
N = A'*P*A;
% nn SAG TARAF VEKTORU
n = A'*P*l;
% Qx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx = inv(N);
% x DENGELEME BILINMEYENLERI
dx = Qxx*n;
% KESIN KOORDINAT DEGERLERI
for i = 1:length(blnmynokta)
    koord_kms{i} = [num(i,6);num(i,5)];
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
for i = 1:length(YON_BLNM)
    dzltmlr_dog{i} = V(DNdog==YON_BLNM(i),1);
end
dzltmlr_ken = [V((length(V)-length(DNken)+1):length(V),1)];
% DENGELI OLCULER
dog_n=length(DNdog);
ken_n=length(DNken);
dengken=Kenarlar+V(dog_n+1:n1,:)/10000;
dengdog=dogrultular + V(1:dog_n,:)/10000;
 DNGELOLCU=[dengdog;dengken];
% KARESEL ORTALAMA HATA
 mo=sqrt((V'*P*V)/(f));
 % BÝLÝNMEYENLERÝN ORTALAMA HATASI
 Qxx=inv(N);
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

else
    d = 3;
    % Nokta Verilerinin Tamamý
k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
k3 = num(:,3); k3 = k3(~isnan(k3));
K = [k1 k2 k3];
nokta_ad = [K(:,1)];
ken_olc = num(:,4:7);
ken_olc = ken_olc(isfinite(ken_olc(:,1)),:);
dog_olc = num(:,8:11);
dog_olc = dog_olc(isfinite(dog_olc(:,1)),:);
% AÐDAKÝ NOKTA SAYISI
[p p1] = size(K);
% DURULAN NOKTALAR
DNken = num(:,4);                         
DNken=DNken(~isnan(DNken));
DNdog = num(:,8);                         
DNdog=DNdog(~isnan(DNdog));
% BAKILAN NOKTALAR
BNken = num(:,5);                         
BNken=BNken(~isnan(BNken));
BNdog = num(:,9);                         
BNdog=BNdog(~isnan(BNdog));
dog_n=length(DNdog);
ken_n=length(DNken);
TDN = [DNdog(:,1);DNken(:,1)];
TBN = [BNdog(:,1);BNken(:,1)];
% ÖLÇÜ SAYISI
n1 = length(DNdog)+length(DNken);
% KOORDÝNATLARI BÝLÝNMEYEN NOKTALAR
blnmynokta = num(:,1);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
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
    Sik_dog(i,1) = [sqrt((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2)).^2+(K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3)).^2)];
    aik0_dog(i,1) = [(sin(tik(i,1)*(pi/200))/Sik_dog(i,1))*(2000/pi)];
    bik0_dog(i,1) = -[(cos(tik(i,1)*(pi/200))/Sik_dog(i,1))*(2000/pi)];
end
dogrultular = num(:,10);
dogrultular = dogrultular(~isnan(dogrultular));

for i = 1:length(YON_BLNM)
    tik0{i} = tik(DNdog==YON_BLNM(i),1);
    Sik0_dog{i} = Sik_dog(DNdog==YON_BLNM(i),1);
    dgrltlr{i} = dogrultular(DNdog==YON_BLNM(i),1);
    tik0ri{i} = mod([tik0{i}-dgrltlr{i}],400);
    Zort{i} = mean(tik0ri{i});
    lik_dog{i} = [Zort{i}-tik0ri{i}]*10000;
    aik_dog{i} = aik0_dog(DNdog==YON_BLNM(i),1);
    bik_dog{i} = bik0_dog(DNdog==YON_BLNM(i),1);
end
% KENARLARIN TABLO HALÝNDE YAZILMASI
for i = 1:length(DNken)
    DY(i,1) = [K(nokta_ad==BNken(i),2)-K(nokta_ad==DNken(i),2)];
    DX(i,1) = [K(nokta_ad==BNken(i),3)-K(nokta_ad==DNken(i),3)];
    Sik0_ken(i,1) = [sqrt((K(nokta_ad==BNken(i),2)-K(nokta_ad==DNken(i),2))^2+(K(nokta_ad==BNken(i),3)-K(nokta_ad==DNken(i),3))^2)];
end
Kenarlar = num(:,6);
Kenarlar = Kenarlar(~isnan(Kenarlar));
lik_ken = [Kenarlar-Sik0_ken(:,1)]*1000;
for i = 1:length(DNken)
    aik_ken(i,1) = -[DX(i,1)/Sik0_ken(i,1)];
    bik_ken(i,1) = -[DY(i,1)/Sik0_ken(i,1)];
end
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
dz=[Adog2'];
% KENARLARIN KATSAYILAR KISMI
for i = 1:length(DNken)
    for j = 1:(length(blnmynokta))
        if DNken(i) == blnmynokta(j)
            Aken1(i,2*j-1:2*j) = [aik_ken(i,1) bik_ken(i,1)];
        elseif BNken(i) == blnmynokta(j)
            Aken1(i,2*j-1:2*j) = [-aik_ken(i,1) -bik_ken(i,1)];
        else 
            Aken1(i,2*j-1:2*j) = [0 0];
        end
    end
end
% A KATSAYILAR MATRISININ OLUSTURULMASI
A = [Adog;Aken1];
% L OTELEME VEKTORUNUN OLUSTURULMASI
l = [cell2mat(lik_dog');lik_ken];
% P AGIRLIK MATRISININ OLUSTURULMASI
    s0_dog = num(1,12);
    s0_ken = num(1,12);  
for i = 1:length(DNdog)
    P_dog(i,1) = [(s0_dog^2)/(num(i,11)^2)];
end
for i = 1:length(DNken)
    P_ken(i,1) = [(s0_ken^2)/(num(i,7)^2)];
end
P1 = [P_dog;P_ken];
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
    G{i,1} = [1/sqrt(p) 0 -yii(i)
        0 1/sqrt(p) xii(i)];
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
    'Kontrol','custom',myicon);cevap = 0;
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
for i = 1:length(YON_BLNM)
    dzltmlr_dog{i} = V(DNdog==YON_BLNM(i),1);
end
dzltmlr_ken = [V((length(V)-length(DNken)+1):length(V),1)];
% DENGELI OLCULER
dengken=Kenarlar+V(dog_n+1:n1,:)/10000;
dengdog=dogrultular + V(1:dog_n,:)/10000;
 DNGELOLCU=[dengdog;dengken];
% KARESEL ORTALAMA HATA
 mo=sqrt((V'*P*V)/(f));
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