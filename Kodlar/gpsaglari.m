function gpsaglari (path)
global knan K1 K2 K dog_olc DNdog BNdog n1 YON_BLNM...
    l A s0 P N n Qxx dx x V Vzz Dz mo mx ms ml mv Qll Qvv ...
    alf T q T_UYSM q_UYSM G Ny k1 k5 Kor blnmynNo DXYZ ...
    dog_n olculer DNdog1 BNdog1 nokta_ad cevap f KSNKOORD...
    
[num,txt,all]=xlsread(path);
knan = nansum(cell2mat(all(3,1)));
if knan ~= 0
% Nokta Verilerinin Tamamý
k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
k3 = num(:,3); k3 = k3(~isnan(k3));
k4 = num(:,4); k4 = k4(~isnan(k4));
K1 = [k2 k3 k4];
k5 = num(:,5); k5 = k5(~isnan(k5));
k6 = num(:,6); k6 = k6(~isnan(k6));
k7 = num(:,7); k7 = k7(~isnan(k7));
k8 = num(:,8); k8 = k8(~isnan(k8));
K2 = [k6 k7 k8];
k18 = num(:,18); k18 = k18(~isnan(k18));
k19 = num(:,19); k19 = k19(~isnan(k19));
k20 = num(:,20); k20 = k20(~isnan(k20));
K3 = [ k18 k19 k20];
K = [K1;K2];
nokta_ad = [k1;k5];
blnmyn_ones = ones(length(K),1); %%
blnmynNo = kron(k5,blnmyn_ones); %%

dog_olc = num(:,10:17);
dog_olc = dog_olc(isfinite(dog_olc(:,1)),:);
Kor = num(:,18:20);
Kor = Kor(isfinite(Kor(:,1)),:); %%
DXYZ = num(:,15:17); %%
% DURULAN NOKTALAR
DNdog = num(:,10);                         
DNdog=DNdog(~isnan(DNdog));
DNdog1= kron(DNdog,blnmyn_ones);
% BAKILAN NOKTALAR
BNdog = num(:,11);                         
BNdog=BNdog(~isnan(BNdog));
BNdog1= kron(BNdog,blnmyn_ones);

% KOORDÝNATLARI BÝLÝNMEYEN NOKTALAR
blnmynokta = num(:,5);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
%KOORDÝNATLARI KESÝN NOKTALAR
ksnkoor = num(:,2:4);
ksnkoor = ksnkoor(~isnan(ksnkoor));
% ÖLÇÜ SAYISI
n1 = length(DNdog)*3;
% BÝLÝNMEYEN SAYISI
u = length(blnmynokta)*3;
f = n1-u;
if f==0 || f <0
    Message = sprintf('SERBESTLÝK DERECESÝ   %d\n DENGELEME YOK!!! ',f);
    errordlg(Message,...
        'Dikkat');
else
% ALET KURULAN NOKTALAR
YON_BLNM = unique(num(:,10));
% HER NOKTADA YAPILAN GÖZLEM SAYILARI
GOZ_SAY = histc(DNdog,YON_BLNM(:,1));
 % L OTELEME VEKTORUNUN OLUSTURULMASI
for i = 1:length(DNdog)
    l1{i,1} = -((K(nokta_ad==BNdog(i),1)-K(nokta_ad==DNdog(i),1) - (dog_olc(nokta_ad==nokta_ad(i),3))))*100;
    l2{i,1} = -((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2) - (dog_olc(nokta_ad==nokta_ad(i),4))))*100;
    l3{i,1} = -((K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3) - (dog_olc(nokta_ad==nokta_ad(i),5))))*100;   
end
l1 =cell2mat(l1);l2 =cell2mat(l2);l3 =cell2mat(l3);
for i = 1:length(l1)
    l{i,1} = [l1(i);l2(i);l3(i)];
end
l =cell2mat(l);
 % A KATSAYILAR MATRISININ OLUSTURULMASI
E1 = zeros(3,3);
E2 = eye(3,3);
E3 = -E2;
for i = 1:length(DNdog)
    for j = 1:(length(blnmynokta))
        if DNdog(i) == ksnkoor(j) 
            s = find(DNdog(i) == ksnkoor);
            A1{i,s} = E1;
        elseif DNdog(i) == blnmynokta(j)
            s = find(DNdog(i) == blnmynokta);
            A1{i,s} = E3;
        elseif  BNdog(i) == blnmynokta(j)
             s = find(BNdog(i) == blnmynokta);
            A1{i,s} = E2;
        elseif BNdog(i) == ksnkoor(j)
            s = find(BNdog(i) == ksnkoor);
            A1{i,s} = E1;
        elseif BNdog(i) ~= ksnkoor(j) || DNdog(i) ~= ksnkoor(j)
            s = find(BNdog(i) == ksnkoor);
            A1{i,j} = E1;
        end   
    end   
