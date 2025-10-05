function dogrultu_kenarprint
global knan num K K1 K2 dog_olc DNdog BNdog n1 u f YON_BLNM dogrultular...
    tik0 Sik0_dog dgrltlr tik0ri Zort lik_dog aik_dog bik_dog A l  s0_dog...
    P N n Qxx dx KSNKOORD V DNGELOLCU mo mx ms ml Qll Qvv mv...
    alf T q T_UYSM q_UYSM Ny G ken_olc DNken BNken  DY DX Sik0_ken...
    lik_ken aik_ken bik_ken s0_ken ONCUL_KOH dog_n ken_n Kenarlar TDN TBN...
    blnmynokta
[file, path] = uiputfile ( '*.txt;' , 'Output Save File');
filename=fullfile(path,file);
fid = fopen(filename,'wt');
if knan ~= 0
fprintf(fid,'\t%s\n',datetime('now')); 
fprintf(fid,'\r\n\r\n\t ************** DOÐRULTU - KENAR AÐLARININ DENGELENMESÝ **************\r\n');
fprintf(fid,'\r\n\r\n--------------------------------------------------------------------------------\r\n\r\n \t 1 - VERÝLENLER\r\n');
fprintf(fid,'--------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t#### KESÝN KOORDÝNATLAR\r\n\r\n\t  N.N\t\tY(m)\t\tX(m)\r\n\r\n');
fprintf(fid,'\t  ==\t      ========\t      ========\r\n');
fprintf(fid,'\t  %2.d\t%15.4f\t%15.4f\r\n',K1');
fprintf(fid,'\n\t#### YAKLAÞIK KOORDÝNATLAR\r\n\r\n\t  N.N\t\tY(m)\t\tX(m)\r\n\r\n');
fprintf(fid,'\t  ==\t      ========\t      ========\r\n');
fprintf(fid,'\t  %2.d\t%15.4f\t%15.4f\r\n',K2');
fprintf(fid,'\r\n\t#### ÖLÇÜLEN KENAR ve ÖLÇÜLEN DOÐRULTULAR\r\n');
fprintf(fid,'\r\n\t  ** KENAR ÖLÇÜLERÝ**\r\n\r\n\t  DN\tBN\tKenar (m)\tms(mm)\r\n\r\n');
fprintf(fid,'\t  ==\t==\t============\t========\r\n');
fprintf(fid,'\t  %2.d\t%d\t%8.3f\t ±%d\r\n\r\n',ken_olc');
fprintf(fid,'\r\n\r\n\t  ** DOÐRULTU ÖLÇÜLERÝ\r\n\r\n\t  DN\tBN\tDogrultu (g)\tmd(cc)\r\n\r\n');
fprintf(fid,'\t  ==\t==\t============\t========\r\n');
fprintf(fid,'\t  %2.d\t%d\t%11.5f\t ±%d\r\n',dog_olc');
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n \t 2 - BÝLÝNMEYENLERÝN ÇÖZÜMÜ VE TERS AÐIRLIK MATRÝSLERÝ\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\n\t\t **** Dogrultular Tablosu\n\n');
fprintf(fid,'\tDN\tBN\tDogrultu (g)\ttik0 (g)\tSik0 (m)\ttik0-ri (g)\tlik (cc)\taik (cc/mm)\tbik (cc/mm)\n');
fprintf(fid,'\t==\t==\t============\t========\t========\t===========\t========\t===========\t===========\n');
for i = 1:length(YON_BLNM)
    fprintf(fid,'\t%d\t%d\t%10.5f     %10.5f\t%8.4f\t%10.5f\t%8.2f\t%8.4f\t%8.4f\n',[DNdog(DNdog==YON_BLNM(i),1) BNdog(DNdog==YON_BLNM(i),1) dgrltlr{i} tik0{i} Sik0_dog{i} tik0ri{i} lik_dog{i} aik_dog{i} bik_dog{i}]');
    fprintf(fid,'\t\t\t\t\t\t\t\tZort = %11.5f',Zort{i});
    fprintf(fid,'\n\n');
end
fprintf(fid,'\n\t\t **** Kenarlar Tablosu\n\n');
fprintf(fid,'\tDN\tBN\tDY (m)     \tDX (m)     \tSik0 (m)\tSik (m)     \tlik (mm)\taik  \t\tbik\n');
fprintf(fid,'\t==\t==\t=========  \t=========  \t========\t========    \t========\t=====\t\t=====\n');
for i = 1:length(DNken)
    fprintf(fid,'\t%d\t%d\t%8.3f   \t%8.3f  \t%8.3f\t%8.3f\t%8.2f\t%6.4f\t%14.4f\n',DNken(i,1),BNken(i,1),DY(i,1),DX(i,1),Sik0_ken(i,1),num(i,9),lik_ken(i,1),aik_ken(i,1),bik_ken(i,1));
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
for i = 1:size(l,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.3f',l(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### N  NORMAL DENKLEMLER KATSAYILAR MATRISI\r\n\r\n');
for i = 1:size(N,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.4f',N(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### n SAG TARAF VEKTORU\r\n\r\n');
for i = 1:size(n,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f',n(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### X DENGELEME BILINMEYENLERI (mm)\r\n\r\n');
blnmyno= repelem(blnmynokta,2);
for i = 1:size(dx,1)
    if  (mod(i,2)~=0)
        fprintf(fid,'\tdx%d = ',blnmyno(i));
        fprintf(fid,'%7.4f\t',dx(i));
    else
        fprintf(fid,'dy%d = ',blnmyno(i));
        fprintf(fid,'%7.4f\r\n',dx(i));
        fprintf(fid,'\r\n');
    end
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
fprintf(fid,'\t  s0 = %.3f cc\n',s0_dog);
fprintf(fid,'\r\n\t#### SONSAL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  m0 = %.3f cc\n',mo);
fprintf(fid,'\r\n\t#### BÝLÝNMEYENLER ve ORTALAMA HATALARI\r\n\r\n');
for i = 1:size(KSNKOORD,1)
    if (mod(i,2)~=0)
        fprintf(fid,'\t X%1.d %7.3f   ±%2.3f mm\n',[blnmyno(i) KSNKOORD(i) mx(i)]');
    else       
        fprintf(fid,'\t Y%1.d %7.3f   ±%2.3f mm\n',[blnmyno(i) KSNKOORD(i) mx(i)]');
        fprintf(fid,'\r\n');
    end    
end
fprintf(fid,'\r\n\t#### ÖLÇÜLER, DENGELÝ ÖLÇÜLER, DÜZELTMELER ve KOH\r\n\r\n');
fprintf(fid,'\r\n\tDN\tBN\tDOÐ ÖLÇÜLER ± KOH(cc)\tDENGELÝ ÖLÇÜLER ± KOH(cc)\t   DÜZELTMELER ± KOH(cc)\r\n');
fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f ±%5.3f\t%10.5f ±%5.3f\t%10.3f ±%5.3f\t\n',[DNdog BNdog dogrultular ms(1:dog_n,:) DNGELOLCU(1:dog_n,:) ml(1:dog_n,:) V(1:dog_n,:) mv(1:dog_n,:)]');
fprintf(fid,'\r\n\tDN\tBN\tKEN ÖLÇÜLER ± KOH (cc)\tDENGELÝ ÖLÇÜLER ± KOH(cc)\t   DÜZELTMELER ± KOH(cc)\r\n');
fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f ±%5.3f\t%10.5f ±%5.3f\t%10.3f ±%5.3f\t\n',[DNken BNken Kenarlar ms(1:ken_n,:) DNGELOLCU(1:ken_n,:) ml(1:ken_n,:) V(1:ken_n,:) mv(1:ken_n,:)]');
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n4 -MODEL HÝPOTEZÝ VE UYUÞUMSUZLUK TESTÝ\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
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
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',TDN(i,1),TBN(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMLU');
    else
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',TDN(i,1),TBN(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMSUZ');
    end
end
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n\n');
fprintf(fid,'-------------------------------------------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t\t\tCreated By Cumhuriyet University Department of Geomatics Engineering\n');
fprintf(fid,'--------------------------------------------------------------------------------------------------------------------\r\n');
fclose(fid);
else 
    fprintf(fid,'\t%s\n',datetime('now')); 
    fprintf(fid,'\r\n\r\n\t ************** SERBEST DOÐRULTU - KENAR AÐLARININ DENGELENMESÝ **************\r\n');
    fprintf(fid,'\r\n\r\n--------------------------------------------------------------------------------\r\n\r\n \t 1 - VERÝLENLER\r\n');
    fprintf(fid,'--------------------------------------------------------------------------------\r\n');
    fprintf(fid,'\n\t#### YAKLAÞIK KOORDÝNATLAR\r\n\r\n\t  N.N\t\tY(m)\t\tX(m)\r\n\r\n');
    fprintf(fid,'\t  ==\t      ========\t      ========\r\n');
    fprintf(fid,'\t  %2.d\t%15.4f\t%15.4f\r\n',K');
    fprintf(fid,'\r\n\t#### ÖLÇÜLEN KENAR ve ÖLÇÜLEN DOÐRULTULAR\r\n');
    fprintf(fid,'\r\n\t  ** KENAR ÖLÇÜLERÝ**\r\n\r\n\t  DN\tBN\tKenar (m)\tms(mm)\r\n\r\n');
    fprintf(fid,'\t  ==\t==\t============\t========\r\n');
    fprintf(fid,'\t  %2.d\t%d\t%8.3f\t ±%d\r\n\r\n',ken_olc');
    fprintf(fid,'\r\n\r\n\t  ** DOÐRULTU ÖLÇÜLERÝ\r\n\r\n\t  DN\tBN\tDogrultu (g)\tmd(cc)\r\n\r\n');
    fprintf(fid,'\t  ==\t==\t============\t========\r\n');
    fprintf(fid,'\t  %2.d\t%d\t%11.5f\t ±%d\r\n\r\n',dog_olc');
    fprintf(fid,'----------------------------------------------------------------------\r\n\r\n \t 2 - BÝLÝNMEYENLERÝN ÇÖZÜMÜ VE TERS AÐIRLIK MATRÝSLERÝ\r\n');
    fprintf(fid,'----------------------------------------------------------------------\r\n');
    fprintf(fid,'\n\t\t **** Dogrultular Tablosu\n\n');
    fprintf(fid,'\tDN\tBN\tDogrultu (g)\ttik0 (g)\tSik0 (m)\ttik0-ri (g)\tlik (cc)\taik (cc/mm)\tbik (cc/mm)\n');
    fprintf(fid,'\t==\t==\t============\t========\t========\t===========\t========\t===========\t===========\n');
    for i = 1:length(YON_BLNM)
        fprintf(fid,'\t%d\t%d\t%10.5f     %10.5f\t%8.4f\t%10.5f\t%8.2f\t%8.4f\t%8.4f\r\n',[DNdog(DNdog==YON_BLNM(i),1) BNdog(DNdog==YON_BLNM(i),1) dgrltlr{i} tik0{i} Sik0_dog{i} tik0ri{i} lik_dog{i} aik_dog{i} bik_dog{i}]');
        fprintf(fid,'\t\t\t\t\t\t\t\tZort = %11.5f',Zort{i});
        fprintf(fid,'\r\n');
    end
    fprintf(fid,'\n\t\t **** Kenarlar Tablosu\n\n');
    fprintf(fid,'\tDN\tBN\tDY (m)     \tDX (m)     \tSik0 (m)\tSik (m)     \tlik (mm)\taik  \t\tbik\n');
    fprintf(fid,'\t==\t==\t=========  \t=========  \t========\t========    \t========\t===========\t===========\n');
    for i = 1:length(DNken)
        fprintf(fid,'\t%d\t%d\t%8.3f   \t%8.3f  \t%8.3f\t%8.3f\t%8.2f\t%6.4f\t%14.4f\n',DNken(i,1),BNken(i,1),DY(i,1),DX(i,1),Sik0_ken(i,1),num(i,9),lik_ken(i,1),aik_ken(i,1),bik_ken(i,1));
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
    for i = 1:size(l,1)
        fprintf(fid,'\t|');
        fprintf(fid,'%7.3f',l(i,:));
        fprintf(fid,' |\r\n');
    end
    fprintf(fid,'\r\n\t#### N  NORMAL DENKLEMLER KATSAYILAR MATRISI\r\n\r\n');
    for i = 1:size(N,1)
        fprintf(fid,'\t|');
        fprintf(fid,'%7.4f',N(i,:));
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
fprintf(fid,'\r\n\t#### X DENGELEME BILINMEYENLERI (mm)\r\n\r\n');
blnmyno= repelem(blnmynokta,2);
for i = 1:size(dx,1)
    if  (mod(i,2)~=0)
        fprintf(fid,'\tdx%d = ',blnmyno(i));
        fprintf(fid,'%7.4f\t',dx(i));
    else
        fprintf(fid,'dy%d = ',blnmyno(i));
        fprintf(fid,'%7.4f\r\n',dx(i));
        fprintf(fid,'\r\n');
    end
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
    fprintf(fid,'\t  s0 = %.3f cc\n',s0_dog);
    fprintf(fid,'\r\n\t#### SONSAL ORTALAMA HATA (cc)\r\n\r\n');
    fprintf(fid,'\t  m0 = %.3f cc\n',mo);
    fprintf(fid,'\r\n\t#### BÝLÝNMEYENLER ve ORTALAMA HATALARI\r\n\r\n');
        for i = 1:size(KSNKOORD,1)
            if (mod(i,2)~=0)
                fprintf(fid,'\t X%1.d %7.3f   ±%2.3f mm\n',[blnmyno(i) KSNKOORD(i) mx(i)]');
            else       
                fprintf(fid,'\t Y%1.d %7.3f   ±%2.3f mm\n',[blnmyno(i) KSNKOORD(i) mx(i)]');
                fprintf(fid,'\r\n');
            end    
     end
    fprintf(fid,'\r\n\t#### ÖLÇÜLER, DENGELÝ ÖLÇÜLER, DÜZELTMELER ve KOH\r\n\r\n');
    fprintf(fid,'\r\n\tDN\tBN\tDOÐ ÖLÇÜLER ± KOH(cc)\tDENGELÝ ÖLÇÜLER ± KOH(cc)\t   DÜZELTMELER ± KOH(cc)\r\n');
    fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
    fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f ±%5.3f\t%10.5f ±%5.3f\t%10.3f ±%5.3f\t\n',[DNdog BNdog dogrultular ms(1:dog_n,:) DNGELOLCU(1:dog_n,:) ml(1:dog_n,:) V(1:dog_n,:) mv(1:dog_n,:)]');
    fprintf(fid,'\r\n\tDN\tBN\tKEN ÖLÇÜLER ± KOH (cc)\tDENGELÝ ÖLÇÜLER ± KOH(cc)\t   DÜZELTMELER ± KOH(cc)\r\n');
    fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
    fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f ±%5.3f\t%10.5f ±%5.3f\t%10.3f ±%5.3f\t\n',[DNken BNken Kenarlar ms(1:ken_n,:) DNGELOLCU(1:ken_n,:) ml(1:ken_n,:) V(1:ken_n,:) mv(1:ken_n,:)]');
    fprintf(fid,'----------------------------------------------------------------------\r\n\r\n4 -MODEL HÝPOTEZÝ VE UYUÞUMSUZLUK TESTÝ\r\n');
    fprintf(fid,'----------------------------------------------------------------------\r\n');
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
            fprintf(fid,'\t\t%2.0f\t%2.0f\t%4.3f  %.4f   %.4f   %.4f   %s\n',TDN(i,1),TBN(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMLU');
        else
            fprintf(fid,'\t\t%2.0f\t%2.0f\t%4.3f  %.4f   %.4f   %.4f   %s\n',TDN(i,1),TBN(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMSUZ');
        end
    end
    fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n\n');
    fprintf(fid,'-------------------------------------------------------------------------------------------------------------------\r\n');
    fprintf(fid,'\t\t\tCreated By Cumhuriyet University Department of Geomatics Engineering\n');
    fprintf(fid,'--------------------------------------------------------------------------------------------------------------------\r\n');
    fclose(fid);
end
