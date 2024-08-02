% function Graphs()
clear
clc;
close all
global  Ksm0 etta0 z1  Ksm  etta dis1 dis2 time u1 u2 qO1 qO2 ...
    qC1 qC2 e1 e2 S ddxL1  ddxR1 ddxR2 ddxL2...
      de1 xL1 xR1 dxL1 dxR1 KpL1 KpR1 BpiR1  BpdR1...
      BpiL1 BpdL1  FL1  FR1 RLi1 RRi1 RLd1 RRd1 PR1 PL1...
      ddxL2  ddxR2...
      de2 xL2 xR2 dxL2 dxR2 KpL2 KpR2 BpiR2  BpdR2...
      BpiL2 BpdL2  FL2  FR2 RLi2 RRi2 RLd2 RRd2 PR2 PL2
%% Defaults for this blog post
width = 8;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz =16 ;      % Fontsize
lw = 1;      % LineWidth
msz = 8;       % MarkerSize
%% loads
system=load('system10');
%% extract
dis1=system.dis1;
dis2=system.dis2;
time=system.time;
u1=system.u1;
u2=system.u2;
qO1=system.qO1;
qO2=system.qO2;
qC1=system.qC1;
qC2=system.qC2;
e1=system.e1;
e2=system.e2;
de1=system.de1;
%
xL1=system.xL1;
xR1=system.xR1;
dxL1=system.dxL1;
dxR1=system.dxR1;
ddxL1=system.ddxL1; 
ddxR1=system.ddxR1;
KpL1=system.KpL1;
KpR1=system.KpR1; 
BpiR1=system.BpiR1;
BpdR1=system.BpdR1;
BpiL1=system.BpiL1;
BpdL1=system.BpdL1;
FL1=system.FL1;
FR1=system.FR1;
RLi1=system.RLi1;
RRi1=system.RRi1;
RLd1=system.RLd1;
RRd1=system.RRd1;
PR1=system.PR1;
PL1=system.PL1;

