function triyuksekliknivelman(path)
global knan K1 K2 K dog_olc DNdog BNdog n1 YON_BLNM...
H00 KSS Hijj lii A l s0_dog P N n Qxx dx KSNYUKSEKLIK...
V Dz denetim mo mx ms Qll Qvv mv alf q T_UYSM q_UYSM...
G Ny T ml cevap nokta_ad  f

[num,txt,all]=xlsread(path);
knan = nansum(cell2mat(all(3,1)));
if knan ~= 0
% Nokta Verilerinin Tamamý
k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
K1 = [k1 k2];
k4 = num(:,4); k4 = k4(~isnan(k4));
k5 = num(:,5); k5 = k5(~isnan(k5));
K2 = [k4 k5];
K = [K1;K2];
nokta_ad = [K(:,1)];
dog_olc = num(:,7:13);
dog_olc = dog_olc(isfinite(dog_olc(:,1)),:);
% DURULAN NOKTALAR
DNdog = num(:,7);                         
DNdog=DNdog(~isnan(DNdog));
% BAKILAN NOKTALAR
BNdog = num(:,8);                         
BNdog=BNdog(~isnan(BNdog));
% KOORDÝNATLARI BÝLÝNMEYEN NOKTALAR
blnmynokta = num(:,4);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
% ÖLÇÜ SAYISI
n1 = length(DNdog);
% BÝLÝNMEYEN SAYISI
u = length(unique(num(:,7)));
f = n1-u;
if f==0 || f <0
    Message = sprintf('SERBESTLÝK DERECESÝ   %d\n DENGELEME YOK!!! ',f);
    errordlg(Message,...
        'Dikkat');
else
% ALET KURULAN NOKTALAR
YON_BLNM = unique(num(:,7));
% HER NOKTADA YAPILAN GÖZLEM SAYILARI
GOZ_SAY = histc(DNdog,YON_BLNM(:,1));
% ÖLÇÜLERÝN TABLO HALÝNDE YAZILMASI
KK = ((1-0.13)/(2*6370000));
Sij = dog_olc(:,7);
t = dog_olc(:,6);
ii = dog_olc(:,5);
Zij = dog_olc(:,3);
for i = 1:length(DNdog)
    H0(i,1) = [K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2)];
    KS(i,1) = [KK*Sij(i,1).^2];
    Hij(i,1) = (Sij(i)*cot(Zij(i)*pi/200)) + (ii(i)-t(i)) + KS(i);
    li(i,1) = -(H0(i)-Hij(i))*1000;
end
for i = 1:length(YON_BLNM)
    H00{i} = H0(DNdog==YON_BLNM(i),1);
    KSS{i} = KS(DNdog==YON_BLNM(i),1);
    Hijj{i} = Hij(DNdog==YON_BLNM(i),1);
    lii{i} = li(DNdog==YON_BLNM(i),1);
end
 % A KATSAYILAR MATRISININ OLUSTURULMASI
for i = 1:length(DNdog)
    for j = 1:(length(blnmynokta))
        if (BNdog(i) == blnmynokta(j))
            A(i,j) = [1];
        elseif (DNdog(i) == blnmynokta(j)) 
             A(i,j) = [-1];
        end
    end 
end
 % L OTELEME VEKTORUNUN OLUSTURULMASI
l = li;
% P AGIRLIK MATRISININ OLUSTURULMASI
s0_dog=num(1,15);
P= zeros(n1);
for i = 1:length(DNdog)
    P(i,i) = [(s0_dog^2)/(num(i,13)^2)];
end
% N NORMAL DENKLEMLER KATSAYILAR MATRISI
N = A'*P*A;
% nn SAG TARAF VEKTORU
n = A'*P*l;
% Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx = inv(N);
% x DENGELEME BILINMEYENLERI
dx = Qxx*n;
% KESIN Yükseklik DEGERLERI
hk=length(blnmynokta);
H_kms = zeros(hk,1);
for i = 1:length(blnmynokta)
    H_kms(i)=[num(i,5)];
end
KSNYUKSEKLIK = H_kms  + (dx/1000);
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

% DENGELÝ ÖLÇÜLER
Dz=Hij+V/10^3;
% DENGELÝ ÖLÇÜLERÝN DENETÝMÝ
Dzltm1 = [k1 k2];
Dzltm2 = [k4 KSNYUKSEKLIK];
Dzltm = [Dzltm1;Dzltm2];
for i = 1:length(DNdog)
Dzltm_den(i,1) = ((Dzltm(nokta_ad==BNdog(i),2)-Dzltm(nokta_ad==DNdog(i),2)));
end
denetim = Dz-Dzltm_den;
kontrl = sum(denetim);
% if -0.001<=kontrl & kontrl>=0.001;
%         h=msgbox({'Dengeli Ölçülerin Denetimi'   'BAÞARILI!!!'},...
%     'Kontrol','custom',myicon);
% else errordlg({'Dengeli Ölçülerin Denetimi' ' HATALI!!!'},'Hata');
% end
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

