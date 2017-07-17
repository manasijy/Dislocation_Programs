u = 80000; % Shear modulus, measure in Mpa
nu = 0.3; % Poission’s ratio of material
b = .00025; % Burgers Vector measured in microns
[x,y]=meshgrid(-100:1:100,-100:1:100); % area of grid to which stress field is mapped
angle = 54.7; % angle of slip plane in degrees
theta = angle*pi/180; % angle converted to radians
steplength = 400;
interplanarspacing = 100*b; % spacing between slip planes is about 100 b
x2 = (x.*cos(theta) + y.*sin(theta));% rotates and displaces dislocation
y2 = (y.*cos(theta) - x.*sin(theta));%; rotates and displaces dislocation
QxxPRIME = -(u .* b / (2.*pi .* (1-nu))) .* ((y2 .* (3.*x2.^2 +y2.^2)) ./ ((x2.^2 + y2.^2).^2)); % Qyy stress PRIME
QyyPRIME = (u .* b / (2.*pi .* (1-nu))) .* ((y2 .* (x2.^2 -y2.^2)) ./ ((x2.^2 + y2.^2).^2)); % Qyy stress PRIME
QxyPRIME = (u .* b / (2.*pi .* (1-nu))) .* ((x2 .* (x2.^2 -y2.^2)) ./ ((x2.^2 + y2.^2).^2)); % Qxy stress PRIME
QxxPRIME(QxxPRIME<-.5) = -.5; % erase low value
QxxPRIME(QxxPRIME>.5) = .5; % erase high value
dx = steplength.*cos(theta);
dy = steplength.*sin(theta);
y = y+dy;
x = x+dx;
caxis([-0.5,0.5]); % set the legend limit
contourf(x(1,:),y(:,1)',QxxPRIME)
axis equal