%
xL2=system.xL2;
xR2=system.xR2;
dxL2=system.dxL2;
dxR2=system.dxR2;
ddxL2=system.ddxL2; 
ddxR2=system.ddxR2;
KpL2=system.KpL2;
KpR2=system.KpR2; 
BpiR2=system.BpiR2;
BpdR2=system.BpdR2;
BpiL2=system.BpiL2;
BpdL2=system.BpdL2;
FL2=system.FL2;
FR2=system.FR2;
RLi2=system.RLi2;
RRi2=system.RRi2;
RLd2=system.RLd2;
RRd2=system.RRd2;
PR2=system.PR2;
PL2=system.PL2;
Ksm=system.Ksm;  
etta=system.etta;
%% Input
figure(1)
subplot(2,1,1)
plot(time,dis1,'b','linewidth',2)
grid minor
xlabel('time - s')
ylabel('Torque - N.m')
title('External Disturbance')
legend('Input 1')
subplot(2,1,2)
plot(time,dis2,'r','linewidth',2)
grid minor
xlabel('time - s')
ylabel('Torque - N.m')
legend('Input 2')
%% teta
figure(2)
plot(time,qO1,'r','linewidth',2)%,'markersize',5
hold on
plot(time,qC1,'b--','linewidth',2)
grid minor
xlabel('time - s')
ylabel('\theta_1 - rad')
title('Angular Displacement Link 1')
legend('Uncontrol','Control')
%%
figure(3)
plot(time,qO2,'r','linewidth',2)%,'markersize',5
hold on
plot(time,qC2,'b--','linewidth',2)
grid minor
xlabel('time - s')
ylabel('\theta_2 - rad')
title('Angular Displacement Link 2')
legend('Uncontrol','Control')
%% efforts
figure(4)
subplot(2,1,1)
plot(time,u1,'linewidth',2)
grid minor
xlabel('time - s')
ylabel('Amp - Pa')
title('Control Effort Link 1')
subplot(2,1,2)
plot(time,u2,'linewidth',2)
grid minor
xlabel('time - s')
ylabel('Amp - Pa')
title('Control Effort Link 2')
%% errors
figure(5)
subplot(2,1,1)
plot(e1,'linewidth',2)
grid minor
xlabel('time - s')
ylabel('Amp')
title('e_1')
xlim([1,time(end)])
subplot(2,1,2)
plot(e2,'linewidth',2)
grid minor
xlabel('time - s')
ylabel('Amp')
title('e_2')
xlim([1,time(end)])
%% S
% figure(6)
% plot(S(:,1),S(:,2),'linewidth',2)
% grid minor
% xlabel('time - s')
% ylabel('Amp- N.m')
% title('Sliding Plane')
%%  Complaince PAM 2
figure(7)
pos=get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*200, height*200]); %<- Set size
set(gca, 'FontSize', 2*fsz, 'LineWidth', 2*alw); %<- Set properties
subplot(3,3,1)
plot(time,xL1,'b','linewidth',2)
hold on
plot(time,xR1,'r:','linewidth',2)
title('Length Muscle 1 ')
xlabel('t- s')
ylabel('Amp - m')
legend('Left','Right','location','southwest')
grid minor
%
subplot(3,3,2)
plot(time,dxL1,'b','linewidth',2)
hold on
plot(time,dxR1,'r:','linewidth',2)
title('Velocity Muscle 1 ')
xlabel('t- s')
ylabel('Amp - m/s')
legend('Left','Right','location','northwest')
grid minor
%
%
subplot(3,3,3)
plot(time,ddxL1,'b','linewidth',2)
hold on
plot(time,ddxR1,'r:','linewidth',2)
title('Acceleration Muscle 1 ')
xlabel('t- s')
ylabel('Amp - m/s^2')
legend('Left','Right','location','northwest')
grid minor
%
subplot(3,3,4)
plot(time,KpL1,'b','linewidth',3)
hold on
plot(time,KpR1,'r')
title('Spring Muscle 1 ')
xlabel('t- s')
ylabel('Amp - N/m')
legend('Left','Right','location','northwest')
grid minor
% 
subplot(3,3,5)
plot(time,BpiL1,'b','linewidth',2)
hold on
plot(time,BpdL1,'r:','linewidth',2)
title(' Damping Left Muscle 1 ')
xlabel('t- s')
ylabel('Amp - N.s/m')
legend('Inflation','Deflation','location','northwest')
grid minor
%  
subplot(3,3,6)
plot(time,BpiR1,'b','linewidth',2)
hold on
plot(time,BpdR1,'r:','linewidth',2)
title('  Damping Right Muscle 1 ')
xlabel('t- s')
ylabel('Amp - N.s/m')
legend('Inflation','Deflation','location','northwest')
grid minor
% 
subplot(3,3,7)  
plot(time,RLd1,'b','linewidth',3)
hold on
plot(time,RRd1,'r')
title('Defelation Force Muscle 1 ')
xlabel('t- s')
ylabel('Amp - N')
legend('Left','Right','location','northwest')
grid minor
%
subplot(3,3,8)
plot(time,RLi1,'b','linewidth',3)
hold on
plot(time, RRi1,'r')
title('Inflation Force Muscle 1 ')
xlabel('t- s')
ylabel('Amp - N')
legend('Left','Right','location','northwest')
grid minor
%
subplot(3,3,9)
plot(time,PR1,'b','linewidth',2)
hold on
plot(time,PL1,'r:','linewidth',2)
title('Pressure Left Muscle 1 ')
xlabel('t- s')
ylabel('Amp - Pa')
legend('Uncontrol','Control','location','southwest')
grid minor
%%  Complaince PAM 2
figure(8)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*200, height*200]); %<- Set size
set(gca, 'FontSize', 2*fsz, 'LineWidth', 2*alw); %<- Set properties
subplot(3,3,1)
plot(time,xL2,'b','linewidth',2)
hold on
plot(time,xR2,'r:','linewidth',2)
title('Length Muscle 2 ')
xlabel('t- s')
ylabel('Amp - m')
legend('Left','Right','location','southwest')
grid minor
%
subplot(3,3,2)
plot(time,dxL2,'b','linewidth',2)
hold on
plot(time,dxR2,'r:','linewidth',2)
title('Velocity Muscle 2 ')
xlabel('t- s')
ylabel('Amp - m/s')
legend('Left','Right','location','northwest')
grid minor
%
%
subplot(3,3,3)
plot(time,ddxL2,'b','linewidth',2)
hold on
plot(time,ddxR2,'r:','linewidth',2)
title('Acceleration Muscle 2 ')
xlabel('t- s')
ylabel('Amp - m/s^2')
legend('Left','Right','location','northwest')
grid minor
%
subplot(3,3,4)
plot(time,KpL2,'b','linewidth',3)
hold on
plot(time,KpR2,'r')
title('Spring Muscle 2 ')
xlabel('t- s')
ylabel('Amp - N/m')
legend('Left','Right','location','northwest')
grid minor
% 
subplot(3,3,5)
plot(time,BpiL2,'b','linewidth',2)
hold on
plot(time,BpdL2,'r:','linewidth',2)
title(' Damping Left Muscle 2 ')
xlabel('t- s')
ylabel('Amp - N.s/m')
legend('Inflation','Deflation','location','northwest')
grid minor
%  
subplot(3,3,6)
plot(time,BpiR2,'b','linewidth',2)
hold on
plot(time,BpdR2,'r:','linewidth',2)
title('  Damping Right Muscle 2 ')
xlabel('t- s')
ylabel('Amp - N.s/m')
legend('Inflation','Deflation','location','northwest')
grid minor
% 
subplot(3,3,7)  
plot(time,RLd2,'b','linewidth',3)
hold on
plot(time,RRd2,'r')
title('Defelation Force Muscle 2 ')
xlabel('t- s')
ylabel('Amp - N')
legend('Left','Right','location','northwest')
grid minor
%
subplot(3,3,8)
plot(time,RLi2,'b','linewidth',3)
hold on
plot(time, RRi2,'r')
title('Inflation Force Muscle 2 ')
xlabel('t- s')
ylabel('Amp - N')
legend('Left','Right','location','northwest')
grid minor
%
subplot(3,3,9)
plot(time,PR2,'b','linewidth',2)
hold on
plot(time,PL2,'r:','linewidth',2)
title('Pressure Left Muscle 2 ')
xlabel('t- s')
ylabel('Amp - Pa')
legend('Uncontrol','Control','location','southwest')
grid minor
%% Sliding Mode Gain  
figure(9)
subplot(2,1,1)
plot(Ksm,'linewidth',2)
grid minor
xlabel('time - s')
ylabel('Amp')
title('K_s_m')
xlim([1,time(end)])
subplot(2,1,2)
plot(etta,'linewidth',2)
grid minor
xlabel('time - s')
ylabel('Amp')
title('\eta')
xlim([1,time(end)])