function gpsaglariprint
global knan K1 K2 K dog_olc DNdog BNdog n1 YON_BLNM...
    l A so P N n Qxx dx x V Vzz Dz mo mx ms ml mv Qll Qvv ...
    alf T q T_UYSM q_UYSM G Ny k1 k5 Kor blnmynNo DXYZ ...
    dog_n olculer DNdog1 BNdog1
  
[file, path] = uiputfile ( '*.txt;' , 'Output Save File');
filename=fullfile(path,file);
fid = fopen(filename,'wt');
if knan ~= 0
fprintf(fid,'\t%s\n',datetime('now')); 
fprintf(fid,'\r\n\r\n\t ************** GPS AÐLARININ DENGELENMESÝ **************\r\n');
fprintf(fid,'\r\n\r\n--------------------------------------------------------------------------------\r\n\r\n \t 1 - VERÝLENLER\r\n');
fprintf(fid,'--------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t#### KESÝN KOORDÝNATLAR\r\n\r\n\t  N.N\t\tY(m)\t\tX(m)\t\tZ(m)\r\n\r\n');
fprintf(fid,'\t  ==\t   ============\t   ============\t   ============\r\n');
fprintf(fid,'\t  %1.d\t%15.4f\t%15.4f\t%15.4f\r\n',[k1 K1]');
fprintf(fid,'\n\t#### YAKLAÞIK KOORDÝNATLAR\r\n\r\n\t  N.N\t\tY(m)\t\tX(m)\t\tZ(m)\r\n\r\n');
fprintf(fid,'\t  ==\t   ============\t   ============\t   ============\r\n');
fprintf(fid,'\t  %1.d\t%15.4f\t%15.4f\t%15.4f\r\n',[k5 K2]');
fprintf(fid,'\r\n\t#### KOORDÝNAT FARKLARI, STANDART SAPMALAR VE KORELASYONLAR\r\n');
fprintf(fid,'\r\n\r\n\t  ** KOORDÝNAT FARKLARI VE STANDART SAPMALAR\r\n\r\n\t  DN\tBN\t     Dx\t\t      Dy\t      Dz\t        Mx\t        My\t        Mz\r\n\r\n');
fprintf(fid,'\t  ==\t==\t  ==========\t  ==========\t   ==========\t   ==========\t   ==========\t   ==========\r\n');
fprintf(fid,'\t  %2.d\t%d\t%11.3f\t%11.3f\t%11.3f\t%11.2f\t%11.2f\t%11.2f\r\n',dog_olc');
fprintf(fid,'\r\n\r\n\t  ** KORELASYONLAR\r\n\r\n\t     Rxy\t      Rxz\t      Ryz\r\n\r\n');
fprintf(fid,'\t  ==========\t  ==========\t   ==========\r\n');
fprintf(fid,'\t %9.3f\t%9.3f\t%9.3f\r\n',Kor');
fprintf(fid,'\r\n\r\n----------------------------------------------------------------------\r\n\r\n \t 2 - BÝLÝNMEYENLERÝN ÇÖZÜMÜ VE TERS AÐIRLIK MATRÝSLERÝ\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\n\t#### P AGIRLIK MATRISI\r\n\r\n');
for i = 1:size(P,1)
    fprintf(fid,'\t|');
    fprintf(fid,'  %9.4f  ',P(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### A KATSAYILAR MATRISI\r\n\r\n');
for i = 1:size(A,1)
    fprintf(fid,'\t|');
    fprintf(fid,' %7.4f ',A(i,:));
    fprintf(fid,'|\r\n');
end 
fprintf(fid,'\r\n\t#### L OTELEME VEKTORU (mm)\r\n\r\n');
for i = 1:size(l,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.3f',l(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### N  NORMAL DENKLEMLER KATSAYILAR MATRISI\r\n\r\n');
for i = 1:size(N,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%9.4f',N(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### n SAG TARAF VEKTORU\r\n\r\n');
for i = 1:size(n,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f',n(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### DX DENGELEME BILINMEYENLERI (mm)\r\n\r\n');
for i = 1:size(dx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f',dx(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI\r\n\r\n');
for i = 1:size(Qxx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f ',Qxx(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### DENGELÝ ÖLÇÜLERÝN ORTALAMA HATASI \r\n\r\n');
fprintf(fid,'\t  Qll Matrisi \n');
fprintf(fid,'\t========================================================  \r\n\r\n');
 for i = 1:size(Qll,1)
    fprintf(fid,'\t|');
    fprintf(fid,' %7.4f ',Qll(i,:));
    fprintf(fid,'|\r\n');
 end 
 fprintf(fid,'\r\n\t#### DÜZELTMELERÝN ORTALAMA HATASI \r\n\r\n');
fprintf(fid,'\t  Qvv Matrisi \n');
fprintf(fid,'\t========================================================  \r\n\r\n');
 for i = 1:size(Qvv,1)
    fprintf(fid,'\t|');
    fprintf(fid,' %7.4f ',Qvv(i,:));
    fprintf(fid,'|\r\n');
 end 
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n3 - DENETÝM ÝSLEMLERÝ VE ORTALAMA HATALAR\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\r\n\t#### ÖNSEL KARESEL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  s0 = %.3f cc\n',so);
fprintf(fid,'\r\n\t#### SONSAL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  m0 = %.3f cc\n',mo);
fprintf(fid,'\r\n\t#### BÝLÝNMEYENLER ve ORTALAMA HATALARI\r\n\r\n');
% for i = 1:size(x,1)
%     if i == 1
%         fprintf(fid,'\t X%.d ', blnmynNo(i));
%     elseif i == 2 
%         fprintf(fid,'\t Y%.d',blnmynNo(i));
%     elseif i == 3
%         fprintf(fid,'\t Z%.d',blnmynNo(i));
%     end    
%     fprintf(fid,' %7.4f\t ±%7.4f ',x(i,:),mx(i,:));
%     fprintf(fid,'\r\n');
% end 
fprintf(fid,'\t  %7.3f   ±%.3f mm\n',[x mx]');


fprintf(fid,'\r\n\t#### ÖLÇÜLER, DENGELÝ ÖLÇÜLER, DÜZELTMELER ve KOH\r\n\r\n');
fprintf(fid,'\r\n\tDN\tBN\tDOÐ ÖLÇÜLER ± KOH (cc)\tDENGELÝ ÖLÇÜLER ± KOH\t   DÜZELTMELER ± KOH\r\n');
fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f ±%5.3f\t%10.3f ±%5.3f\t%10.3f ±%5.3f\t\n',[DNdog1 BNdog1 olculer ms Vzz ml V mv]');
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n4 -MODEL HÝPOTEZÝ VE UYUÞUMSUZLUK TESTÝ\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\r\n\t#### MODEL HÝPOTEZÝ TESTÝ\r\n\r\n');
fprintf(fid,'\r\n\t     TEST BÜYÜKLÜÐÜ\t\tSINIR DEÐER');
fprintf(fid,'\r\n\t     ==============\t\t===========\r\n');
fprintf(fid,'\t     T = %.4f\t\t\tq = %.4f\r\n',T,q);
if T<q
    fprintf(fid,'\n\t     ** Model hipotezi testi %2.1f güvenle geçersiz sayýlamaz.\n',alf*100);
else
    fprintf(fid,'\n\t     ** Model hipotezi testi %2.1f güvenle geçersizdir.\n',alf*100);
end
fprintf(fid,'\r\n\t#### UYUÞUMSUZ ÖLÇÜLER TESTÝ\r\n\r\n');
fprintf(fid,'\r\n\t\tDN\tBN\t  Vi\t   QVVi\t    Ti\t      q\t     YORUM\r\n');
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n');


for i = 1:n1
    if T_UYSM(i,1) <= q_UYSM
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.3f   %.4f   %.4f   %s\n',DNdog1(i,1),BNdog1(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMLU');
    else
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.3f   %.4f   %.4f   %s\n',DNdog1(i,1),BNdog1(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMSUZ');
    end
end
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n\n');
fprintf(fid,'-------------------------------------------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t\t\tCreated By Cumhuriyet University Department of Geomatics Engineering\n');
fprintf(fid,'--------------------------------------------------------------------------------------------------------------------\r\n');
fclose(fid);
else
    fprintf(fid,'\t%s\n',datetime('now')); 
fprintf(fid,'\r\n\r\n\t ************** SERBEST GPS AÐLARININ DENGELENMESÝ **************\r\n');
fprintf(fid,'\r\n\r\n--------------------------------------------------------------------------------\r\n\r\n \t 1 - VERÝLENLER\r\n');
fprintf(fid,'--------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t#### YAKLAÞIK KOORDÝNATLAR\r\n\r\n\t  N.N\t\tY(m)\t\tX(m)\t\tZ(m)\r\n\r\n');
fprintf(fid,'\t  ==\t   ============\t   ============\t   ============\r\n');
fprintf(fid,'\t  %1.d\t%15.4f\t%15.4f\t%15.4f\r\n',[k1 K]');
 fprintf(fid,'\r\n\t#### KOORDÝNAT FARKLARI, STANDART SAPMALAR VE KORELASYONLAR\r\n');
fprintf(fid,'\r\n\r\n\t  ** KOORDÝNAT FARKLARI VE STANDART SAPMALAR\r\n\r\n\t  DN\tBN\t     Dx\t\t      Dy\t      Dz\t        Mx\t        My\t        Mz\r\n\r\n');
fprintf(fid,'\t  ==\t==\t  ==========\t  ==========\t   ==========\t   ==========\t   ==========\t   ==========\r\n');
fprintf(fid,'\t  %2.d\t%d\t%11.3f\t%11.3f\t%11.3f\t%11.2f\t%11.2f\t%11.2f\r\n',dog_olc');   
fprintf(fid,'\r\n\r\n\t  ** KORELASYONLAR\r\n\r\n\t     Rxy\t      Rxz\t      Ryz\r\n\r\n');
fprintf(fid,'\t  ==========\t  ==========\t   ==========\r\n');
fprintf(fid,'\t %9.3f\t%9.3f\t%9.3f\r\n',Kor');
fprintf(fid,'\r\n\r\n----------------------------------------------------------------------\r\n\r\n \t 2 - BÝLÝNMEYENLERÝN ÇÖZÜMÜ VE TERS AÐIRLIK MATRÝSLERÝ\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\n\t#### P AGIRLIK MATRISI\r\n\r\n');
for i = 1:size(P,1)
    fprintf(fid,'\t|');
    fprintf(fid,'  %9.4f  ',P(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### A KATSAYILAR MATRISI\r\n\r\n');
for i = 1:size(A,1)
    fprintf(fid,'\t|');
    fprintf(fid,' %7.4f ',A(i,:));
    fprintf(fid,'|\r\n');
end 
fprintf(fid,'\r\n\t#### L OTELEME VEKTORU (mm)\r\n\r\n');
for i = 1:size(l,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.3f',l(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### N  NORMAL DENKLEMLER KATSAYILAR MATRISI\r\n\r\n');
for i = 1:size(N,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%9.4f',N(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### n SAG TARAF VEKTORU\r\n\r\n');
for i = 1:size(n,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f',n(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\n\t#### DATUM MATRÝSÝ\r\n\r\n');
for i = 1:size(G,1)
    fprintf(fid,'\t|');
    fprintf(fid,'  %9.4f  ',G(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\n\t#### YENÝ OLUÞAN N NORMAL DENKLEMLER KATSAYILAR MATRÝSÝ \r\n\r\n');
for i = 1:size(Ny,1)
    fprintf(fid,'\t|');
    fprintf(fid,'  %9.4f  ',Ny(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### DX DENGELEME BILINMEYENLERI (mm)\r\n\r\n');
for i = 1:size(dx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f',dx(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### Qxx BILINMEYENLERIN TERS AGIRLIK MATRISI\r\n\r\n');
for i = 1:size(Qxx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f ',Qxx(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### DENGELÝ ÖLÇÜLERÝN ORTALAMA HATASI \r\n\r\n');
fprintf(fid,'\t  Qll Matrisi \n');
fprintf(fid,'\t========================================================  \r\n\r\n');
 for i = 1:size(Qll,1)
    fprintf(fid,'\t|');
    fprintf(fid,' %7.4f ',Qll(i,:));
    fprintf(fid,'|\r\n');
 end 
 fprintf(fid,'\r\n\t#### DÜZELTMELERÝN ORTALAMA HATASI \r\n\r\n');
fprintf(fid,'\t  Qvv Matrisi \n');
fprintf(fid,'\t========================================================  \r\n\r\n');
 for i = 1:size(Qvv,1)
    fprintf(fid,'\t|');
    fprintf(fid,' %7.4f ',Qvv(i,:));
    fprintf(fid,'|\r\n');
 end 
fprintf(fid,'\r\n\r\n----------------------------------------------------------------------\r\n\r\n3 - DENETÝM ÝSLEMLERÝ VE ORTALAMA HATALAR\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\r\n\t#### ÖNSEL KARESEL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  s0 = %.3f cc\n',so);
fprintf(fid,'\r\n\t#### SONSAL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  m0 = %.3f cc\n',mo);
fprintf(fid,'\r\n\t#### BÝLÝNMEYENLER ve ORTALAMA HATALARI\r\n\r\n');
% iii = 1:size(x,1)
% ii1 = iii(:,1:3:end)
% ii2 = iii(:,2:3:end)
% ii3 = iii(:,3:3:end)
% for i = 1:size(x,1)/3
%     for j = 1:size(x,1)/3
%         for y = 1:size(x,1)/3
%         if i == ii1(i)
%             fprintf(fid,'\t X%.d ', blnmynNo(i));
%         elseif j== ii2(j)
%             fprintf(fid,'\t Y%.d',blnmynNo(i));
%         elseif y == ii3(y)
%             fprintf(fid,'\t Z%.d',blnmynNo(i));
%         end    
%         fprintf(fid,' %7.4f\t ±%7.4f ',x(i,:),mx(i,:));
%         fprintf(fid,'\r\n');
%         end
%     end
% end
fprintf(fid,'\t  %7.3f  ±%.3f mm\n',[x mx]');
fprintf(fid,'\r\n\t#### ÖLÇÜLER, DENGELÝ ÖLÇÜLER, DÜZELTMELER ve KOH\r\n\r\n');
fprintf(fid,'\r\n\tDN\tBN\tDOÐ ÖLÇÜLER ± KOH (cc)\tDENGELÝ ÖLÇÜLER ± KOH\t   DÜZELTMELER ± KOH\r\n');
fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f ±%5.3f\t%10.3f ±%5.3f\t%10.3f ±%5.3f\t\n',[DNdog1 BNdog1 olculer ms Vzz ml V mv]');
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n4 -MODEL HÝPOTEZÝ VE UYUÞUMSUZLUK TESTÝ\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\r\n\t#### MODEL HÝPOTEZÝ TESTÝ\r\n\r\n');
fprintf(fid,'\r\n\t     TEST BÜYÜKLÜÐÜ\t\tSINIR DEÐER');
fprintf(fid,'\r\n\t     ==============\t\t===========\r\n');
fprintf(fid,'\t     T = %.4f\t\t\tq = %.4f\r\n',T,q);
if T<q
    fprintf(fid,'\n\t     ** Model hipotezi testi %2.1f güvenle geçersiz sayýlamaz.\n',alf*100);
else
    fprintf(fid,'\n\t     ** Model hipotezi testi %2.1f güvenle geçersizdir.\n',alf*100);
end
fprintf(fid,'\r\n\t#### UYUÞUMSUZ ÖLÇÜLER TESTÝ\r\n\r\n');
fprintf(fid,'\r\n\t\tDN\tBN\t  Vi\t   QVVi\t    Ti\t      q\t     YORUM\r\n');
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n');


for i = 1:n1
    if T_UYSM(i,1) <= q_UYSM
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.3f   %.4f   %.4f   %s\n',DNdog1(i,1),BNdog1(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMLU');
    else
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.3f   %.4f   %.4f   %s\n',DNdog1(i,1),BNdog1(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMSUZ');
    end
end
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n\n');
fprintf(fid,'-------------------------------------------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t\t\tCreated By Cumhuriyet University Department of Geomatics Engineering\n');
fprintf(fid,'--------------------------------------------------------------------------------------------------------------------\r\n');
fclose(fid);
end