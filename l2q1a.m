function l2q1a()
    A = [7 2 -5;
         1 5 -3;
         2 -1 -9];
    
    [L, U] = factLU(A);
    
    disp("L from function factLU")
    disp(L)
    disp("U from function factLU")
    disp(U)
end

function [L, U] = factLU(A)
    n = size(A, 1);
    L = eye(n);
    U = eye(n);
    for i=1:n
        for j=i:n
            sumVar = 0;
            for k=1:i-1
                sumVar = sumVar + L(i,k)*U(k,j);
            end
            U(i,j) = A(i,j) - sumVar;
        end
        for j=i+1:n
            sumVar = 0;
            for k=1:i-1
                sumVar = sumVar + L(j,k)*U(k,i);
            end
            L(j,i) = (A(j,i) - sumVar) / U(i,i);
        end
    end
end