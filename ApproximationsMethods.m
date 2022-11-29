classdef ApproximationsMethods
    properties(Constant)
        NEWTON=1
        LAGRANGE=2
        MIN_SQUARE=3
    end
    methods(Static)
        function D = splitDiferences(fx) %fx é uma matrix de duas colunas onda cada linha representa o ponto xi e o f(xi)
            n = size(fx,1);
            D = zeros(n);
            for i = 1:n
                D(i, 1) = fx(i,2);
            end
            for k = 2:n
                for i = 1:n-k+1
                    D(i, k) = (D(i+1, k-1) - D(i, k-1)) / (fx(i+k-1,1) - fx(i, 1));
                end
            end
        end

        function ret = getPolinomy(fx, method, degree)
            if nargin <= 2
                degree = 1;
            end
            switch method
                case ApproximationsMethods.NEWTON
                    ret = ApproximationsMethods.newtonMethod(fx);
                case ApproximationsMethods.LAGRANGE
                    ret = ApproximationsMethods.lagrangeMethod(fx, degree);
                case ApproximationsMethods.MIN_SQUARE
                    ret = ApproximationsMethods.minSquare(fx, degree);
                otherwise
                    ret = "x";
            end
        end

        function ret = createFunction(fx, method, degree)
            if (nargin <= 2)
                degree = 1;
            end
            ret = str2func(sprintf("@(x)%s", ApproximationsMethods.getPolinomy(fx, method, degree)));
        end

        function ret = createSimplifiedFunction(fx, method, degree)
            if (nargin <= 2)
                degree = 1;
            end
            simplified = simplify(str2sym(ApproximationsMethods.getPolinomy(fx, method, degree)));
            ret = str2func(sprintf("@(x)%s", simplified));
        end

        function ret = newtonMethod(fx)
            n = size(fx,1);
            D = ApproximationsMethods.splitDiferences(fx);
            polinomyString = sprintf("%f", D(1,1));
            newtonString = "";
            for i = 2:n
                newtonString = sprintf("%s*(x - %f)", newtonString, fx(i-1, 1));
                polinomyString = sprintf("%s + %f%s", polinomyString, D(1, i), newtonString);
            end
            ret = polinomyString;
        end

        function ret = lagrangeMethod(fx, degree)
            n = size(fx, 1);
            if (degree < n)
                n = degree;
            end
            ret = "0";
            %polinomyL = zeros(1, n);
            for i = 1:n
                num = "1";
                den = "1";
                for k = 1:n
                    if i ~= k
                        num = sprintf("%s*(x - %f)", num, fx(k, 1));
                        den = sprintf("%s*(%f - %f)", den, fx(i, 1), fx(k, 1));
                    end
                end
                %polinomyL(1, i) = sprintf("%f*((%s)/(%s))", fx(i, 2), num, den);
                polinomyL = sprintf("%f*((%s)/(%s))", fx(i, 2), num, den);
                ret = sprintf("%s + %s", ret, polinomyL);
            end
        end

        function ret = minSquare(fx, degree)
            ret = "0";
            A = ApproximationsMethods.createA(fx, degree);
            X = A'*A;
            F = ApproximationsMethods.createF(fx);
            F = -A'*F;
            res = X\F;
            for i = 1:degree+1
                ret = sprintf("%s + %f*x^(%d)", ret, res(i), i-1);
            end
        end

        function A = createA(fx, degree)
            n = size(fx, 1);
            A = zeros(n, degree+1);
            for i = 1:n
                for j = 1:degree+1
                    A(i, j) = 1 * fx(i, 1)^(i-1);
                end
            end
        end

        function F = createF(fx)
            n = size(fx, 1);
            F = zeros(n);
            for i = 1:n
                F(i) = fx(i, 1);
            end
        end
    end
end