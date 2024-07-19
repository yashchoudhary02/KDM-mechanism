% Defining assumptions varibales 
theta_2_0 = 76*pi/180; theta_3_0 = 43.0743504038801*pi/180;theta_4_0 =101.2274607419657*pi/180 ; p_0 = 6.085901691887 + 6.3224733773997i;
theta_2_1 = 100*pi/180; theta_3_1 = 41.6278206783037*pi/180;theta_4_1 =105.5833088214486*pi/180 ; p_1 = 5.8695787613567 + 6.184613877985i;
theta_2_2 = 150*pi/180; theta_3_2 = 44.0828827614771*pi/180; theta_4_2 =117.1360946940827*pi/180 ;p_2 = 5.0464684651632 + 6.0253707213652i;

% Definfing phase array
A_phase = [theta_2_1 - theta_2_0, theta_3_1 - theta_3_0; theta_2_2 - theta_2_0, theta_3_2 - theta_3_0]; % Phases (in radians)
% defining coefficient matrix
A =  exp(1i * A_phase) -1; % Complex coefficient matrix

% Define the complex constant vector b
b = [p_1 - p_0; p_2 - p_0]; % Example complex constant vector

% Solve the system of equations Ax = b
x = A\b;
y = abs(x);
% Display the solution
disp('Solution from left diad:');
disp('l2=')
disp(y(1));
disp('a*l3 = ');
disp(y(2));


% Define the complex coefficient matrix A in Euler form
A_phase = [theta_4_1 - theta_4_0, theta_3_1 - theta_3_0; theta_4_2 - theta_4_0, theta_3_2 - theta_3_0]; % Phases (in radians)
A =  exp(1i * A_phase) -1; % Complex coefficient matrix
% Solve the system of equations Ax = b
z = A\b;
w = abs(z);
% Display the solution
disp('Solution from right diad:');
disp('l4=');
disp(w(1));
disp('(a-1)*l3=');
disp(w(2));
vec_l2 = x(1);
vec_l3 = x(2) - z(2);
vec_l4 = z(1);
vec_l1 = vec_l4 - vec_l3 - vec_l2;
l1 = abs(vec_l1)
l2 = y(1);
l3 = abs(vec_l3);
l4 = abs(vec_l4);
disp('All the design variables are below');
disp('l1=');
disp(l1);
disp('l2=')
disp(l2);
disp('l3=')
disp(l3);
disp('l4=')
disp(l4);