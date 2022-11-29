function l3q1()
    A = [4 0.24 -0.08;
         0.09 3 -0.15;
         0.04 -0.08 4];
    b = [8; 9; 20]

    % The class IteractiveMethods was created in another file.
    disp("Importing class:");
    IteractiveMethods.printClassName();
    it = IteractiveMethods(A, b, 10e-10, 50);
    
    disp("Metodo de Jacobi")
    [x, iterationsJacobi] = it.jacobi();
    disp(x);
    
    disp("Método Gaus Seidel")
    [x1, iterationsGausSeidel] = it.gausSeidel();
    disp(x1);

    percentual = iterationsGausSeidel*100/iterationsJacobi;
    lessOrHigh = "better";
    if (percentual > 100) 
        lessOrHigh = "worse";
    end
    fprintf("The method Gaus Seidel is %.2f%% %s than Jacobi", abs(100 - percentual), lessOrHigh);
end