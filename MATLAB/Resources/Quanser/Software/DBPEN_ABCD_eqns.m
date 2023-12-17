% Matlab equation file: "DBIP_ABCD_eqns.m"
% Open-Loop State-Space Matrices: A, B, C, and D
% for the Quanser Double Inverted Pendulum Experiment.

A = [0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1;
     0 g*(2*Mp1*lp1*Mh*Lp1+Mp2*Mh*Lp1^2+Mp1^2*lp1^2+Mh^2*Lp1^2+Mp2*Mp1*lp1^2)/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     lp1*g*Mp2*Mp1*(lp1-Lp1)/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     -(eta_g*Kg^2*eta_m*Kt*Km*Mh*Lp1^2+Beq*Rm*r_mp^2*Mh*Lp1^2+Beq*Rm*r_mp^2*Mp1*lp1^2+eta_g*Kg^2*eta_m*Kt*Km*Mp1*lp1^2)/Rm/r_mp^2/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     -Bp1*(Mh*Lp1+Mp1*lp1)/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     -Bp2*(-Mp1*lp1*Lp1-lp2*Mp1*lp1+Mp1*lp1^2-lp2*Mh*Lp1)/lp2/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1);
     0 g*(Mh^2*Lp1+lp1*Mp1*Mc+lp1*Mp1^2+Mh*Lp1*Mc+Mp1*Mh*Lp1+Mh*Lp1*Mp2+lp1*Mp2*Mp1+lp1*Mp1*Mh)/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     -g*Mp2*(Lp1*Mc-Mp1*lp1+Mp1*Lp1)/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     -(Mh*Lp1*Beq*Rm*r_mp^2+Mh*Lp1*eta_g*Kg^2*eta_m*Kt*Km+lp1*eta_g*Kg^2*eta_m*Kt*Km*Mp1+lp1*Beq*Rm*r_mp^2*Mp1)/Rm/r_mp^2/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     -Bp1*(Mc+Mh+Mp1)/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     Bp2*(Mp1*Lp1+lp2*Mc+lp2*Mh+Lp1*Mc-Mp1*lp1+Mp1*lp2)/lp2/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1);
     0 g/lp2*(Mp2*Mp1*lp1^2-lp1*Mp2*lp2*Mp1+Mp1^2*lp1^2-Mp1*lp1*Lp1*Mp2+lp1^2*Mp1*Mh-lp2*Mh*Lp1*Mc+lp1^2*Mp1*Mc-Mp1*lp2*Mh*Lp1-lp1*Mp1*lp2*Mc-Mp1*lp1*Mh*Lp1-Lp1*lp1*Mp1^2-lp1*Mp1^2*lp2-Lp1*lp1*Mp1*Mc-lp1*Mp1*lp2*Mh-lp2*Mh^2*Lp1-Mh*Lp1*Mp2*lp2)/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     g/lp2*(Mp2*Mp1*lp1^2+Mp1*Mh*Lp1^2+lp1^2*Mp1*Mh+Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+Mc*Mp2*Lp1^2+Mp1*Mp2*Lp1^2+Mp1*Lp1*Mp2*lp2+Lp1*Mp2*lp2*Mc-lp1*Mp2*lp2*Mp1-2*Mp1*lp1*Mh*Lp1-2*Mp1*lp1*Lp1*Mp2)/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     -1/lp2*(-lp1*eta_g*Kg^2*eta_m*Kt*Km*lp2*Mp1+eta_g*Kg^2*eta_m*Kt*Km*Mp1*lp1^2-lp1*Beq*Rm*r_mp^2*lp2*Mp1-Lp1*lp1*Beq*Rm*r_mp^2*Mp1-Lp1*lp1*eta_g*Kg^2*eta_m*Kt*Km*Mp1-Mh*Lp1*eta_g*Kg^2*eta_m*Kt*Km*lp2-Mh*Lp1*Beq*Rm*r_mp^2*lp2+Beq*Rm*r_mp^2*Mp1*lp1^2)/Rm/r_mp^2/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     1/lp2*Bp1*(Mp1*Lp1+lp2*Mc+lp2*Mh+Lp1*Mc-Mp1*lp1+Mp1*lp2)/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1) ...
     -Bp2*(lp1^2*Mp1*Mc+lp2^2*Mp2*Mh+lp2^2*Mp2*Mp1+lp2^2*Mp2*Mc+lp1^2*Mp1*Mh-2*lp1*Mp2*lp2*Mp1-2*Mp1*lp1*Mh*Lp1+Mp2*Mp1*lp1^2+2*Mp1*Lp1*Mp2*lp2+2*Lp1*Mp2*lp2*Mc+Mc*Mh*Lp1^2+Mc*Mp2*Lp1^2+Mp1*Mh*Lp1^2+Mp1*Mp2*Lp1^2-2*Mp1*lp1*Lp1*Mp2)/lp2^2/Mp2/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1)];
     
     B = [0; 0; 0; eta_g*Kg*eta_m*Kt/r_mp*(Mh*Lp1^2+Mp1*lp1^2)/Rm/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1);...
         eta_g*Kg*eta_m*Kt/r_mp*(Mh*Lp1+Mp1*lp1)/Rm/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1);...
         eta_g*Kg*eta_m*Kt/r_mp/lp2*(-Mp1*lp1*Lp1-lp2*Mp1*lp1+Mp1*lp1^2-lp2*Mh*Lp1)/Rm/(Mc*Mh*Lp1^2+lp1^2*Mp1*Mc+lp1^2*Mp1*Mh+Mp1*Mh*Lp1^2-2*Mp1*lp1*Mh*Lp1)];
     C = eye(3,6);
     D = zeros(3,1);

%Actuator Dynamics
A(4,4) = A(4,4) - B(4)*eta_g*Kg^2*eta_m*Kt*Km/r_mp^2/Rm;
A(5,4) = A(5,4) - B(5)*eta_g*Kg^2*eta_m*Kt*Km/r_mp^2/Rm;
A(6,4) = A(6,4) - B(6)*eta_g*Kg^2*eta_m*Kt*Km/r_mp^2/Rm;
B = eta_g*Kg*eta_m*Kt/r_mp/Rm*B;