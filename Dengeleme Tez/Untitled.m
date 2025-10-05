clear
clc
d = 'çarþýbaþý mahallesi kepenek caddesi Astek Ýnternet Kafe Sivas, Türkiye';
address = {d};
filename = 'MathWorks.kml';
kmlwrite(filename, address, 'Name', address);
winopen(filename)