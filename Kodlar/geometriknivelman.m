function geometriknivelman(path)
global num knan K1 K2 K Dz Dzltm_den denetim A  ...
    l N n P G Ny Qxx dx KSNYUKSEKLIK mo mx ms ...
    Qll ml Qvv mv dog_olc DNdog BNdog s0_dog HK ...
    T_UYSM q_UYSM V n1 alf T q cevap f nokta_ad

[num,txt,all]=xlsread(path);
knan = nansum(cell2mat(all(3,1)));
if knan ~= 0
    k1 = num(:,1); k1 = k1(~isnan(k1));
    k2 = num(:,2); k2 = k2(~isnan(k2));
    K1 = [k1 k2];
    k4 = num(:,4); k4 = k4(~isnan(k4));
    k5 = num(:,5); k5 = k5(~isnan(k5));
    k6 = num(:,13); k6 = k6(~isnan(k6));
    k8 = num(:,8); k8 = k8(~isnan(k8));
    K2 = [k4 k5];
    K = [K1;K2];
    nokta_ad = [K(:,1)];
    HK = num(:,10);
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
    % KESÝN  YÜKSEKLÝKLER
    ksnh = num(:,2);
    ksnh = ksnh(~isnan(ksnh));
    % YAKLAÞIK YÜKSEKLÝKELER
    yksh = num(:,5);
    yksh = yksh(~isnan(yksh));
    % BÝLÝNMEYEN YÜKSEKLÝKLER
    blnmynokta = num(:,4);                 
    blnmynokta = blnmynokta(~isnan(blnmynokta));
    % BÝLÝNMEYEN SAYISI
    u = length(blnmynokta);
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

 % L OTELEME VEKTORUNUN OLUSTURULMASI
for i = 1:length(DNdog)
    l(i,1) = -((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2) - (dog_olc(HK==HK(i),3))))*1000;
end
 % A KATSAYILAR MATRISININ OLUSTURULMASI
for i = 1:length(DNdog)
    for j = 1:(length(blnmynokta))
        if (DNdog(i) ~= blnmynokta(j)) & (BNdog(i) == blnmynokta(j))
            A(i,j) = [1];
        elseif (DNdog(i) == blnmynokta(j)) 
             A(i,j) = [-1];
        end
    end
end
% P AGIRLIK MATRISININ OLUSTURULMASI
s0_dog=num(1,8);
P= zeros(n1);
for i = 1:length(DNdog)
    P(i,i) = [(s0_dog)/(num(i,14))];
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
yk = num(:,4);
yk = yk(~isnan(yk));
yk = length(yk);
H_kms = zeros(yk,1);
for i = 1:yk
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
Dz=dog_olc(:,3)+V/10^3;
% DENGELÝ ÖLÇÜLERÝN DENETÝMÝ
Dzltm1 = [k1 k2];
Dzltm2 = [k4 KSNYUKSEKLIK];
Dzltm = [Dzltm1;Dzltm2];
for i = 1:length(DNdog)
Dzltm_den(i,1) = ((Dzltm(nokta_ad==BNdog(i),2)-Dzltm(nokta_ad==DNdog(i),2)));
end
denetim = Dz-Dzltm_den;
kontrl = sum(denetim);
% aa = numel(num2str(kontrl));
% if kontrl>=-10^-20 & kontrl<=10^-20
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
HK = num(:,7);
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
% ÖLÇÜ SAYISI
n1 = length(DNdog);
% YAKLAÞIK YÜKSEKLÝKELER
yksh = num(:,2);
yksh = yksh(~isnan(yksh));
% BÝLÝNMEYEN YÜKSEKLÝKLER
blnmynokta = num(:,1);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
% BÝLÝNMEYEN SAYISI
u = length(blnmynokta);
% SERBESTLÝK  DERECESÝ
  f = n1-u;
if f==0 || f <0
    Message = sprintf('SERBESTLÝK DERECESÝ   %d\n DENGELEME YOK!!! ',f);
    errordlg(Message,...
        'Dikkat');
else
% ALET KURULAN NOKTALAR
YON_BLNM = unique(num(:,8));
YON_BLNM = YON_BLNM(~isnan(YON_BLNM));
% HER NOKTADA YAPILAN GÖZLEM SAYILARI
GOZ_SAY = histc(DNdog,YON_BLNM(:,1));

 % L OTELEME VEKTORUNUN OLUSTURULMASI
for i = 1:length(DNdog)
    l(i,1) = -((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2) - (dog_olc(HK==HK(i),3))))*1000;
end
 % A KATSAYILAR MATRISININ OLUSTURULMASI
for i = 1:length(DNdog)
    for j = 1:(length(blnmynokta))
        if (DNdog(i) ~= blnmynokta(j)) & (BNdog(i) == blnmynokta(j))
            A(i,j) = [1];
        elseif (DNdog(i) == blnmynokta(j)) 
             A(i,j) = [-1];
        end
    end
end
% P AGIRLIK MATRISININ OLUSTURULMASI
s0_dog=num(1,5);
P= zeros(n1);
for i = 1:length(DNdog)
    P(i,i) = [(s0_dog)/(num(i,11))];
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
yk = num(:,2);
yk = yk(~isnan(yk));
yk = length(yk);
H_kms = zeros(yk,1);
for i = 1:yk
    H_kms(i)=[num(i,2)];
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
Dz=dog_olc(:,3)+V/10^3;
% DENGELÝ ÖLÇÜLERÝN DENETÝMÝ
Dzltm1 = [k1 KSNYUKSEKLIK];
Dzltm = Dzltm1;
for i = 1:length(DNdog)
Dzltm_den(i,1) = ((Dzltm(nokta_ad==BNdog(i),2)-Dzltm(nokta_ad==DNdog(i),2)));
end
denetim = Dz-Dzltm_den;
kontrl = sum(denetim);
% if -10^-20<=kontrl & kontrl>=10^-20
%         h=msgbox({'Dengeli Ölçülerin Denetimi'   'BAÞARILI!!!'},...
%     'Kontrol','custom',myicon);
% elseif errordlg({'Dengeli Ölçülerin Denetimi' ' HATALI!!!'},'Hata');
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
end