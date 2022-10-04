format long
disp("Bisection method")
[root2, it] = Calc.rootn(2, 2, 10e-16, Calc.BISECTION);
fprintf("The root square of 2 = %.15f with %d iteractions\n", root2, it)

disp("Secant method")
[root2, it] = Calc.rootn(2, 2, 10e-16, Calc.SECANT);
fprintf("The root square of 2 = %.15f with %d iteractions\n", root2, it)

fprintf("The native root square of 2 is %.15f", sqrt(2));

