function l4q3()
    

    x0 = 1.625;
    disp("a) ")
    question3(x0)
    x0 = 1.875;
    disp("b) ")
    question3(x0)
    x0 = 1.5;
    disp("c) ")
    question3(x0)
    x0 = 1.95;
    disp("d) ")
    question3(x0)
    x0 = 3;
    disp("e) ")
    question3(x0)
    x0 = 7;
    disp("f) ")
    question3(x0)
end

function question3(x0)
    tol = 10e-4;
    [root, it] = Calc.newton(@firstFunction, @derivateFirstFunction, x0, tol, tol);
    fprintf("The root of function is %.15f with %d iteractions and x0 = %f\n", root, it, x0);
end

function ret = firstFunction(x)
    ret = (4*x -7)/(x-2);
end

function ret = derivateFirstFunction(x)
    ret = -1 / (x-2)^2;
end