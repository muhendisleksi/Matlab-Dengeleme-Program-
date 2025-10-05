clear
clc

Z =[

  4   80.6730
    1.0000  123.8290
    2.0000  104.6350
    3.0000  138.1130]
y=1:1:length(Z(:,2))
y=y'
Z=[Z y]
NOKTAD = [Z(:,1)]
Dog_olc = num(:,4:5);
Dog_olc = Dog_olc(isfinite(Dog_olc(:,1)),:);
zz=[Dog_olc(:,1:2)]
