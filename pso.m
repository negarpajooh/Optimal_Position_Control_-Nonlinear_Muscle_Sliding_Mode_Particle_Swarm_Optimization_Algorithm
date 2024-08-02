clc;
clear;
close all;
%% Problem Definition
global  Ksm0 etta0 z1 z2 Ksm  etta dis1 dis2 time u1 u2 qO1 qO2 ...
    qC1 qC2 e1 e2 S ddxL1  ddxR1 etta Ksm ddxR2 ddxL2...
      de1 xL1 xR1 dxL1 dxR1 KpL1 KpR1 BpiR1  BpdR1...
      BpiL1 BpdL1  FL1  FR1 RLi1 RRi1 RLd1 RRd1 PR1 PL1...
      de2 xL2 xR2 dxL2 dxR2 KpL2 KpR2 BpiR2  BpdR2...
      BpiL2 BpdL2  FL2  FR2 RLi2 RRi2 RLd2 RRd2 PR2 PL2 delta0
CostFunction=@(x) KARAMY2(x);        % Cost Function
nVar=3;             % Number of Decision Variables
VarSize=[1 nVar];   % Size of Decision Variables Matrix
VarMin=0;         % Lower Bound of Variables
VarMax=1;         % Upper Bound of Variables
%% PSO Parameters

MaxIt=30;      % Maximum Number of Iterations

nPop=200;        % Population Size (Swarm Size)

% w=1;            % Inertia Weight
% wdamp=0.99;     % Inertia Weight Damping Ratio
% c1=2;           % Personal Learning Coefficient
% c2=2;           % Global Learning Coefficient

% Constriction Coefficients
phi1=2.05;
phi2=2.05;
phi=phi1+phi2;
chi=2/(phi-2+sqrt(phi^2-4*phi));
w=chi;          % Inertia Weight
wdamp=1;        % Inertia Weight Damping Ratio
c1=chi*phi1;    % Personal Learning Coefficient
c2=chi*phi2;    % Global Learning Coefficient

% Velocity Limits
VelMax=0.1*(VarMax-VarMin);
VelMin=-VelMax;

%% Initialization

empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];

particle=repmat(empty_particle,nPop,1);

GlobalBest.Cost=inf;

for i=1:nPop
    
    % Initialize Position
    particle(i).Position=unifrnd(VarMin,VarMax,VarSize);
    
    % Initialize Velocity
    particle(i).Velocity=zeros(VarSize);
    
    % Evaluation
    particle(i).Cost=CostFunction(particle(i).Position);
    
    % Update Personal Best
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    
    % Update Global Best
    if particle(i).Best.Cost<GlobalBest.Cost
        
        GlobalBest=particle(i).Best;
        
    end
    
end

BestCost=zeros(MaxIt,1);

nfe=zeros(MaxIt,1);


%% PSO Main Loop

for it=1:MaxIt
    
    for i=1:nPop
        
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position) ...
            +c2*rand(VarSize).*(GlobalBest.Position-particle(i).Position);
        
        % Apply Velocity Limits
        particle(i).Velocity = max(particle(i).Velocity,VelMin);
        particle(i).Velocity = min(particle(i).Velocity,VelMax);
        
        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        
        % Velocity Mirror Effect
        IsOutside=(particle(i).Position<VarMin | particle(i).Position>VarMax);
        particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);
        
        % Apply Position Limits
        particle(i).Position = max(particle(i).Position,VarMin);
        particle(i).Position = min(particle(i).Position,VarMax);
        
        % Evaluation
        particle(i).Cost = CostFunction(particle(i).Position);
        
        % Update Personal Best
        if particle(i).Cost<particle(i).Best.Cost
            
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            
            % Update Global Best
            if particle(i).Best.Cost<GlobalBest.Cost
                
                GlobalBest=particle(i).Best;
                
            end
            
        end
        
    end
    
    BestCost(it)=GlobalBest.Cost;
    
%     nfe(it)=NFE;
    
    disp(['Iteration ' num2str(it)  ', Best Cost = ' num2str(BestCost(it))]);
    
    w=w*wdamp;
    
end
save('system30')
Graphs
%% Results

% figure;
% %plot(nfe,BestCost,'LineWidth',2);
% semilogy(nfe,BestCost,'LineWidth',3);
% xlabel('Iteration');
% ylabel('Best Cost');
% title(['Optimization ',num2str(MaxIt), ' Iterations'])
% grid minor
