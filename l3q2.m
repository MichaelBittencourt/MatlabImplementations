function l3q2()
    [M, b] = IteractiveMethods.generateTridiagMatrix(0.1, 30)
    it = IteractiveMethods(M, b, 10e-4, 1000);
    disp("Jacobi Method:")
    X = it.jacobi();
    disp(X);
    disp("Gaus Seidel Method:")
    X1 = it.gausSeidel();
    disp(X1);
    for i=1:10
        fprintf("Using sor with w = %.2f\n", 0.2*i)
        X2 = it.sor(0.2*i);
        disp(X2)
    end
    X3 = it.gradConj()
    disp("Gaus Seidel Method:")
    disp(X3)
end