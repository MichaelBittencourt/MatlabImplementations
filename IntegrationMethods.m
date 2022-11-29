classdef IntegrationMethods
    properties(Constant)
        TRAPEZE_METHOD = 1
        SIMPSON_METHOD = 2
    end

    methods(Static)
        function ret = integrate(func, a, b, n, method)
            if (nargin < 5)
                method = IntegrationMethods.TRAPEZE_METHOD;
            end
            h = (b - a) / n;
            x = linspace(a, b, n);
            fx = IntegrationMethods.calculateAllFx(func, x);
            switch method
                case IntegrationMethods.TRAPEZE_METHOD
                    ret = IntegrationMethods.trapezeMethod(fx, h);
                case IntegrationMethods.SIMPSON_METHOD
                    ret = IntegrationMethods.simpsonMethod(fx, h);
                otherwise
                    ret = 0;
            end
        end

        function ret = trapezeMethod(fx, h)
            n = size(fx, 2);
            sum = 0;
            for i = 2:n-1
                sum = sum + fx(i);
            end
            ret = (h/2)*(2*sum + fx(1) + fx(n));
        end

        function ret = simpsonMethod(fx, h)
            n = size(fx, 2);
            if (rem(n, 2) == 0)
                sum = 0;
                for i = 2:2:n-1
                    sum = sum + 2*fx(i)+fx(i+1);
                end
                ret = (h/3)*(2*sum + fx(1) + fx(n));
            else
                ret = 0;
            end
        end

        function fx = calculateAllFx(func, x)
            n = size(x, 2);
            for i = 1:n
                fx(i) = func(x(i));
            end
        end
    end
end