else
    d = 1;
    % Nokta Verilerinin Tamamý
k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
K = [k1 k2];
nokta_ad = [K(:,1)];
dog_olc = num(:,4:10);
dog_olc = dog_olc(isfinite(dog_olc(:,1)),:);
% AÐDAKÝ NOKTA SAYISI
[p p1] = size(K);
% DURULAN NOKTALAR
DNdog = num(:,4);                         
DNdog=DNdog(~isnan(DNdog));
% BAKILAN NOKTALAR
BNdog = num(:,5);                         
BNdog=BNdog(~isnan(BNdog));
% KOORDÝNATLARI BÝLÝNMEYEN NOKTALAR
blnmynokta = num(:,1);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
% ÖLÇÜ SAYISI
n1 = length(DNdog);
% BÝLÝNMEYEN SAYISI
u = length(unique(blnmynokta));
f = n1-u+d;
if f==0 || f <0
    Message = sprintf('SERBESTLÝK DERECESÝ   %d\n DENGELEME YOK!!! ',f);
    errordlg(Message,...
        'Dikkat');
else
% ALET KURULAN NOKTALAR
YON_BLNM = unique(num(:,4));
% HER NOKTADA YAPILAN GÖZLEM SAYILARI
GOZ_SAY = histc(DNdog,YON_BLNM(:,1));
% ÖLÇÜLERÝN TABLO HALÝNDE YAZILMASI
KK = ((1-0.13)/(2*6370000));
Sij = dog_olc(:,7);
t = dog_olc(:,6);
ii = dog_olc(:,5);
Zij = dog_olc(:,3);
for i = 1:length(DNdog)
    H0(i,1) = [K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2)];
    KS(i,1) = [KK*Sij(i,1).^2];
    Hij(i,1) = (Sij(i)*cot(Zij(i)*pi/200)) + (ii(i)-t(i)) + KS(i);
    li(i,1) = -(H0(i)-Hij(i))*1000;
end
for i = 1:length(YON_BLNM)
    H00{i} = H0(DNdog==YON_BLNM(i),1);
    KSS{i} = KS(DNdog==YON_BLNM(i),1);
    Hijj{i} = Hij(DNdog==YON_BLNM(i),1);
    lii{i} = li(DNdog==YON_BLNM(i),1);
end
% A KATSAYILAR MATRISININ OLUSTURULMASI
for i = 1:length(DNdog)
    for j = 1:(length(blnmynokta))
        if (BNdog(i) == blnmynokta(j))
            A(i,j) = [1];
        elseif (DNdog(i) == blnmynokta(j)) 
             A(i,j) = [-1];
        end
    end
end
 % L OTELEME VEKTORUNUN OLUSTURULMASI
l = li;
% P AGIRLIK MATRISININ OLUSTURULMASI
s0_dog=num(1,12);
P= zeros(n1);
for i = 1:length(DNdog)
    P(i,i) = [(s0_dog^2)/(num(i,10)^2)];
end
% N NORMAL DENKLEMLER KATSAYILAR MATRISI
N = A'*P*A;
% nn SAG TARAF VEKTORU
n = A'*P*l;
% DATUM MATRÝSÝ
for i=1:p
    G{i,1} = [1./sqrt(p)];
end
G = cell2mat(G);
GG = G*G';
%YENÝ OLUÞAN N NORMAL DENKLEMLER KATSAYILAR MATRÝSÝ
Ny = (N+GG)^-1;
% Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx = Ny-GG;
% x DENGELEME BILINMEYENLERI
dx = Qxx*n;
% KESIN Yükseklik DEGERLERI
hk=length(blnmynokta);
H_kms = zeros(hk,1);
for i = 1:length(blnmynokta)
    H_kms(i)=[num(i,4)];
end
KSNYUKSEKLIK = H_kms  + (dx/1000);
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

% DENGELÝ ÖLÇÜLER
Dz=Hij+V/10^3;
% DENGELÝ ÖLÇÜLERÝN DENETÝMÝ
Dzltm1 = [k1 KSNYUKSEKLIK];
Dzltm = [Dzltm1];
for i = 1:length(DNdog)
Dzltm_den(i,1) = ((Dzltm(nokta_ad==BNdog(i),2)-Dzltm(nokta_ad==DNdog(i),2)));
end
denetim = Dz-Dzltm_den;
kontrl = sum(denetim);
% if -0.001<=kontrl & kontrl>=0.001;
%         h=msgbox({'Dengeli Ölçülerin Denetimi'   'BAÞARILI!!!'},...
%     'Kontrol','custom',myicon);
% else errordlg({'Dengeli Ölçülerin Denetimi' ' HATALI!!!'},'Hata');
% end
% KARESEL ORTALAMA HATA
 mo=sqrt((V'*P*V)/(f+d));
% BÝLÝNMEYENLERÝN ORTALAMA HATASI
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
end