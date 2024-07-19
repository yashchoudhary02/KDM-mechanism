%Design variables are l1,l2,l3,l4,a
% Defining assumptions varibales 
theta_2_0 = 142*pi/180; theta_3_0 = 35.192285162471*pi/180;theta_4_0 =110.3062094216614*pi/180 ; p_0 = 5.6447129779001 + 5.854981653799i;
theta_2_1 = 55*pi/180; theta_3_1 = 32.5670122376706*pi/180;theta_4_1 =76.806200028218*pi/180 ; p_1 = 8.0390650174084 + 5.8591570803425i;
theta_2_2 = 16*pi/180; theta_3_2 = 46.4552158561607*pi/180; theta_4_2 =78.5384497585916*pi/180 ;p_2 = 7.35940403890891 + 6.5658849019554i;

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
a = y(2)/l3;
disp('All the design variables are below');
disp('l1=');
disp(l1);
disp('l2=')
disp(l2);
disp('l3=')
disp(l3);
disp('l4=')
disp(l4);
disp('a=')
disp(a);
