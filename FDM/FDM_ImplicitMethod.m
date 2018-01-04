% FDM
% implictit method
% homogenous, isotropic, 1D, confined flow
close all
clear all

%%
% initial condition
h0(1:16) = 8.0;

% base parameters
dx = 1;
L = 15;
T = 0.90; %=bK m2/d
S = 0.04;
%dt = 0.0139; %days
%dt = 0.01; %days
%r = T/S*dt/(dx^2);
r = 0.48;
%r = 0.52;
dt = r/(T/S/(dx^2)); %days

days = 1;
steps = round(days/dt);

% boundary conditions
% initial conditions
h(1:16,1) = h0;

% LBC constant head
h(1,1:steps) = 8.0;
% RBC constant head
h(16,1:steps) = 2.0;

%%
% for loop space and time
% solve [K][ht+1]=[ht]

K(1:16,1:16) = 0;
ht(1:16,1) = 0;
for t = 1:steps-1
    %build matrice
    K(1,1) = 1;
    ht(1,1) = h(1,t);
    for i = 2:15
       K(i,i-1) = -r;
       K(i,i) = 1+2*r;
       K(i,i+1) = -r;
       ht(i,1) = h(i,t);
    end
    K(16,16) = 1;
    ht(16,1) = h(16,t);
    %solve
    ht1 = K^(-1)*ht;
    h(:,t+1) = ht1;
    ht2 = inv(K)*ht;
    ht3 = linsolve(K,ht);
    ht3 = K\ht;  %the fastest, left division
    as = 1;
    
end

%%
%plot results
figure
plot(h(2,:),'DisplayName','x=1m')
hold on
plot(h(6,:),'DisplayName','x=5m')
plot(h(11,:),'DisplayName','x=10m')
plot(h(14,:),'DisplayName','x=13m')
plot(h(15,:),'DisplayName','x=14m')
ylabel('head (m)')
xlabel('time step (-)')
legend('show')