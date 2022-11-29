function l5q2()
    fx = [2 0.5103757
          2.2 0.5207843
          2.4 0.5104147
          2.6 0.4813306
          2.8 0.4359160];

    maxDegree = 3;

    for i = 1:maxDegree
        fprintf("Calculate lagrange polinomy with %d degree\n\n", i);
        calculateMethod(fx, ApproximationsMethods.LAGRANGE, i)
    end
    disp("Calculate polinomy with Newton Method")
    calculateMethod(fx, ApproximationsMethods.NEWTON)
    
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