end
A = cell2mat(A1);
% P AGIRLIK MATRISININ OLUSTURULMASI
% Kll Matrisi
s0 = num(1,9);
m = num(:,15:17);
m = m(isfinite(m(:,1)),:);
r = num(:,18:20);
r = r(isfinite(r(:,1)),:);
rr = triu(ones(length(m)),1);
rr(rr > 0) = r;
mm = bsxfun(@times,permute(m,[2,3,1]),permute(m,[3,2,1]));
Kll = bsxfun(@times,mm,rr + rr.' + eye(3));
[n2 n3] = size(m);
Kll2 = zeros(3,3);
if size(m,1) == 1
    for i = 1:n2
         Kl1{i,i} = Kll(:,:,i);        
    end
    Kll= cell2mat(Kl1);
else
    for i = 1:n2
        for j = 1:n2
            if i==j
                Kl1{i,i} = Kll(:,:,i);
            elseif i~=j
                Kl2{i,j} = Kll2;
            end
        end
    end
    Kll = cat(length(m),Kl1,Kl2);
    Kll= cell2mat(Kll);
end

% Aðýrlýk matrisi
Ql = Kll./s0^2;
P = inv(Ql);
% N NORMAL DENKLEMLER KATSAYILAR MATRISI
N = A'*P*A;
% nn SAG TARAF VEKTORU
n = A'*P*l;
% Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx = inv(N);
% x DENGELEME BILINMEYENLERI
dx = Qxx*n;
% Bilinmeyenlerin kesin deðeri
x = K2' + dx/10000;
KSNKOORD = x;
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
dog_n=length(DNdog); %%%%
% Dz= dog_olc(:,3:5)'+V/10^3
Vx = dog_olc(:,3);
Vy = dog_olc(:,4);
Vz = dog_olc(:,5);

for i = 1:length(l1)
    Vv{i,1} = [Vx(i);Vy(i);Vz(i)];
end
olculer =cell2mat(Vv); 
Vzz = olculer + V/100; %%%
% Dengeli ölçülerinin denetimi
for i = 1:length(DNdog)
    L1{i,1} = ((K(nokta_ad==BNdog(i),1)-K(nokta_ad==DNdog(i),1)));
    L2{i,1} = ((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))); 
    L3{i,1} = ((K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3)));   
end
L1 =cell2mat(L1);
L2 =cell2mat(L2);
L3 =cell2mat(L3);
for i = 1:length(l1)
   VL{i,1} = [L1(i);L2(i);L3(i)];
end
VL =cell2mat(VL);
Dz = Vzz-VL;
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
T = f*(mo^2/s0^2);
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
    k4 = num(:,4); k4 = k4(~isnan(k4));
    K = [k2 k3 k4];
    nokta_ad = [k1];
    blnmyn_ones = ones(length(K),1); %%
    blnmynNo = kron(k1,blnmyn_ones); %%
    dog_olc = num(:,6:13);
    dog_olc = dog_olc(isfinite(dog_olc(:,1)),:);
    Kor = num(:,14:16);
    Kor = Kor(isfinite(Kor(:,1)),:); %%
    DXYZ = num(:,11:13); %%
    % AÐDAKÝ NOKTA SAYISI
    [p p1] = size(K);
    % DURULAN NOKTALAR
    DNdog = num(:,6);                         
    DNdog=DNdog(~isnan(DNdog));
    DNdog1= kron(DNdog,blnmyn_ones);

    % BAKILAN NOKTALAR
    BNdog = num(:,7);                         
    BNdog=BNdog(~isnan(BNdog));
    BNdog1= kron(BNdog,blnmyn_ones);


% KOORDÝNATLARI BÝLÝNMEYEN NOKTALAR
blnmynokta = num(:,1);                 
blnmynokta = blnmynokta(~isnan(blnmynokta));
% ÖLÇÜ SAYISI
n1 = length(DNdog)*3;
% BÝLÝNMEYEN SAYISI
u = length(blnmynokta)*3;
f = n1-u+d;
if f==0 || f <0
    Message = sprintf('SERBESTLÝK DERECESÝ   %d\n DENGELEME YOK!!! ',f);
    errordlg(Message,...
        'Dikkat');
else

% ALET KURULAN NOKTALAR
YON_BLNM = unique(num(:,6));
YON_BLNM=YON_BLNM(~isnan(YON_BLNM));

% HER NOKTADA YAPILAN GÖZLEM SAYILARI
GOZ_SAY = histc(DNdog,YON_BLNM(:,1));
% L OTELEME VEKTORUNUN OLUSTURULMASI
for i = 1:length(DNdog)
    l1{i,1} = -((K(nokta_ad==BNdog(i),1)-K(nokta_ad==DNdog(i),1) - (dog_olc(nokta_ad==nokta_ad(i),3))))*100;
    l2{i,1} = -((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2) - (dog_olc(nokta_ad==nokta_ad(i),4))))*100;
    l3{i,1} = -((K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3) - (dog_olc(nokta_ad==nokta_ad(i),5))))*100;   
