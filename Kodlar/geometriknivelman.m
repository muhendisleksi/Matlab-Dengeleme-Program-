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
    % �L�� SAYISI
    n1 = length(DNdog);
    % KES�N  Y�KSEKL�KLER
    ksnh = num(:,2);
    ksnh = ksnh(~isnan(ksnh));
    % YAKLA�IK Y�KSEKL�KELER
    yksh = num(:,5);
    yksh = yksh(~isnan(yksh));
    % B�L�NMEYEN Y�KSEKL�KLER
    blnmynokta = num(:,4);                 
    blnmynokta = blnmynokta(~isnan(blnmynokta));
    % B�L�NMEYEN SAYISI
    u = length(blnmynokta);
    % SERBESTL�K  DERECES�
     f = n1-u;
    if f==0 || f <0
        Message = sprintf('SERBESTL�K DERECES�   %d\n DENGELEME YOK!!! ',f);
        errordlg(Message,...
            'Dikkat');
    else
    % ALET KURULAN NOKTALAR
YON_BLNM = unique(num(:,11));
% HER NOKTADA YAPILAN G�ZLEM SAYILARI
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
% KESIN Y�kseklik DEGERLERI
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
    h=msgbox({'D�zeltme Matrisi Denetimi'   'BA�ARILI!!!'},...
    'Kontrol','custom',myicon); cevap = 0;
else
    soru = sprintf('Dikkat! D�zeltme Matrisi Denetimde Uyu�umsuzluk Var!');
    dikkat = questdlg(soru, ...
	'Devam Edilsin Mi?', ...
	'Evet','Hay�r','');
switch dikkat
    case 'Evet'
        cevap = 1;
    case 'Hay�r'
        cevap = 2;   
    case ''
        cevap = 0;
end
end

% DENGEL� �L��LER
Dz=dog_olc(:,3)+V/10^3;
% DENGEL� �L��LER�N DENET�M�
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
%         h=msgbox({'Dengeli �l��lerin Denetimi'   'BA�ARILI!!!'},...
%     'Kontrol','custom',myicon);
% else errordlg({'Dengeli �l��lerin Denetimi' ' HATALI!!!'},'Hata');
% end
% KARESEL ORTALAMA HATA
 mo=sqrt((V'*P*V)/(f));
% B�L�NMEYENLER�N ORTALAMA HATASI
 mx=mo*sqrt(diag(Qxx));
 % �L��LER�N ORTALAMA HATASI
 ms=mo./sqrt(diag(P));
% DENGEL� �L��LER�N ORTALAMA HATASI
 Qll=A*Qxx*A';
 ml=mo*sqrt(diag(Qll));
 % D�ZELTMELER�N ORTALAMA HATASI
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
    % Nokta Verilerinin Tamam�
k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
K = [k1 k2];
nokta_ad = [K(:,1)];
HK = num(:,7);
dog_olc = num(:,8:11);
dog_olc = dog_olc(isfinite(dog_olc(:,1)),:);
% A�DAK� NOKTA SAYISI
[p p1] = size(K);
% DURULAN NOKTALAR
DNdog = num(:,8);                         
DNdog=DNdog(~isnan(DNdog));
% BAKILAN NOKTALAR
BNdog = num(:,9);                         
BNdog=BNdog(~isnan(BNdog));
% �L�� SAYISI
n1 = length(DNdog);
% YAKLA�IK Y�KSEKL�KELER
yksh = num(:,2);
yksh = yksh(~isnan(yksh));
% B�L�NMEYEN Y�KSEKL�KLER
blnmynokta = num(:,1);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
% B�L�NMEYEN SAYISI
u = length(blnmynokta);
% SERBESTL�K  DERECES�
  f = n1-u;
if f==0 || f <0
    Message = sprintf('SERBESTL�K DERECES�   %d\n DENGELEME YOK!!! ',f);
    errordlg(Message,...
        'Dikkat');
else
% ALET KURULAN NOKTALAR
YON_BLNM = unique(num(:,8));
YON_BLNM = YON_BLNM(~isnan(YON_BLNM));
% HER NOKTADA YAPILAN G�ZLEM SAYILARI
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
% DATUM MATR�S�
for i=1:p
    G{i,1} = [1./sqrt(p)];
end
G = cell2mat(G);
GG = G*G';
%YEN� OLU�AN N NORMAL DENKLEMLER KATSAYILAR MATR�S�
Ny = (N+GG)^-1;
% Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx = Ny-GG;
% x DENGELEME BILINMEYENLERI
dx = Qxx*n;
% KESIN Y�kseklik DEGERLERI
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
    h=msgbox({'D�zeltme Matrisi Denetimi'   'BA�ARILI!!!'},...
    'Kontrol','custom',myicon); cevap = 0;
else
    soru = sprintf('Dikkat! D�zeltme Matrisi Denetimde Uyu�umsuzluk Var!');
    dikkat = questdlg(soru, ...
	'Devam Edilsin Mi?', ...
	'Evet','Hay�r','');
switch dikkat
    case 'Evet'
        cevap = 1;
    case 'Hay�r'
        cevap = 2;   
    case ''
        cevap = 0;
end
end
% DENGEL� �L��LER
Dz=dog_olc(:,3)+V/10^3;
% DENGEL� �L��LER�N DENET�M�
Dzltm1 = [k1 KSNYUKSEKLIK];
Dzltm = Dzltm1;
for i = 1:length(DNdog)
Dzltm_den(i,1) = ((Dzltm(nokta_ad==BNdog(i),2)-Dzltm(nokta_ad==DNdog(i),2)));
end
denetim = Dz-Dzltm_den;
kontrl = sum(denetim);
% if -10^-20<=kontrl & kontrl>=10^-20
%         h=msgbox({'Dengeli �l��lerin Denetimi'   'BA�ARILI!!!'},...
%     'Kontrol','custom',myicon);
% elseif errordlg({'Dengeli �l��lerin Denetimi' ' HATALI!!!'},'Hata');
% end
% KARESEL ORTALAMA HATA
 mo=sqrt((V'*P*V)/(f));
% B�L�NMEYENLER�N ORTALAMA HATASI
 mx=mo*sqrt(diag(Qxx));
 % �L��LER�N ORTALAMA HATASI
 ms=mo./sqrt(diag(P));
% DENGEL� �L��LER�N ORTALAMA HATASI
 Qll=A*Qxx*A';
 ml=mo*sqrt(diag(Qll));
 % D�ZELTMELER�N ORTALAMA HATASI
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