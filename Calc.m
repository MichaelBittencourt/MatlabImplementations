classdef Calc
    properties (Constant)
        BISECTION = 0;
        SECANT = 1;
        NEWTON = 2;
        H = 10e-17
    end
    methods (Static)
        function printClassName()
            disp("Calc");
        end

        function [root, iteractions] = rootn(number, n, tol, method)
            function ret = f(x)
                ret = x^n - number;
            end
            switch method 
                case Calc.BISECTION
                    %This method can not work with |number| < 1
                    a = 0;
                    b = 2*number;
                    [root, iteractions] = Calc.bisection(@f, a, b, tol);
                case Calc.SECANT
                    x0 = 0;
                    x1 = 2*number;
                    [root, iteractions] = Calc.secant(@f, x0, x1, tol, tol);
                case Calc.NEWTON
                    disp("TODO: Newton method not implemented yet")
                otherwise
                    fprintf("There no method with %d value\n", method)
            end
        end

        function [root, iteractions] = bisection(func, a, b, tol)
            iteractions = 0;
            while abs(a-b) > tol
                root = (a+b) / 2;
                fa = func(a);
                fx = func(root);
                if (fa * fx < 0)
                    b = root;
                else
                    a = root;
                end
                iteractions = iteractions + 1;
            end
            root = (a+b)/2;
        end

        function [root, iteractions] = newton(func, derivateFunc, x0, tol1, tol2)
            iteractions = 0;
            root = x0;
            diffRoots = inf;
            fx = inf;
            while abs(fx) > tol1 && abs(diffRoots) > tol2
                x0 = root;
                fx = func(root);
                root = root - fx/derivateFunc(root);
                diffRoots = root - x0;
                iteractions = iteractions + 1;
            end
        end

        function [root, iteractions] = secant(func, x0, x1, tol1, tol2)
            iteractions = 0;
            while abs(func(x1)) > tol1 && abs(x1 -x0) > tol2
                temp = x1;
                f0 = func(x0);
                f1 = func(x1);
                x1 = (x0*f1 - x1*f0) / (f1 - f0);
                x0 = temp;
                iteractions = iteractions + 1;
            end
            root = x1;
        end

        function ret = derivate(func, x) 
            ret = (func(x + Calc.H) - func(x)) / Calc.H
        end
    end
end