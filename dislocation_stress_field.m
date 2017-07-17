%% Shear stress on slip plane in the berger vector direction for a positive 
%  edge and screw dislocaiton
% This stress is applied on any dislocation at any parallel plane along y
% derection
% All blocks are working codes 

%%
% %% in x-y frame
% syms x y
% % a factor Gb/4pi needs to be multiplied on both sides
% nu = 0.33;
% tau_e = x*(x^2-y^2)/((1-nu)*(x^2+y^2)^2);
% tau_s = x/(x^2+y^2);
% subplot(1,2,1), ezsurf(tau_e,[-pi pi],40);
% subplot(1,2,2), ezsurf(tau_s,[-pi pi],40);

%% in theta and y coordinates

% syms theta y
% nu = 0.33;
% tau_e1 = sin(4*theta)/(4*y);
% tau_s1 = sin(2*theta)/(2*y);
% subplot(1,2,1), ezsurf(tau_e1,[-pi pi],20);
% subplot(1,2,2), ezsurf(tau_s1,[-pi pi],20);
%% Stress components in polar coordinates 
% Gb/2pi needs to be multiplied to get correct value

syms theta r
r = 1;
nu = 0.33;
sigmaE_x = -sin(theta)*(2+cos(2*theta))/((1-nu)*r);  
sigmaE_y = sin(theta)*cos(2*theta)/((1-nu)*r);
tauE_xy = cos(theta)*cos(2*theta)/((1-nu)*r);
sigmaE_z = -2*nu*sin(theta)/((1-nu)*r);
h = ezplot(sigmaE_x);
set(h,'Color','red', 'LineStyle', '--', 'LineWidth', 2);
hold on
h2 = ezplot(sigmaE_y);
set(h2,'Color','black', 'LineStyle', '--', 'LineWidth', 2);
h3 = ezplot(sigmaE_z);
set(h3,'Color','green', 'LineStyle', '--', 'LineWidth', 2);
h4 = ezplot(tauE_xy);
set(h4,'Color','m', 'LineStyle', '--', 'LineWidth', 2);
ylim([-3 3]); %axis([-3 3 -3 3 -4 4])
l = legend('sigma_xx','sigma_yy','sigma_zz','tau_xy','Location','SouthEast') ;
set(l, 'Box', 'off');
set(l, 'Color', 'none');
title('Stresses due to edge dislocation');

hold off

%% Polar plots
% Gb/2pi needs to be multiplied to get correct value
% syms theta r
% % r = 1;
% nu = 0.33;
% sigmaE_x = -sin(theta)*(2+cos(2*theta))/((1-nu)*r);  
% sigmaE_y = sin(theta)*cos(2*theta)/((1-nu)*r);
% tauE_xy = cos(theta)*cos(2*theta)/((1-nu)*r);
% sigmaE_z = -2*nu*sin(theta)/((1-nu)*r);
% 
% h = ezpolar(sigmaE_x);
% set(h,'Color','red', 'LineStyle', '--', 'LineWidth', 2);
% hold on
% h2 = ezpolar(sigmaE_y);
% set(h2,'Color','black', 'LineStyle', '--', 'LineWidth', 2);
% h3 = ezpolar(sigmaE_z);
% set(h3,'Color','green', 'LineStyle', '--', 'LineWidth', 2);
% h4 = ezpolar(tauE_xy);
% set(h4,'Color','m', 'LineStyle', '--', 'LineWidth', 2);
% ylim([-3 3]);
% l = legend('sigma_xx','sigma_yy','sigma_zz','tau_xy','Location','SouthEast') ;
% set(l, 'Box', 'off');
% set(l, 'Color', 'none');
% title('Stresses due to edge dislocation');
% 
% hold off

%%
% [x,y] = meshgrid(-3:1/8:3);
% z = peaks(x,y);
% surfl(x,y,z);
% shading interp
% colormap(gray);
% axis([-3,3,-3,3,-8,8])
% view([10 10])
% grid on
% hold on
% surfl(peaks)
% shading interp
% colormap copper
% hold off
%%
% figure
% [X,Y] = meshgrid(-2:0.25:2,-1:0.2:1);
% Z = X.* exp(-X.^2 - Y.^2);
% [U,V,W] = surfnorm(X,Y,Z);
% quiver3(X,Y,Z,U,V,W,0.5);
% hold on
% surf(X,Y,Z);
% colormap hsv
% view(-35,45)
% axis ([-2 2 -1 1 -.6 .6])
% hold off