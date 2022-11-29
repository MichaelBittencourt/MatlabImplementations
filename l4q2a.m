function l4q2a()
    a = -4;
    b = 0;
    tol = 10e-4;
    disp("Secant method")
    [root, it] = Calc.secant(@firstFunction, a, b, tol, tol);
    fprintf("The root of function is %.15f with %d iteractions\n", root, it);

    disp("Newton method")
    [root, it] = Calc.newton(@firstFunction, @derivateFirstFunction, b, tol, tol);
    fprintf("The root of function is %.15f with %d iteractions\n", root, it);

    %Calc.derivate(@firstFunction, 2)
    %derivateFirstFunction(2)
end

function ret = firstFunction(x)
    ret = x^3 + 3*x^2 - 1;
end

function ret = derivateFirstFunction(x)
    ret = 3 * x^2 + 3*2*x;
end