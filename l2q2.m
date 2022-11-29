function l2q2()
    n = 30;
    h = 0.1;
    [M, b] = generateMatrix(h, n)
    disp('The result with inverse matrix:')
    disp(M^(-1)*b)

    X = solveTridiagMatrix(M, b);
    disp('Result with implemented method:');
    disp(X');

end

function d = getD(M, i)
    d = M(i,i);
end

function a = getA(M, i)
    if i == 1
        a = 0;
    else
        a = M(i,i-1);
    end
end

function c = getC(M, i)
    if i == size(M, 1)
        c = 0;
    else
        c = M(i,i+1);
    end
end

function [M, b] = generateMatrix(h, n)
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

function X = solveTridiagMatrix(M, b)
    n = size(M, 1);
    X = zeros(1, n);
    d(1) = getD(M, 1);
    for k=1:n-1
        d(k+1) = getD(M, k+1) - (getA(M, k+1)/d(k))*getC(M,k);
        b(k+1) = b(k+1) - (getA(M, k+1)/d(k))*b(k);
    end
    X(n) = b(n)/d(n);
    for k=(n-1):-1:1
        X(k) = (b(k) - getC(M, k)*X(k+1))/d(k);
    end
end