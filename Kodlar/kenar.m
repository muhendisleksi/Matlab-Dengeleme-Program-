function kenar(path)
global num K1 K2 K Ken_olc DNken BNken n1 DY DX Sik0_ken...
    lik_ken aik_ken bik_ken A l s0_ken N n Qxx dx KSNKOORD...
    V mo mx ms Qll ml Qvv mv alf T q T_UYSM q_UYSM...
    DNGELOLCU P f cevap blnmynokta nokta_ad
[num,txt,all]=xlsread(path);
% KOORDINATLARI BILINEN NOKTALAR
kesinokta = num(:,1);                  
kesinokta = kesinokta(~isnan(kesinokta));
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
Ken_olc = num(:,7:10);
Ken_olc = Ken_olc(isfinite(Ken_olc(:,1)),:);
% DURULAN NOKTALAR
DNken = num(:,7);                         
DNken=DNken(~isnan(DNken));
% BAKILAN NOKTALAR
BNken = num(:,8);                         
BNken=BNken(~isnan(BNken));
% ÖLÇÜ SAYISI
n1 = length(DNken);
% KOORDÝNATLARI BÝLÝNMEYEN NOKTALAR
blnmynokta = num(:,4);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
% BÝLÝNMEYEN SAYISI
u = length(blnmynokta)*2;
% ALET KURULAN NOKTALAR
YON_BLNM = unique(num(:,7));
% SERBESTLÝK  DERECESÝ
f = n1-u;
if f==0 || f <0
    Message = sprintf('SERBESTLÝK DERECESÝ   %d\n DENGELEME YOK!!! ',0);
    errordlg(Message,...
        'Dikkat')
else
% KENARLARIN TABLO HALINDE YAZILMASI
for i = 1:length(DNken)
    DY(i,1) = [K(nokta_ad==BNken(i),2)-K(nokta_ad==DNken(i),2)];
    DX(i,1) = [K(nokta_ad==BNken(i),3)-K(nokta_ad==DNken(i),3)];
    Sik0_ken(i,1) = [sqrt((K(nokta_ad==BNken(i),2)-K(nokta_ad==DNken(i),2))^2+(K(nokta_ad==BNken(i),3)-K(nokta_ad==DNken(i),3))^2)];
end
kenarlar = num(:,9);
kenarlar = kenarlar(~isnan(kenarlar));
lik_ken = [kenarlar-Sik0_ken(:,1)]*1000;
for i = 1:length(DNken)
    aik_ken(i,1) = -[DX(i,1)/Sik0_ken(i,1)];
    bik_ken(i,1) = -[DY(i,1)/Sik0_ken(i,1)];
end
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
A = [Aken1];
% L OTELEME VEKTORUNUN OLUSTURULMASI
l = [lik_ken];
% P AGIRLIK MATRISININ OLUSTURULMASI  
s0_ken=num(1,11);
for i = 1:length(DNken)
    P_ken(i,1) = [(s0_ken^2)/(num(i,10)^2)];
end
P1 = [P_ken];
for i = 1:n1
    P(i,i) = [P1(i,1)];
end
% N NORMAL DENKLEMLER KATSAYILAR MATRÝSÝ
N=A'*P*A;
% nn SAÐ TARAF VEKTÖRÜ
n=A'*P*l;
% Qx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx=inv(N);
% x DENGELEME BILINMEYENLERI
dx=Qxx*n;
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
DNGELOLCU = Sik0_ken + V/10^4;
dzltmlr_ken = [V((length(V)-length(DNken)+1):length(V),1)];
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
T = f*(mo^2/s0_ken^2);
q = chi2inv(alf,f);
for i = 1:n1
 T_UYSM(i,1) = [abs(V(i,1))/(mo*sqrt(Qvv(i,i)))];
end
 q_UYSM = tinv(alf,f);
end
end
