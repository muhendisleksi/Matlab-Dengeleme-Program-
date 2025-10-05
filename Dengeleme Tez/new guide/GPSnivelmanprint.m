function GPSnivelmanprint
global K1 K2 d A P l N n Qxx  dx V yeni_N yeni_H...
    so mx mo number Qll Qvv mv ml alf T q T_UYSM q_UYSM...
    u ms n1 blnmynlr
[file, path] = uiputfile ( '*.txt;' , 'Output Save File');
filename=fullfile(path,file);
fid = fopen(filename,'wt');
fprintf(fid,'\t%s\n',datetime('now')); 
fprintf(fid,'\r\n\r\n\t ************** GPS Nivelman AÐI DENGELENMESÝ **************\r\n');
fprintf(fid,'\r\n\r\n--------------------------------------------------------------------------------\r\n\r\n \t 1 - VERÝLENLER\r\n');
fprintf(fid,'--------------------------------------------------------------------------------\r\n');
fprintf(fid,'\n\t#### BÝLÝNEN DEÐERLER \r\n\r\n\t N.N.\t     X\t            Y\t          h(m)\t       H(m)\t     N(m) \r\n');
fprintf(fid,'\t ===      ========       =========     ========      ========      ========\r\n');
fprintf(fid,'\t  %d       %4.3f     %10.3f     %10.3f     %8.3f       %1.3f\r\n \r\n',K1');
fprintf(fid,'\r\n\t#### H VE N DEÐERÝ ÝSTENÝLEN NOKTALAR \r\n\r\n\t   X\t\t Y\t     h \r\n');
fprintf(fid,'\t========     ========     ========\r\n');
fprintf(fid,'\t%1.3f     %1.3f      %1.3f\r\n',K2');
fprintf(fid,'\r\n\r\n----------------------------------------------------------------------\r\n\r\n \t 2 - BÝLÝNMEYENLERÝN ÇÖZÜMÜ VE TERS AÐIRLIK MATRÝSLERÝ\r\n');
fprintf(fid,'----------------------------------------------------------------------\r\n');
fprintf(fid,'\n\t#### P AÐIRLIK MATRÝSÝ\r\n\r\n');
for i = 1:size(P,1)
    fprintf(fid,'\t|');
    fprintf(fid,'  %1.4f  ',P(i,:));
    fprintf(fid,'|\r\n');
end
fprintf(fid,'\r\n\t#### A KATSAYILAR MATRÝSÝ\r\n\r\n');
for i = 1:size(A,1)
    fprintf(fid,'\t|');
    fprintf(fid,' %7.4f ',A(i,:));
    fprintf(fid,'|\r\n');
end 
fprintf(fid,'\r\n\t#### L ÖTELEME VEKTÖRÜ (m)\r\n\r\n');
for i = 1:size(l,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%7.3f',l(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### N  NORMAL DENKLEMLER KATSAYILAR MATRÝSÝ\r\n\r\n');
for i = 1:size(N,1)
    fprintf(fid,'\t|');
    fprintf(fid,'%8.4f',N(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### n SAÐ TARAF VEKTÖRÜ\r\n\r\n');
for i = 1:size(n,1)
    fprintf(fid,'\t| ');
    fprintf(fid,'%7.4f',n(i,:));
    fprintf(fid,' |\r\n');
end
fprintf(fid,'\r\n\t#### DX DENGELEME BÝLÝNMEYENLERÝ (m)\r\n\r\n');
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
for i = 1:n1
    fprintf(fid,'\t   %.d.   ±%.3f mm\n',blnmynlr(i), mx(i));
end
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
fprintf(fid,'\r\n\t  Bilinmeyenler\t  Vi\t   QVVi\t    Ti\t      q\t     YORUM\r\n');
fprintf(fid,'\t  =============\t ======= =======  =======  =======  =========\n');


for i = 1:n1
    if T_UYSM(i,1) <= q_UYSM
        fprintf(fid,'\t\t%d\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',i, V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMLU');
    else
        fprintf(fid,'\t\t%d\t%7.3f\t  %.4f   %.4f   %.4f   %s\n',i,V(i,1),Qvv(i,i),T_UYSM(i,1),q_UYSM,'UYUÞUMSUZ');
    end
end
fprintf(fid,'\t  =============\t=======\t =======  =======  =======  =========\n\n');
fprintf(fid,'-------------------------------------------------------------------------------------------------------------------\r\n');
fprintf(fid,'\t\t\tCreated By Cumhuriyet University Department of Geomatics Engineering\n');
fprintf(fid,'--------------------------------------------------------------------------------------------------------------------\r\n');
fclose(fid);