end
l1 =cell2mat(l1);l2 =cell2mat(l2);l3 =cell2mat(l3);
for i = 1:length(l1)
    l{i,1} = [l1(i);l2(i);l3(i)];
end
l =cell2mat(l);
% A KATSAYILAR MATRISININ OLUSTURULMASI
E1 = zeros(3,3);
E2 = eye(3,3);
E3 = -E2;
ksnkoor = -blnmynokta;   
for i = 1:length(DNdog)
    for j = 1:(length(blnmynokta))        
        if DNdog(i) == blnmynokta(j)
            s = find(DNdog(i) == blnmynokta);
            A1{i,s} = E3;
        elseif  BNdog(i) == blnmynokta(j)
             s = find(BNdog(i) == blnmynokta);
            A1{i,s} = E2;
        elseif BNdog(i) ~= ksnkoor(j) || DNdog(i) ~= ksnkoor(j)
            s = find(BNdog(i) == ksnkoor);
            A1{i,j} = E1;
        end   
    end   
end
A = cell2mat(A1);
% P AGIRLIK MATRISININ OLUSTURULMASI
% Kll Matrisi
s0 = num(1,5);
m = num(:,11:13);
m = m(isfinite(m(:,1)),:);
r = num(:,14:16);
r = r(isfinite(r(:,1)),:);
rr = triu(ones(length(m)),1);
rr(rr > 0) = r;
mm = bsxfun(@times,permute(m,[2,3,1]),permute(m,[3,2,1]));
Kll = bsxfun(@times,mm,rr + rr.' + eye(3));
[n2 n3] = size(m);
Kll2 = zeros(3,3);
if size(m,1) == 1
        for i = 1:n2
         Kl1{i,i} = Kll(:,:,i);        
        end
        Kll= cell2mat(Kl1);

else
    for i = 1:n2
        for j = 1:n2
            if i==j
                Kl1{i,i} = Kll(:,:,i);
            elseif i~=j
                Kl2{i,j} = Kll2;
            end
        end
    end
    Kll = cat(length(m),Kl1,Kl2);
    Kll= cell2mat(Kll);
end
% Aðýrlýk matrisi
Ql = Kll./s0^2;
P = inv(Ql);
% N NORMAL DENKLEMLER KATSAYILAR MATRISI
N = A'*P*A;
% nn SAG TARAF VEKTORU
n = A'*P*l;
% DATUM MATRÝSÝ
for i=1:p
    G{i,1} = [1./sqrt(p) 0 0
        0 1./sqrt(p) 0
        0 0 1./sqrt(p)];
end
G = cell2mat(G);
GG = G*G';
%YENÝ OLUÞAN N NORMAL DENKLEMLER KATSAYILAR MATRÝSÝ
Ny = (N+GG)^-1;
% Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI
Qxx = Ny-GG;
% x DENGELEME BILINMEYENLERI
dx = Qxx*n;
% Bilinmeyenlerin kesin deðeri
for i = 1:size(k1,1)
    b1{i,1} = K(nokta_ad==k1(i),1);
    b2{i,1} = K(nokta_ad==k1(i),2);
    b3{i,1} = K(nokta_ad==k1(i),3);   
end
b1 =cell2mat(b1);b2 =cell2mat(b2);b3 =cell2mat(b3);
for i = 1:length(b1)
    B{i,1} = [b1(i);b2(i);b3(i)];
end
B =cell2mat(B);
 x = B + dx/10000;

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
dog_n=length(DNdog); %%%%
Vx = dog_olc(:,3);
Vy = dog_olc(:,4);
Vz = dog_olc(:,5);
for i = 1:length(l1)
    Vv{i,1} = [Vx(i);Vy(i);Vz(i)];
end
olculer =cell2mat(Vv); 
Vzz = olculer + V/100; %%%
% Dengeli ölçülerinin denetimi
for i = 1:length(DNdog)
    L1{i,1} = ((K(nokta_ad==BNdog(i),1)-K(nokta_ad==DNdog(i),1)));
    L2{i,1} = ((K(nokta_ad==BNdog(i),2)-K(nokta_ad==DNdog(i),2))); 
    L3{i,1} = ((K(nokta_ad==BNdog(i),3)-K(nokta_ad==DNdog(i),3)));   
end
L1 =cell2mat(L1);
L2 =cell2mat(L2);
L3 =cell2mat(L3);
for i = 1:length(l1)
   VL{i,1} = [L1(i);L2(i);L3(i)];
end
VL =cell2mat(VL);
Dz = Vzz-VL;
% KARESEL ORTALAMA HATA
 mo=sqrt((V'*P*V)/(f));
% BÝLÝNMEYENLERÝN ORTALAMA HATASI
 mx=mo*sqrt(diag(Qxx));
 % ÖLÇÜLERÝN ORTALAMA HATASI
 ms=mo./sqrt(diag(P));
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
end

end
end