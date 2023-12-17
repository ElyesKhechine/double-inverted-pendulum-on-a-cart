% SETUP_IP02_DBPEN
%
% Linear Double Inverted Pendulum (DBPEN) Control Lab: 
% Design of a LQR position controller
% 
% SETUP_IP02_DBPEN sets the DBPEN-LIN and IP02 system's 
% model parameters according to the user-defined configuration.
%
% Copyright (C) 2012 Quanser Consulting Inc.
% Quanser Consulting Inc.
%
clear
%
% ############### USER-DEFINED IP02 and DBPEN-LIN CONFIGURATION ###############
% if IP02: Type of Cart Load: set to 'NO_LOAD', 'WEIGHT'
IP02_LOAD_TYPE = 'NO_LOAD';
% IP02_LOAD_TYPE = 'WEIGHT';
% Turn on or off the safety watchdog on the cart position: set it to 1 , or 0 
X_LIM_ENABLE = 1;       % safety watchdog turned ON
% X_LIM_ENABLE = 0;      % safety watchdog turned OFF
% Safety Limits on the cart displacement (m)
X_MAX = 0.40;            % cart displacement maximum safety position (m)
X_MIN = - X_MAX;        % cart displacement minimum safety position (m)
% Turn on or off the safety watchdog on the pendulum angle: set it to 1 , or 0 
ALPHA_LIM_ENABLE = 1;       % safety watchdog turned ON
% ALPHA_LIM_ENABLE = 0;      % safety watchdog turned OFF
% Safety Limits on the pendulum angle (deg)
global ALPHA_MAX ALPHA_MIN
ALPHA_MAX = 20;            % pendulum angle maximum safety position (deg)
ALPHA_MIN = - ALPHA_MAX;   % pendulum angle minimum safety position (deg)
% Cable Gain used: set to 1
K_AMP = 1;
% Amplifier Type: set to 'VoltPAQ' or 'Q3'
AMP_TYPE = 'VoltPAQ';
% AMP_TYPE = 'Q3';
% Digital-to-Analog Maximum Voltage (V); for MultiQ cards set to 10
VMAX_DAC = 10;

