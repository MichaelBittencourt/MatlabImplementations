function l5q1()
    fx = [2 func(2)
          2.5 func(2.5)
          4 func(4)
          6 func(6)];
    %fx = [1 0
    %      2 2
    %      4 12
    %      5 20]
    method = ApproximationsMethods.NEWTON;
    P = ApproximationsMethods.getPolinomy(fx, method);
    %sym = str2sym(P)
    f = ApproximationsMethods.createFunction(fx, method);
    fprintf("p(x) = %s\n\n", P)
    disp(f)

    simplifiedFunction = ApproximationsMethods.createSimplifiedFunction(fx, method);
    disp(simplifiedFunction)
end

function ret = func(x)
    ret = 1/(x^2);
end