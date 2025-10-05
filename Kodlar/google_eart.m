clear
clc
enlem = 39.74; %enlem
boylam = 37; %boylam
camera = geopoint(enlem,boylam);
camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
name = 'Nokta konumu';
filename = 'WashingtonMonument.kml';
lat = camera.Latitude;
lon = camera.Longitude;
kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
winopen(filename)