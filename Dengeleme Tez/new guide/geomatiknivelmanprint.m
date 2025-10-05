function geomatiknivelmanprint
global num knan K1 K2 K Dz Dzltm_den denetim A V  ...
    l N n P G Ny Qxx dx KSNYUKSEKLIK mo mx ms ...
    Qll ml Qvv mv dog_olc DNdog BNdog s0_dog HK n1 ...
      T_UYSM q_UYSM T q alf 
[file, path] = uiputfile ( '*.txt;' , 'Output Save File');
filename=fullfile(path,file);
fid = fopen(filename,'wt');
if knan ~= 0
fprintf(fid,'\t%s\n',datetime('now')); 
fprintf(fid,'\r\n\r\n\t ************** GEOMATR�K N�VELMAN A�I DENGELENMES� **************\r\n');
fprintf(fid,'\r\n\r\n--------------------------------------------------------------------------------\r\n\r\n \t 1 - VER�LENLER\r\n');
fprintf(fid,'--------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t#### KES�N Y�KSEKL�K \r\n\r\n\t  N.N\t\tH \r\n');
fprintf(fid,'\t  ===\t      ========\r\n');
fprintf(fid,'\t  %2.d\t%15.3f\r\n',K1');
fprintf(fid,'\n\t#### YAKLA�IK Y�KSEKL�K \r\n\r\n\t  N.N\t\t H \r\n');
fprintf(fid,'\t  ==\t      ======== \r\n');
fprintf(fid,'\t  %2.d\t%15.3f\r\n',K2');
fprintf(fid,'\r\n\t#### �L��LEN Y�KSEKL�KLER VE KENARLAR\r\n');
fprintf(fid,'\r\n\r\n\t  **  GEOMETR�K N�VELMAN �L��LER� \r\n\r\n\t  DN\tBN\t  Dh (m)\t  s (m)\r\n\r\n');
fprintf(fid,'\t  ==\t==\t============\t========\r\n');
fprintf(fid,'\t  %2.d\t%d\t%11.5f\t �%.3f\r\n',dog_olc');
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n \t 2 - B�L�NMEYENLER�N ��Z�M� VE TERS A�IRLIK MATR�SLER�\r\n');
fprintf(fid,'---------------------------------------------------------------------\r\n');
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
fprintf(fid,'\r\n\t#### DX DENGELEME B�L�NMEYENLER� (mm)\r\n\r\n');
for i = 1:size(dx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f',dx(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### Qxx B�L�NMEYENLER�N TERS A�IRLIK MATR�S�\r\n\r\n');
for i = 1:size(Qxx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f ',Qxx(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### Qll DENGEL� �L��LER�N TERS A�IRLIK MATR�S�\r\n\r\n');
for i = 1:size(Qll,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.4f  ',Qll(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### Qvv D�ZELTMELER�N TERS A�IRLIK MATR�S�\r\n\r\n');
for i = 1:size(Qvv,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.4f  ',Qvv(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n3 - DENET�M �SLEMLER� VE ORTALAMA HATALAR\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\r\n\t#### DENGEL� �L��LER DENET�M� (m)\r\n\r\n');
for i = 1:size(denetim,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.10f  ',denetim(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### �NSEL KARESEL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  s0 = %.3f cc\n',s0_dog);
fprintf(fid,'\r\n\t#### SONSAL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  m0 = %.3f cc\n',mo);
fprintf(fid,'\r\n\t#### B�L�NMEYENLER ve ORTALAMA HATALARI\r\n\r\n');
fprintf(fid,'\t  %10.3f    �%.3f mm\n',[KSNYUKSEKLIK mx]');
fprintf(fid,'\r\n\t#### �L��LER, DENGEL� �L��LER, D�ZELTMELER ve KOH\r\n\r\n');
fprintf(fid,'\r\n\tDN\tBN\t  �L��LER � KOH (cc)\tDENGEL� �L��LER � KOH\t   D�ZELTMELER � KOH\r\n');
fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f �%.3f\t%10.3f �%.3f\t%10.3f �%.3f\t\n',[DNdog BNdog dog_olc(:,3) ms Dz ml V mv]');
fprintf(fid,'\r\n----------------------------------------------------------------------\r\n\r\n4 -MODEL H�POTEZ� VE UYU�UMSUZLUK TEST�\r\n');
fprintf(fid,'---------------------------------------"-------------------------------\r\n');
fprintf(fid,'\r\n\t#### MODEL H�POTEZ� TEST�\r\n\r\n');
fprintf(fid,'\r\n\t     TEST B�Y�KL���\t\tSINIR DE�ER');
fprintf(fid,'\r\n\t     ==============\t\t===========\r\n');
fprintf(fid,'\t     T = %.4f\t\tq = %.4f\r\n',T,q);
if T<q
    fprintf(fid,'\n\t     ** Model hipotezi testi %2.1f g�venle ge�ersiz say�lamaz.\n',alf*100);
else
    fprintf(fid,'\n\t     ** Model hipotezi testi %2.1f g�venle ge�ersizdir.\n',alf*100);
end
fprintf(fid,'\r\n\t#### UYU�UMSUZ �L��LER TEST�\r\n\r\n');
fprintf(fid,'\r\n\t\tDN\tBN\t  Vi\t   QVVi\t    Ti\t      q\t     YORUM\r\n');
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n');
for i = 1:n1
    if T_UYSM(i,1) <= q_UYSM
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',DNdog(i,1),BNdog(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYU�UMLU');
    else
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',DNdog(i,1),BNdog(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYU�UMSUZ');
    end
end
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n\n');
fprintf(fid,'-------------------------------------------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t\t\tCreated By Cumhuriyet University Department of Geomatics Engineering\n');
fprintf(fid,'--------------------------------------------------------------------------------------------------------------------\r\n');
fclose(fid);
else
fprintf(fid,'\t%s\n',datetime('now')); 
fprintf(fid,'\r\n\r\n\t ************** Serbest GEOMATR�K N�VELMAN A�I DENGELENMES� **************\r\n');
fprintf(fid,'\r\n\r\n--------------------------------------------------------------------------------\r\n\r\n \t 1 - VER�LENLER\r\n');
fprintf(fid,'--------------------------------------------------------------------------------\r\n');
fprintf(fid,'\n\t#### YAKLA�IK Y�KSEKL�K \r\n\r\n\t  N.N\t\t H \r\n');
fprintf(fid,'\t  ==\t      ======== \r\n');
fprintf(fid,'\t  %2.d\t%15.3f\r\n',K');
fprintf(fid,'\r\n\t#### �L��LEN Y�KSEKL�KLER VE KENARLAR\r\n');
fprintf(fid,'\r\n\r\n\t  **  GEOMETR�K N�VELMAN �L��LER� \r\n\r\n\t  DN\tBN\t Dh (m)\t\ts (m)\r\n\r\n');
fprintf(fid,'\t  ==\t==\t============\t========\r\n');
fprintf(fid,'\t  %2.d\t%d\t%11.5f\t �%.3f\r\n',dog_olc');
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n \t 2 - B�L�NMEYENLER�N ��Z�M� VE TERS A�IRLIK MATR�SLER�\r\n');
fprintf(fid,'---------------------------------------------------------------------\r\n');
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
fprintf(fid,'\n\t#### DATUM MATR�S�\r\n\r\n');
for i = 1:size(G,1)
    fprintf(fid,'\t|');
    fprintf(fid,'  %9.4f  ',G(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\n\t#### YEN� OLU�AN N NORMAL DENKLEMLER KATSAYILAR MATR�S� \r\n\r\n');
for i = 1:size(Ny,1)
    fprintf(fid,'\t|');
    fprintf(fid,'  %9.4f  ',Ny(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### DX DENGELEME B�L�NMEYENLER� (mm)\r\n\r\n');
for i = 1:size(dx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f',dx(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### Qxx B�L�NMEYENLER�N TERS A�IRLIK MATR�S�\r\n\r\n');
for i = 1:size(Qxx,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f ',Qxx(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### Qll DENGEL� �L��LER�N TERS A�IRLIK MATR�S�\r\n\r\n');
for i = 1:size(Qll,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.4f  ',Qll(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### Qvv D�ZELTMELER�N TERS A�IRLIK MATR�S�\r\n\r\n');
for i = 1:size(Qvv,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.4f  ',Qvv(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'----------------------------------------------------------------------\r\n\r\n3 - DENET�M �SLEMLER� VE ORTALAMA HATALAR\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\r\n\t#### DENGEL� �L��LER DENET�M� (m)\r\n\r\n');
fprintf(fid,'\t  %15.10f\n',denetim);
fprintf(fid,'\r\n\t#### �NSEL KARESEL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  s0 = %.3f cc\n',s0_dog);
fprintf(fid,'\r\n\t#### SONSAL ORTALAMA HATA (cc)\r\n\r\n');
fprintf(fid,'\t  m0 = %.3f cc\n',mo);
fprintf(fid,'\r\n\t#### B�L�NMEYENLER ve ORTALAMA HATALARI\r\n\r\n');
fprintf(fid,'\t  %10.3f    �%.3f mm\n',[KSNYUKSEKLIK mx]');
fprintf(fid,'\r\n\t#### �L��LER, DENGEL� �L��LER, D�ZELTMELER ve KOH\r\n\r\n');
fprintf(fid,'\r\n\tDN\tBN\t  �L��LER � KOH (cc)\tDENGEL� �L��LER � KOH\t   D�ZELTMELER � KOH\r\n');
fprintf(fid,'\t===\t===\t  =================\t=====================\t   =================\r\n');
fprintf(fid,'\t%2.0f\t%2.0f\t%10.3f �%.3f\t%10.3f �%.3f\t%10.3f �%.3f\t\n',[DNdog BNdog dog_olc(:,3) ms Dz ml V mv]');
fprintf(fid,'\r\n----------------------------------------------------------------------\r\n\r\n4 -MODEL H�POTEZ� VE UYU�UMSUZLUK TEST�\r\n');
fprintf(fid,'---------------------------------------"-------------------------------\r\n');
fprintf(fid,'\r\n\t#### MODEL H�POTEZ� TEST�\r\n\r\n');
fprintf(fid,'\r\n\t     TEST B�Y�KL���\t\tSINIR DE�ER');
fprintf(fid,'\r\n\t     ==============\t\t===========\r\n');
fprintf(fid,'\t     T = %.4f\t\tq = %.4f\r\n',T,q);
if T<q
    fprintf(fid,'\n\t     ** Model hipotezi testi %2.1f g�venle ge�ersiz say�lamaz.\n',alf*100);
else
    fprintf(fid,'\n\t     ** Model hipotezi testi %2.1f g�venle ge�ersizdir.\n',alf*100);
end
fprintf(fid,'\r\n\t#### UYU�UMSUZ �L��LER TEST�\r\n\r\n');
fprintf(fid,'\r\n\t\tDN\tBN\t  Vi\t   QVVi\t    Ti\t      q\t     YORUM\r\n');
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n');
for i = 1:n1
    if T_UYSM(i,1) <= q_UYSM
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',DNdog(i,1),BNdog(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYU�UMLU');
    else
        fprintf(fid,'\t\t%2.0f\t%2.0f\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',DNdog(i,1),BNdog(i,1),V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYU�UMSUZ');
    end
end
fprintf(fid,'\t\t==\t==\t=======\t =======  =======  =======  =========\n\n');
fprintf(fid,'-------------------------------------------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t\t\tCreated By Cumhuriyet University Department of Geomatics Engineering\n');
fprintf(fid,'--------------------------------------------------------------------------------------------------------------------\r\n');
fclose(fid);
end
end
