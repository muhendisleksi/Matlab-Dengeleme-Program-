clear
clc
d = '�ar��ba�� mahallesi kepenek caddesi Astek �nternet Kafe Sivas, T�rkiye';
address = {d};
filename = 'MathWorks.kml';
kmlwrite(filename, address, 'Name', address);
winopen(filename)