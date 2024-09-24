% System 1 

n = 3;

Ymag = [ 17.5,  5,     2.5;
          5,    11.66, 3.33;
          2.5,   3.33, 15.83];
Ytheta = [-1.57, 1.57, 1.57;
           1.57, -1.57, 1.57;
           1.57, 1.57, -1.57];

% P(1) = ? 
% Q(1) = ?
% Vmag(1) = 1;
% Vtheta(1) = 0;

% P(2) = 0.8;
% Q (2) = ?
% Vmag(2) = 1.05;
% Vtheta(2) = ?

% P(3) = 0.8;
% Q(3) = 0.3;
% Vmag(3) = ?
% Vtheta = ?

P = [NaN,0.8,-0.8];
Q = [NaN,NaN,-0.3];
Vmag = [1,1.05,NaN];
Vtheta = [0,NaN,NaN];

% Power Flow Equation
% P: vector of power injections (size n x 1)
% Vmag: vector of bus voltages (size n x 1)
% Vtheta: vector of bus voltage angles (size n X 1) 
% Ymag: Admittance matrix magnitudes (size n x n)
% Ytheta: Admittance matrix angles(size n X n)
% n: number of buses

% Solve for DC Solution 
[P, Q, Vmag, Vtheta] = DC_PowerFlow_Solution(P, Q, Vmag, Vtheta, Ymag, Ytheta);


% Print the contents of the arrays
disp('System 1 P:');
disp(P);

disp('System 1 Q:');
disp(Q);

disp('System 1 Vmag:');
disp(Vmag);

disp('System 1 Vtheta:');
disp(rad2deg(Vtheta));

% System 2

n = 3;

Ymag = [15.7, 2.47, 3.34;
        2.47, 17.4, 5;
        3.3, 5, 8.4];
Ytheta = [-87, -83, -81;
          -83, -87, -84;
           -81, -84, -83];

P = [NaN, -0.5, -0.5];
Q = [NaN, -0.1, -0.2];
Vmag = [1, NaN, NaN];
Vtheta = [0, NaN, NaN];

% Solve for DC Solution 
[P, Q, Vmag, Vtheta] = DC_PowerFlow_Solution(P, Q, Vmag, Vtheta, Ymag, Ytheta);

% Print the contents of the arrays
disp('System 2 P:');
disp(P);

disp('System 2 Q:');
disp(Q);

disp('System 2 Vmag:');
disp(Vmag);

disp('System 2 Vtheta:');
disp(rad2deg(Vtheta));

% System 3

n = 4;

Ymag = [12.3, 5, 3.3, 4;
        5, 7, 2, 0;
        3.3, 2, 10.3, 5;
        4, 0, 5, 12.3];
Ytheta = [-86, -87, 81, 90;
           5, 7, 2, 0;
           3.3, 2, 10.3, 5;
           4, 0, 5, 12.3];

% Bus 1 Slack 
% Bus 2 PV
% Bus 3 PQ
% Bus 4 PQ

P = [NaN, 1.0, -0.5, -0.6];
Q = [NaN, NaN, -0.2, -0.2];
Vmag = [1, 1.04, NaN, NaN];
Vtheta = [0, NaN, NaN, NaN];

% Solve for DC Solution 
[P, Q, Vmag, Vtheta] = DC_PowerFlow_Solution(P, Q, Vmag, Vtheta, Ymag, Ytheta);

% Print the contents of the arrays
disp('System 3 P:');
disp(P);

disp('System 3 Q:');
disp(Q);

disp('System 3 Vmag:');
disp(Vmag);

disp('System 3 Vtheta:');
disp(rad2deg(Vtheta));

% Problem 2

% Initial guess x0 and tolerance epsilon
x0 = 0.6;
epsilon = 0.001;

% Call the Newton-Raphson solver
root = newtonRaphsonSolve(x0, epsilon);

% Display the result
disp('The root of the equation is (rad, degrees):');
disp(root);
disp(rad2deg(root));


