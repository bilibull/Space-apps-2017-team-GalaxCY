R = 6371007.181; %Earth Radius
T = 1111950; %height & width of each MODIS tile in projection plane
x_min = -20015109; %western limit
y_max = 10007555; %northern limit
w = T/1200; %actual size of a 1km MODIS sinusoidal grid cell

file = 'modis18.hdf';
firemap = hdfread(file, 'FireMask');
firemap = flipud(firemap);

i = [];
j = [];
for c1=1:1200
    for c2 = 1:1200
        if ((firemap(c1,c2)) >= 8),
            i = [i c1];
            j = [j c2];
        end
    end
end

H = 20; 
V = 5;

y=[];
for c1=1:length(i)
    y(c1) = y_max - (i(c1) + 0.5)*w - V*T;
end

for c1=1:length(j)
    x(c1) = (j(c1)+0.5)*w + H*T +x_min;
end


lat = y/R;
lon = x./(R*cos(lat));

lon = (lon*180)/pi;
lat = (lat*180)/pi;

csvwrite('longitude_horiz.csv', lon);
csvwrite('latitude_vertic.csv', lat);