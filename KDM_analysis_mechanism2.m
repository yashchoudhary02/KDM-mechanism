clc; clear; close;
% Analysis of a four-bar by directly solving the loop-closure equations.
N = 500;
% Link Lengths of a crank rocker that we have:-
l1 = 4.05; l2 = 0.85; l3 = 4.25; l4 = 3.8;
alpha = pi; a = 1.89;
A = a - 1;

% Solving nonlinear equations and using the solutions to update the initial
% guesses:-
th34 = [pi, pi/2];
th2 = linspace(0, 4*pi, N);
th3 = zeros(size(th2));
th4 = zeros(size(th2));
for i = 1:N
    xsol = fsolve(@(x)loopClosure(x, l1, l2, l3, l4, th2(i)), th34);
    th3(i) = xsol(1);
    th4(i) = xsol(2);
    th34 = [th3(i), th4(i)];
end
om34 = [0, 0];
om2 = linspace(0.2, 0.2, N);
om3 = zeros(size(om2));
om4 = zeros(size(om2));
for i = 1:N
    xsol1 = fsolve(@(x)loopClosureVelocity(x, l2, l3, l4, th2(i), th3(i), th4(i), om2(i)), om34);
    om3(i) = xsol1(1);
    om4(i) = xsol1(2);
    om34 = [om3(i), om4(i)];
end

couX = l1 + l4 * cos(th4) + A * l3 * cos(th3 - alpha);
couY = l4 * sin(th4) + A * l3 * sin(th3 - alpha);

% Plotting the motion and path of the curve and drawing the couplers:-
for i = 1:N
    x = [0, l1, l1 + l4 * cos(th4(i)), l2 * cos(th2(i)), 0];
    y = [0, 0, l4 * sin(th4(i)), l2 * sin(th2(i)), 0];
    P_x = [l1 + l4 * cos(th4(i)), l1 + l4 * cos(th4(i)) + A * l3 * cos(th3(i) - alpha), l2 * cos(th2(i))];
    P_y = [l4 * sin(th4(i)), l4 * sin(th4(i)) + A * l3 * sin(th3(i) - alpha), l2 * sin(th2(i))];
    figure(1)
    plot(x, y, 'b--')
    hold on;
    plot(P_x, P_y, 'b-')
    plot(couX(1:i), couY(1:i), 'r-')
    plot(x, y, 'ro')
    hold off;
    axis([-l1 - l4, 2 * l1 + l4, -l1 - l4, l1 + l4])
    grid on
    title("waist Movement", 'FontSize', 30, 'FontName', 'Palatino Linotype')
    xlabel('$x$', 'interpreter', 'latex', 'FontSize', 30, 'FontName', 'Palatino Linotype')
    ylabel('$y$', 'interpreter', 'latex', 'FontSize', 30, 'FontName', 'Palatino Linotype')
    pause(0.05)
end
% Vector plots of velocities
% Plot angular velocities
% Loop-closure equations defined as a function to use them in fsolve()
% function
function F = loopClosure(x, l1, l2, l3, l4, th2)
F(1) = l1 + l4 * cos(x(2)) + l3 * cos(x(1)) - l2 * cos(th2);
F(2) = l4 * sin(x(2)) + l3 * sin(x(1)) - l2 * sin(th2);
end

function F = loopClosureVelocity(x, l2, l3, l4, th2, th3, th4, om2)
F(1) = l4 * x(2) * sin(th4) + l3 * x(1) * sin(th3) - l2 * om2 * sin(th2);
F(2) = l4 * x(2) * cos(th4) + l3 * x(1) * cos(th3) - l2 * om2 * cos(th2);
end
