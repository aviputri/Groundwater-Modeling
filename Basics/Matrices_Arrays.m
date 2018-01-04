% to create matrix

% Matrices and Arrays
A = [16 3 2 13; 5 10 11 8; 9 6 7 12; 4 15 14 1];
B = [16 3 2 13; 5 10 11 8; 9 6 7 12; 4 15 14 1];

% With and without ;
sumColl4 = A(1,4) + A(2,4) + A(3,4) + A(4,4);
% add the values on the row 4

% the colon operator
Co1 = 1:10; % to create an array with the value of 1-10 with the interval of 1
Co2 = 1:2:10; % to create an array with the value of 1-10 with the interval of 2
sumColl4 = sum(A(1,1:4)); % add the values on the column 1

% dot product
AdotA = A.*A;

% matrix product
AtimesA = A*A;

% vector cross product
U = [3 -4 1];
V = [5 2 -6];
UcrossV = cross(U,V);

% Plots
x = 0:pi/100:2*pi;
y = sin(x);
y2 = sin(x-.25);
y3 = sin(x-.5);
plot(x,y,x,y2,x,y3)








