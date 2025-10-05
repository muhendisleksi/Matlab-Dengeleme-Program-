clear
clc
NN = [23;24];
x = [3710709.539;3710479.640];
y = [3084028.627;3084171.030];
z = [4157648.644;4157677.581];
datum = 'WGS84';
for i = 1:length(x)
    cografiKoor(x,y,z,datum)    
    global fi0 lamda %h
    enlem(i) = fi0(i); 
    boylam(i) = lamda(i); 
    camera = geopoint(enlem(i),boylam(i));
    camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
    name{i} = sprintf('%d. Nokta Konumu', NN(i));
    lat(i) = camera.Latitude;
    lon(i) = camera.Longitude;    
end
filename = 'NoktaKonumlari.kml';
kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
winopen(filename);