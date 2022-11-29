function l5q3()
    fx = [0 1
          0.15 1.004
          0.31 1.031
          0.5 1.117
          0.6 1.223
          0.75 1.422];

    maxDegree = 3;

    for i = 1:maxDegree
        fprintf("Calculate Min square polinomy with %d degree\n\n", i);
        calculateMethod(fx, ApproximationsMethods.MIN_SQUARE, i)
    end
end

function calculateMethod(fx, method, degree)
    if nargin < 3
        degree = 1;
    end
    P = ApproximationsMethods.getPolinomy(fx, method, degree);
    
    f = ApproximationsMethods.createFunction(fx, method, degree);
    fprintf("p(x) = %s\n\n", P)
    disp(f)

    simplifiedFunction = ApproximationsMethods.createSimplifiedFunction(fx, method, degree);
    disp(simplifiedFunction)
end