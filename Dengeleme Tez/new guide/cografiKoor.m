function cografiKoor(x,y,z,datum)
global fi0 lamda h V N ho
for i = 1:length(x)
    if strcmp(datum,'WGS84')
        a=6378137.0;
        b=6356752.314;
    elseif strcmp(datum,'itrf') % Hayford
        a=6378388.0;
        b=6356911.946;
    elseif strcmp(datum,'basel')
        a=6377937.155;
        b=6356078.963;

    end
    c=a^2/b;
    f=(a-b)/a;
    n=a-b/a+b;
    e=sqrt( (a^2)-(b^2) )/a ;
    ee=sqrt( (a^2)-(b^2) )/b;
    lamda(i)=acosd(x(i)/sqrt(x(i)^2+y(i)^2));
    fi0(i)=atand((z(i)*(1+ee^2))/sqrt( (x(i)^2)+(y(i)^2) ));
    V(i)=sqrt((1+(ee^2)*cosd(fi0(i))^2 ));
    N(i)=c/V(i);
    h(i)=sqrt(x(i)^2+y(i)^2)/cosd(fi0(i))-N(i);
    hfark=1; sayac=0;
    while abs(hfark) >= 0.001
        fi0(i)=atand(((z(i)*(1+ee^2)))/sqrt(x(i)^2+y(i)^2)*((1+(ee^2)*h(i)/(N(i)+h(i)))^-1));
        V(i)=sqrt((1+(ee^2)*cosd(fi0(i))^2 ));
        N(i)=c/V(i);
        ho(i)=sqrt(x(i)^2+y(i)^2)/cosd(fi0(i))-N(i);
        hfark=ho(i)-h(i);
        h(i)=ho(i);
        sayac=sayac+1;
    % fprintf('fi0= %2.6f\n',fi0);
    % fprintf('lamda= %2.6f\n',lamda);
    % fprintf('h= %.6f\n',h);
    % fprintf('-----------------------------------------------\n');

    end
    % save fi0 lamda h
end
