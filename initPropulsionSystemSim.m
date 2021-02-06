clear
applyReceiverAccumulatorPatch();
%initFillingSystemSim()
%%
%Sim fluid data
%Combustion products data for thermochem (load once). 
%In global workspace so can be found by combustion products thermo block. 
%(Maybe there's a cleaner way to do this with masks??)
load('+HybridMotor/propepPropsKeraxN2O_modified.mat');
Sim.nitrousFluidTable = getNitrousFluidTable(); %Nitrous fluid properties for two phase flow model
Sim.extraNitrousPropsTable = getExtraNitrousFluidTable();
Sim.PAmbient = 101325; %Pa

%%
%Feed System properties
Sim.phaseChangeTimeConstant = 0.01; %sec. Arbitrary value, please refine

Sim.runTank.volume = 0.013784;% m^3 (Source: Phil). 0.8*(0.25*pi*(150e-3).^2); %m^3
Sim.runTank.PInit = 60e5; %Pascal. Very temperature dependent. Eg. 0C->31bar, 20C->50bar, 30C->63bar
Sim.pipe.diameter = 7e-3; %m
Sim.pipe.crossSection = 0.25*pi*(Sim.pipe.diameter)^2; %m^2
Sim.pipe.startPressure = Sim.runTank.PInit; %Pa (40e5 or so for Pablo)
Sim.pipe.mdotOxInitial = 0.25; %kg/sec (0.05 or so for Pablo)

Sim.preInjectorPipe.diameter = 7e-3; %m
Sim.preInjectorPipe.crossSection = 0.25*pi*Sim.preInjectorPipe.diameter^2; %m^2

%%
%Injector properties
Sim.injector.singleHoleA = 0.25*pi*(1.47e-3)^2; %m^2
Sim.injector.postInjectorCrossSection = 0.25*pi*(11e-2)^2;%m^2; Area used after injector for modelled reservoir (Shouldn't matter)

%%
%Combustion chamber properties
Sim.combustionChamber.OFRatioInitial = 6.5;
Sim.combustionChamber.mdotOxInitial = Sim.pipe.mdotOxInitial; %kg/s
Sim.combustionChamber.rhoFuel = 953; %kg/m^3 (density)
Sim.combustionChamber.combustionEfficiency = 0.95;
Sim.combustionChamber.PChamberInit = 27e5;
Sim.combustionChamber.portLength = 600e-3; %m. "Lp" in SPAD
%Regression rate parameters, empirical
Sim.combustionChamber.useOxFluxRegRateEquation = 1; %If 1 then uses rdot=a*Gox^n, if 0 then uses rdot=a*Gprop^n*length^m
%McCormick et all 2005 for FR5560
%(https://core.ac.uk/download/pdf/304374863.pdf)
Sim.combustionChamber.regRateParams.a = 0.155e-3;
Sim.combustionChamber.regRateParams.n = 0.5;
Sim.combustionChamber.regRateParams.m = NaN; %Unused

%Numbers from adam bakers excel file for rdot=a*Gprop^n*length^m
% Sim.combustionChamber.regRateParams.a = 2.3600e-5;
% Sim.combustionChamber.regRateParams.n = 0.6050;
% Sim.combustionChamber.regRateParams.m = 0;
%Port configuration, circular
%Values for potentially possible pablo
Sim.combustionChamber.initialPortDiameter = 26e-3; %m (Grain inner diam)
grainOuterDiam = 63.5e-3; %m
Sim.combustionChamber.initialFuelWebThickness = grainOuterDiam-Sim.combustionChamber.initialPortDiameter; %m (Grain outer diam - inner diam)

%%
%Nozzle properties
Sim.nozzle.throatArea = 2.4575e-4; %m^2 (4.07e-5 for Pablo)
Sim.nozzle.expansionRatio = 3.9; %m^2 (2.6 for Pablo)
Sim.nozzle.thrustEfficiencyFactor = 0.9; %lambda