% ############### USER-DEFINED CONTROLLER DESIGN ###############
% Type of Controller: set it to 'LQR_AUTO', 'LQR_GUI_TUNING', 'MANUAL'  
CONTROLLER_TYPE = 'LQR_AUTO';    % LQR controller design: automatic mode
%CONTROLLER_TYPE = 'MANUAL';    % controller design: manual mode
% Initial Condition on alpha, i.e. pendulum angle at t = 0 (deg)
global IC_ALPHA0
%IC_ALPHA0 = 0.1;
IC_ALPHA0 = 0;
% conversion to radians
IC_ALPHA0 = IC_ALPHA0 / 180 * pi;
% Initialization of Simulink diagram parameters
% Cart Encoder Resolution
    global K_EC K_EP
    % Specifications of a second-order low-pass filter
    wcf_1 = 2 * pi * 50.0;    % filter cutting frequency for cart velocity (encoder channel #0)
    zetaf_1 = 0.9;          % filter damping ratio for cart velocity
    wcf_2 = 2 * pi * 10;    % filter cutting frequency for velocity of encoder channels #1,2,3 
    zetaf_2 = 0.9;          % filter damping ratio - encoder channels #1,2,3

% variables required in the Simulink diagrams
global VMAX_AMP IMAX_AMP

% Set the model parameters accordingly to the user-defined IP01 or IP02 system configuration.
% These parameters are used for model representation and controller design.
[ Rm, Jm, Kt, eta_m, Km, Kg, eta_g, Mc, r_mp, Beq ] = config_ip02( IP02_LOAD_TYPE, AMP_TYPE );
%
% Lumped Mass of the Cart System (accounting for the rotor inertia)
Mc = Mc + eta_g * Kg^2 * Jm / r_mp^2;
%
% PEND_TYPE = {LONG_24IN, MEDIUM_12IN, SHORT_7IN}
% Set the model parameters for the short 7 inch bottom pendulum
PEND_TYPE = 'SHORT_7IN'; 
[ g, Mp1, Lp1, lp1, Jp1, Bp1 ] = config_pen( PEND_TYPE );
% Set the model parameters for the medium 12 inch top pendulum
PEND_TYPE = 'MEDIUM_12IN';
[ g, Mp2, Lp2, lp2, Jp2, Bp2 ] = config_pen( PEND_TYPE );
% Mass of hinge between pendula (kg)
Mh = 0.170;
%
% For the following state vector: 
% X = [ xc; alpha; theta; xc_dot; alpha_dot; theta_dot ]
% Initialization of the State-Space Representation of the Open-Loop System
% Call the following Maple-generated file to initialize the State-Space Matrices: A, B, C, and D
DBPEN_ABCD_eqns;

% Inital conditions for simulation
X0 = [ 0 0.5*pi/180 0.5*pi/180 0 0 0 ];
% Augment State-Space to include integrator
% Add integrator
    A(7,1) = 1;
    A(7,7) = 0;
    B(7) = 0;
    C = eye(3,7);
%
if strcmp ( CONTROLLER_TYPE, 'LQR_AUTO' )
    % LQR Controller Design Specifications
        if strcmp( IP02_LOAD_TYPE, 'NO_LOAD' )            
            if ( strcmp( AMP_TYPE, 'VoltPAQ' ) || strcmp( AMP_TYPE, 'UPM_1503' ) || strcmp( AMP_TYPE, 'UPM_2405' ) )                   
                Q = diag([10 50 50 0 0.1 0.1 1]);
                R = 0.01;
            elseif ( strcmp( AMP_TYPE, 'Q3') )
                Q = diag([ 10 50 50 0 1 1 1]);
                R = 0.2;
            else
                error( 'Error: Set the amplifier type.' );
            end
        elseif strcmp( IP02_LOAD_TYPE, 'WEIGHT' )
            error( 'No pre-tuned controller for IP02 with weight.');
        else
            error( 'Error: Set the IP02 load configuration.' )
        end
    % Automatically calculate the LQR controller gain
    [ K ] = lqr( A, B, Q, R );
    % Display the calculated gains
    disp( ' ' )
    % disp( 'Calculated LQR controller gain elements: ' )
    if ( strcmp( AMP_TYPE, 'UPM_1503' ) || strcmp( AMP_TYPE, 'UPM_2405' ) || strcmp( AMP_TYPE, 'VoltPAQ' ) )
        disp( [ 'K(1) = ' num2str( K(1) ) ' V/m' ] )
        disp( [ 'K(2) = ' num2str( K(2) ) ' V/rad' ] )
        disp( [ 'K(3) = ' num2str( K(3) ) ' V/rad' ] )
        disp( [ 'K(4) = ' num2str( K(4) ) ' V.s/m' ] )
        disp( [ 'K(5) = ' num2str( K(5) ) ' V.s/rad' ] )
        disp( [ 'K(6) = ' num2str( K(6) ) ' V.s/rad' ] )
        disp( [ 'K(7) = ' num2str( K(7) ) ' V/m/s' ] )
    elseif ( strcmp( AMP_TYPE, 'Q3' ) )
        disp( [ 'K(1) = ' num2str( K(1) ) ' A/m' ] )
        disp( [ 'K(2) = ' num2str( K(2) ) ' A/rad' ] )
        disp( [ 'K(3) = ' num2str( K(3) ) ' A/rad' ] )
        disp( [ 'K(4) = ' num2str( K(4) ) ' A.s/m' ] )
        disp( [ 'K(5) = ' num2str( K(5) ) ' A.s/rad' ] )
        disp( [ 'K(6) = ' num2str( K(6) ) ' A.s/rad' ] )
        disp( [ 'K(7) = ' num2str( K(7) ) ' A/m/s' ] )
    else
        error( 'Error: Set the amplifier type.' );
	end
elseif strcmp ( CONTROLLER_TYPE, 'MANUAL' )
    K = [ 0 0 0 0 0 0 0 ];
    disp( ' ' )
    disp( 'STATUS: manual mode' ) 
    disp( 'The model parameters of your Double Pendulum and IP01 or IP02 system have been set.' )
    disp( 'You can now design your state-feedback position controller.' )
    disp( ' ' )
else
    error( 'Error: Please set the type of controller that you wish to implement.' )
end