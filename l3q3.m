function l3q3()
    A = [4 1 1 1;
         1 3 -1 1;
         1 -1 2 0;
         1 1 0 2];
    b = [0.65; 0.05; 0.05; 0]
    runQ3(A, b);
    
    A = [4 1 -1 1;
         1 1 -1 0;
         -1 -1 5 2;
         0 0 2 4];
    b = [7; 8; -4; 6];
    runQ3(A, b);
end

function runQ3(A, b)
    it = IteractiveMethods(A, b, 10e-4, 1000);
    disp("Grad conj Method matrix A:")
    X = it.gradConj();
    disp(X);
    disp("Built-in method to solve A:")
    X1 = (A^(-1))*b;
    disp(X1)
end