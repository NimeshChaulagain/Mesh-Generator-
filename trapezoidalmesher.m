clc;
clear;
close all;

x_width = 0.866025;
y_height = 1;
n_outer_xy = 4; %no. of nodes on the outer side
n_tot = (3*n_outer_xy*n_outer_xy-n_outer_xy) / 2; %total number of nodes
dx = x_width / (n_outer_xy-1);
dy = y_height / (n_outer_xy-1);
p = zeros(2, n_tot); % coordinates stored in the 2*n matrix
cl = zeros(3, n_tot);
K = 0;
Ny = n_outer_xy;
offset = 0.5;
off = offset;
b = 1;
x = 0;
x_incre = 0;
n_incre = n_outer_xy;
for l = 1:n_outer_xy
    for j= 1:Ny
        y = off + (j-1)*dy;
        
        K= K+1;
        p(1,K) = x; % first row contains all the x-coordinates
        p(2,K) = y; % second row contains all the y-coordinates
        
        plot(p(1,:), p(2,:),'o'); %% what this does is plot the points of the meshes     
    end
x_incre = x_incre+dx;
Ny = Ny+1;
b = 0.5+0.5773672*x_incre; 
off = offset-(b-0.5);
x = x + dx;
end

k= 0;
ny= n_outer_xy;
l=1;

for j= 1:ny-1
    for i = 1:ny
        k1=l;
        k2=l+ny;
        k3=k2+1;
        k4=k1+1;
        
        if i~=ny
            k=k+1;
            cl(:,k)=[k1;k2;k3];
            k=k+1;
            cl(:,k)=[k1; k3; k4];
            
        else
            k=k+1;
            cl(:,k)=[k1;k2;k3];
        end
        
        l=l+1;
    end
    ny=ny+1;
end



hold all
patch( 'faces', cl', 'vertices', p', 'facecolor', 'c', 'edgecolor', 'k') %plots the connectivity
plot (p(1,:), p(2,:), 'o', 'color', 'k'); %plots the points 
