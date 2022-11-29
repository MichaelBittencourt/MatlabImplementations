A = [1 2 3;
     4 5 6;
     7 8 0;
     2 5 8];

b = [366; 804; 351; 514];

x = pinv(A)*b
disp("The result using pinv(A)*b")
disp(x)

% Using svd
[U, E, V] = svd(A);

EE = E';
for i=1:min(size(EE))
    EE(i,i) = 1/EE(i,i);
end

x2 = V*EE*U'*b;
disp("The result using [U E V] = svd(A)")
disp(x2)

x3 = inv((A')*A)*(A')*b;
disp("The result with min squares")
disp(x3)


