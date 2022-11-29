classdef IteractiveMethods
    properties
        A = [];
        b = [];
        err = 0;
        kMax = 0;
    end
    methods (Static)
        function printClassName()
            disp("IteractiveMethods")
        end

        function [M, b] = generateTridiagMatrix(h, n)
            M = zeros(n);
            b = zeros(n, 1);
            M(1,1) = -2*(1+h^2);
            M(1,2) = 1;
            b(1) = 1;
            for i=2:n-1
                M(i,i-1) = 1;
                M(i,i) = M(1,1);
                M(i,i+1) = 1;
                b(i) = 0;
            end
            M(n,n-1) = 1;
            M(n,n) = M(1,1);
            b(n) = 1
        end
    end
    methods
        function obj = IteractiveMethods(A, b, err, kMax)
            obj.A = A;
            obj.b = b;
            obj.err = err;
            obj.kMax = kMax;
        end

        function X = zeraVector(obj, n)
            for i=1:n
                X(n,1) = 0;
            end
        end

        function [X, k] = jacobi(obj)
            A = obj.A;
            b = obj.b;
            err = obj.err;
            kMax = obj.kMax;
            n = size(A,2);
            X = obj.zeraVector(n);
            X1 = obj.zeraVector(n);
            for k=0:kMax
                for i=1:n
                    sum = 0;
                    for j=1:n
                        if j ~= i
                            sum = sum + A(i,j)*X(j, 1);
                        end
                    end
                    X1(i, 1) = (b(i,1) - sum)/A(i,i);
                end
                localErr = max(abs(X1-X));
                if localErr < err
                    X = X1;
                    break
                end
                X = X1;
            end
            fprintf("number of iteration: %d\n", k)
        end

        function [X, k] = gausSeidel(obj)
            A = obj.A;
            b = obj.b;
            err = obj.err;
            kMax = obj.kMax;
            n = size(A,2);
            X = obj.zeraVector(n);
            X1 = obj.zeraVector(n);
            for k=0:kMax
                for i=1:n
                    sumX1 = 0;
                    for j=1:i-1
                        sumX1 = sumX1 + A(i,j)*X1(j, 1);
                    end
                    sum = 0;
                    for j=i+1:n
                        sum = sum + A(i,j)*X(j, 1);
                    end
                    X1(i, 1) = (b(i,1) - sumX1 - sum)/A(i,i);
                end
                localErr = max(abs(X1-X));
                if localErr < err
                    X = X1;
                    break
                end
                X = X1;
            end
            fprintf("number of iteration: %d\n", k)
        end

        function [X, k] = sor(obj, w)
            A = obj.A;
            b = obj.b;
            err = obj.err;
            kMax = obj.kMax;
            n = size(A,2);
            X = obj.zeraVector(n);
            X1 = obj.zeraVector(n);
            for k=0:kMax
                for i=1:n
                    sumX1 = 0;
                    for j=1:i-1
                        sumX1 = sumX1 + A(i,j)*X1(j, 1);
                    end
                    sum = 0;
                    for j=i+1:n
                        sum = sum + A(i,j)*X(j, 1);
                    end
                    X1(i, 1) = (1-w)*X(i,1) + (w/A(i,i))*(b(i,1) - sumX1 - sum);
                end
                localErr = max(abs(X1-X));
                if localErr < err
                    X = X1;
                    break
                end
                X = X1;
            end
            fprintf("number of iteration: %d\n", k)
        end

        function [X, k] = gradConj(obj)
            A = obj.A;
            r = obj.b;
            aux = r'*r;
            v = obj.b;
            err = obj.err;
            kMax = obj.kMax;
            n = size(A,2);
            X = obj.zeraVector(n);
            X1 = obj.zeraVector(n);
            for k=0:kMax
                z = A*v;
                s = aux/(v'*z);
                X1 = X + s*v;
                r = r - s*z;
                aux1 = r'*r;
                X = X1;
                if aux1 < err
                    break;
                end
                m = aux1/aux;
                aux = aux1;
                v = r + m*v;
            end
            fprintf("number of iteration: %d\n", k)
        end
    end
end