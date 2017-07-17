u = 80000; % Shear modulus, measure in Mpa
nu = 0.3; % Poission’s ratio of material
b = .00025; % Burgers Vector measured in microns
[x,y]=meshgrid(-100:1:100,-100:1:100); % area of grid to which stress field is mapped
angle = 54.7; % angle of slip plane in degrees
theta = angle*pi/180; % angle converted to radians
Qxx = -(u .* b / (2.*pi .* (1-nu))) .* ((y .* (3.*x.^2 +y.^2)) ./ ((x.^2 + y.^2).^2)); % Qxx stress
Qyy = (u .* b / (2.*pi .* (1-nu))) .* ((y .* (x.^2 -y.^2)) ./ ((x.^2 + y.^2).^2)); % Qyy stress
Qxy = (u .* b / (2.*pi .* (1-nu))) .* ((x .* (x.^2 -y.^2)) ./ ((x.^2 + y.^2).^2)); % Qxy stress
x2 = x.*cos(theta) + y.*sin(theta); % rotates dislocation
y2 = y.*cos(theta) - x.*sin(theta); % rotates dislocation
QxxPRIME = -(u .* b / (2.*pi .* (1-nu))) .* ((y2 .* (3.*x2.^2 +y2.^2)) ./ ((x2.^2 + y2.^2).^2)); % Qyy stress PRIME
QyyPRIME = (u .* b / (2.*pi .* (1-nu))) .* ((y2 .* (x2.^2 -y2.^2)) ./ ((x2.^2 + y2.^2).^2)); % Qyy stress PRIME
QxyPRIME = (u .* b / (2.*pi .* (1-nu))) .* ((x2 .* (x2.^2 -y2.^2)) ./ ((x2.^2 + y2.^2).^2)); % Qxy stress PRIME
contourf(x(1,:),y(:,1)',QxxPRIME)
axis equal