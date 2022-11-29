A = [1 2 3;
     4 5 6;
     7 8 0;
     2 5 8];

B = A'

b = [366; 804; 351];

% Similar a letra a da questão 5
x = B\b;
disp("The result of B\b")
disp(x)

%Similar a letra b da questão 5
x1 = pinv(B)*b;
disp("The result using pinv(B)*b")
disp(x1)

% Using svd
[U, E, V] = svd(B);

EE = E';
for i=1:min(size(EE))
    EE(i,i) = 1/EE(i,i);
end

x2 = V*EE*U'*b;
disp("The result using [U E V] = svd(B)")
disp(x2)

x3 = inv((B')*B)*(B')*b;
disp("The result with min squares")
disp(x3)