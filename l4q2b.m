function l4q2b()
    a = 0;
    b = pi/2;
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
    ret = x - cos(x);
end

function ret = derivateFirstFunction(x)
    ret = 1 + sin(x);
end