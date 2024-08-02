function z=KARAMY2(x)
global  Ksm0 etta0 z1 z2 Ksm  etta dis1 dis2 time u1 u2 qO1 qO2 ...
    qC1 qC2 e1 e2 S ddxL1  ddxR1 etta Ksm ddxR2 ddxL2...
      de1 xL1 xR1 dxL1 dxR1 KpL1 KpR1 BpiR1  BpdR1...
      BpiL1 BpdL1  FL1  FR1 RLi1 RRi1 RLd1 RRd1 PR1 PL1...
      de2 xL2 xR2 dxL2 dxR2 KpL2 KpR2 BpiR2  BpdR2...
      BpiL2 BpdL2  FL2  FR2 RLi2 RRi2 RLd2 RRd2 PR2 PL2 delta0
%%
% epsilon=0.1;
% beta=80;
% 206.844<=P=<620.532
% q1=0.6;
% q2=1;
% dq1=dq2=0;
%%
% sim('Nouri')
% x(1)=.001;
% x(2)=.001;[x(1),0;0,x(2)];
Ksm0=x(1);
% Ksm0=x(1);
% etta0=x(3);
% Ksm0=.0001;[x(3);x(4)];
etta0=x(3);
% delta0=x(5);
sim('Karamy')
E1=e1;
E2=e2;
zz1=max(E1);
zz2=max(E2);
z1=zz1+zz2;
z=z1;
end
% z=[z1];%;z2];
% end
%%
% xR1=(pi+q1)*r1;
% xL1=(pi+q1)*r1;
% dxR1=(pi+dq1)*r1;
% dxL1=(pi+dq1)*r1;
% xR2=(pi+q2)*r2;
% xL2=(pi+q2)*r2;
% dxR2=(pi+dq2)*r2;
% dxL2=(pi+dq2)*r2;
%%
% P_R1=P_0R1+dp1;
% P_L1=P_0L1+dp1;
% P_R2=P_0R2+dp2;
% P_L2=P_0L2+dp2;
%%
% Kp=K0+K1*p;
% Bpi=B0+B1*p;
% Bpd=B0-B1*p;
% Fp=F0+F1*p;
%%
% R_R1=n1*(F_R1-B_R1*dxR1-K_R1*xR1);
% R_L1=n1*(F_L1-B_L1*dxL1-K_L1*xL1);
% R_R2=n2*(F_R2-B_R2*dxR2-K_R2*xR2);
% R_L2=n2*(F_L2-B_L2*dxL2-K_L2*xL2);
