function triduseynivelmanprint
global  knan K1 K2 K dog_olc DNdog BNdog n1 ...
 A L P N n Qxx dx KSNYUKSEKLIK T_UYSM q_UYSM ...
V Dz mo mx ms Qll ml Qvv mv alf T q  s0_dog  G Ny...
YON_BLNM H0 KS0 Zi0 aik bik lik Denetim

[file, path] = uiputfile ( '*.txt;' , 'Output Save File');
filename=fullfile(path,file);
fid = fopen(filename,'wt');
if knan ~= 0
    fprintf(fid,'\t%s\n',datetime('now'));
    fprintf(fid,'\r\n\r\n\t ************** DÜÞEY AÇILARLA TRÝGONOMETRÝK NÝVELMAN AÐLARININ DENGELENMESÝ **************\r\n');
    fprintf(fid,'\r\n\r\n--------------------------------------------------------------------------------\r\n\r\n \t 1 - VERÝLENLER\r\n');
fprintf(fid,'--------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t#### KESÝN YÜKSEKLÝK \r\n\r\n\t  N.N\t\tH \r\n');
fprintf(fid,'\t  ===\t      ========\r\n');
fprintf(fid,'\t  %2.d\t%15.3f\r\n',K1');
fprintf(fid,'\n\t#### YAKLAÞIK YÜKSEKLÝK \r\n\r\n\t  N.N\t\t H \r\n');
fprintf(fid,'\t  ==\t      ======== \r\n');
fprintf(fid,'\t  %2.d\t%15.3f\r\n',K2');
fprintf(fid,'\r\n\t#### ÖLÇÜLEN DOÐRULTULAR VE DÝÐER ÖLÇÜLER \r\n');
fprintf(fid,'\r\n\t  DN\tBN\t Düþey Açý (g)\t md(cc)\t Alet Yüksekliði\tRef. Yüksekliði\t       S\r\n');
fprintf(fid,'\t  ==\t==\t ==========\t ======\t ===============\t==============\t   =========\r\n');
fprintf(fid,'\t  %.d\t %d\t %8.5f\t %3.d\t %10.2f\t %15.3f\t %11.3f\r\n\r\n',dog_olc');
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n \t 2 - BÝLÝNMEYENLERÝN ÇÖZÜMÜ VE TERS AÐIRLIK MATRÝSLERÝ\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\n\t\t **** Hesap Tablosu\n\n');
fprintf(fid,'\t DN\t BN\t    Hi-Hj\t      K*Sij^2\t       Z0\t  aik (cc/mm)\t bik (cc/mm)\t   lik (cc)\n');
fprintf(fid,'\t ==\t ==\t ============\t     =======\t   =========\t   =========\t  ==========\t  ==========\n');
for i = 1:length(YON_BLNM)
    fprintf(fid,'\t %2.d\t %2.d\t %10.3f %16.4f\t %12.5f\t %10.4f\t %10.4f\t %10.1f\n',[DNdog(DNdog==YON_BLNM(i),1) BNdog(DNdog==YON_BLNM(i),1)  H0{i}  KS0{i} Zi0{i} aik{i} bik{i} lik{i}]');
    fprintf(fid,'\n\n');
end
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
for i = 1:size(L,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.3f',L(i,:));
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
fprintf(fid,'\r\n\t#### DX DENGELEME BÝLÝNMEYENLERÝ (mm)\r\n\r\n');
for i = 1:size(dx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f',dx(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### Qxx BÝLÝNMEYENLERÝN TERS AÐIRLIK MATRÝSÝ\r\n\r\n');
for i = 1:size(Qxx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f ',Qxx(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### Qll DENGELÝ ÖLÇÜLERÝN TERS AÐIRLIK MATRÝSÝ\r\n\r\n');
for i = 1:size(Qll,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.4f  ',Qll(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### Qvv DÜZELTMELERÝN TERS AÐIRLIK MATRÝSÝ\r\n\r\n');
for i = 1:size(Qvv,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.4f  ',Qvv(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n3 - DENETÝM ÝSLEMLERÝ VE ORTALAMA HATALAR\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\r\n\t#### DENGELÝ ÖLÇÜLER DENETÝMÝ (m)\r\n\r\n');
for i = 1:size(Denetim,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.10f  ',Denetim(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### ÖNSEL KARESEL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  s0 = %.3f cc\n',s0_dog);
fprintf(fid,'\r\n\t#### SONSAL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  m0 = %.3f cc\n',mo);
fprintf(fid,'\r\n\t#### BÝLÝNMEYENLER ve ORTALAMA HATALARI\r\n\r\n');
fprintf(fid,'\t  %10.3f    ±%.3f mm\n',[KSNYUKSEKLIK mx]');
fprintf(fid,'\r\n\t#### ÖLÇÜLER, DENGELÝ ÖLÇÜLER, DÜZELTMELER ve KOH\r\n\r\n');
fprintf(fid,'\r\n\tDN\tBN\t  ÖLÇÜLER ± KOH (cc)\tDENGELÝ ÖLÇÜLER ± KOH\t   DÜZELTMELER ± KOH\r\n');
fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f ±%.3f\t%10.3f ±%.3f\t%10.3f ±%.3f\t\n',[DNdog BNdog dog_olc(:,3) ms Dz ml V mv]');
fprintf(fid,'\r\n----------------------------------------------------------------------\r\n\r\n4 -MODEL HÝPOTEZÝ VE UYUÞUMSUZLUK TESTÝ\r\n');
fprintf(fid,'---------------------------------------"-------------------------------\r\n');
fprintf(fid,'\r\n\t#### MODEL HÝPOTEZÝ TESTÝ\r\n\r\n');
fprintf(fid,'\r\n\t     TEST BÜYÜKLÜÐÜ\t\tSINIR DEÐER');
fprintf(fid,'\r\n\t     ==============\t\t===========\r\n');
fprintf(fid,'\t     T = %.4f\t\tq = %.4f\r\n',T,q);
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
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',DNdog(i,1),BNdog(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMLU');
    else
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',DNdog(i,1),BNdog(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMSUZ');
    end
end
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n\n');
fprintf(fid,'-------------------------------------------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t\t\tCreated By Cumhuriyet University Department of Geomatics Engineering\n');
fprintf(fid,'--------------------------------------------------------------------------------------------------------------------\r\n');
fclose(fid);
else
    fprintf(fid,'\t%s\n',datetime('now'));
    fprintf(fid,'\r\n\r\n\t ************** SERBEST DÜÞEY AÇILARLA TRÝGONOMETRÝK NÝVELMAN AÐLARININ DENGELENMESÝ **************\r\n');
    fprintf(fid,'\r\n\r\n--------------------------------------------------------------------------------\r\n\r\n \t 1 - VERÝLENLER\r\n');
    fprintf(fid,'--------------------------------------------------------------------------------\r\n');
    fprintf(fid,'\n\t#### YAKLAÞIK YÜKSEKLÝK \r\n\r\n\t  N.N\t\t H \r\n');
    fprintf(fid,'\t  ==\t      ======== \r\n');
    fprintf(fid,'\t  %2.d\t%15.3f\r\n',K');
   fprintf(fid,'\r\n\t  DN\tBN\t Düþey Açý (g)\t md(cc)\t Alet Yüksekliði\tRef. Yüksekliði\t       S\r\n');
fprintf(fid,'\t  ==\t==\t ==========\t ======\t ===============\t==============\t   =========\r\n');
fprintf(fid,'\t  %.d\t %d\t %8.5f\t %3.d\t %10.2f\t %15.3f\t %11.3f\r\n\r\n',dog_olc');
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n \t 2 - BÝLÝNMEYENLERÝN ÇÖZÜMÜ VE TERS AÐIRLIK MATRÝSLERÝ\r\n');
    fprintf(fid,'----------------------------------------------------------------------\r\n');
    fprintf(fid,'\n\t\t **** Hesap Tablosu\n\n');
fprintf(fid,'\t DN\t BN\t    Hi-Hj\t      K*Sij^2\t       Z0\t  aik (cc/mm)\t bik (cc/mm)\t   lik (cc)\n');
fprintf(fid,'\t ==\t ==\t ============\t     =======\t   =========\t   =========\t  ==========\t  ==========\n');
for i = 1:length(YON_BLNM)
        fprintf(fid,'\t %2.d\t %2.d\t %10.3f %16.4f\t %12.5f\t %10.4f\t %10.4f\t %10.1f\n',[DNdog(DNdog==YON_BLNM(i),1) BNdog(DNdog==YON_BLNM(i),1)  H0{i}  KS0{i} Zi0{i} aik{i} bik{i} lik{i}]');
        fprintf(fid,'\n\n');
    end
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
    for i = 1:size(L,1)
        fprintf(fid,'\t|');
        fprintf(fid,'%7.3f',L(i,:));
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
    fprintf(fid,'\r\n\t#### DX DENGELEME BÝLÝNMEYENLERÝ (mm)\r\n\r\n');
    for i = 1:size(dx,1)
        fprintf(fid,'\t| ');
        fprintf(fid,'%7.4f',dx(i,:));
        fprintf(fid,' |\r\n');
    end
    fprintf(fid,'\r\n\t#### Qxx BÝLÝNMEYENLERÝN TERS AÐIRLIK MATRÝSÝ\r\n\r\n');
    for i = 1:size(Qxx,1)
        fprintf(fid,'\t| ');
        fprintf(fid,'%7.4f ',Qxx(i,:));
        fprintf(fid,'|\r\n');
    end
    fprintf(fid,'\r\n\t#### Qll DENGELÝ ÖLÇÜLERÝN TERS AÐIRLIK MATRÝSÝ\r\n\r\n');
    for i = 1:size(Qll,1)
        fprintf(fid,'\t|');
        fprintf(fid,'%7.4f  ',Qll(i,:));
        fprintf(fid,'|\r\n');
    end
    fprintf(fid,'\r\n\t#### Qvv DÜZELTMELERÝN TERS AÐIRLIK MATRÝSÝ\r\n\r\n');
    for i = 1:size(Qvv,1)
        fprintf(fid,'\t|');
        fprintf(fid,'%7.4f  ',Qvv(i,:));
        fprintf(fid,'|\r\n');
    end
    fprintf(fid,'----------------------------------------------------------------------\r\n\r\n3 - DENETÝM ÝSLEMLERÝ VE ORTALAMA HATALAR\r\n');
    fprintf(fid,'----------------------------------------------------------------------\r\n');
    fprintf(fid,'\r\n\t#### DENGELÝ ÖLÇÜLER DENETÝMÝ (m)\r\n\r\n');
    for i = 1:size(Denetim,1)
        fprintf(fid,'\t|');
        fprintf(fid,'%7.10f  ',Denetim(i,:));
        fprintf(fid,'|\r\n');
    end
    fprintf(fid,'\r\n\t#### ÖNSEL KARESEL ORTALAMA HATA (cc)\r\n\r\n');
    fprintf(fid,'\t  s0 = %.3f cc\n',s0_dog);
    fprintf(fid,'\r\n\t#### SONSAL ORTALAMA HATA (cc)\r\n\r\n');
    fprintf(fid,'\t  m0 = %.3f cc\n',mo);
    fprintf(fid,'\r\n\t#### BÝLÝNMEYENLER ve ORTALAMA HATALARI\r\n\r\n');
    fprintf(fid,'\t  %10.3f    ±%.3f mm\n',[KSNYUKSEKLIK mx]');
    fprintf(fid,'\r\n\t#### ÖLÇÜLER, DENGELÝ ÖLÇÜLER, DÜZELTMELER ve KOH\r\n\r\n');
    fprintf(fid,'\r\n\tDN\tBN\t  ÖLÇÜLER ± KOH (cc)\tDENGELÝ ÖLÇÜLER ± KOH\t   DÜZELTMELER ± KOH\r\n');
    fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
    fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f ±%.3f\t%10.3f ±%.3f\t%10.3f ±%.3f\t\n',[DNdog BNdog dog_olc(:,3) ms Dz ml V mv]');
    fprintf(fid,'\r\n----------------------------------------------------------------------\r\n\r\n4 -MODEL HÝPOTEZÝ VE UYUÞUMSUZLUK TESTÝ\r\n');
    fprintf(fid,'---------------------------------------"-------------------------------\r\n');
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
            fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',DNdog(i,1),BNdog(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMLU');
        else
            fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',DNdog(i,1),BNdog(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMSUZ');
        end
    end
    fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n\n');
    fprintf(fid,'-------------------------------------------------------------------------------------------------------------------\r\n');
    fprintf(fid,'\t\t\tCreated By Cumhuriyet University Department of Geomatics Engineering\n');
    fprintf(fid,'--------------------------------------------------------------------------------------------------------------------\r\n');
    fclose(fid);
end

