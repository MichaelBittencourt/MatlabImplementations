function l6q1()
    
    integral = IntegrationMethods.integrate(@funcA, 0, 1, 6);
    simpson = IntegrationMethods.integrate(@funcA, 0, 1, 6, IntegrationMethods.SIMPSON_METHOD);
    fprintf("Result a) trapeze = %f, simpson = %f\n\n", integral, simpson);

    integral = IntegrationMethods.integrate(@funcB, 0, 2*pi, 8);
    simpson = IntegrationMethods.integrate(@funcB, 0, 2*pi, 8, IntegrationMethods.SIMPSON_METHOD);
    fprintf("Result b) trapeze = %f, simpson = %f\n\n", integral, simpson);

    integral = IntegrationMethods.integrate(@funcC, 0, 1, 6);
    simpson = IntegrationMethods.integrate(@funcC, 0, 1, 6, IntegrationMethods.SIMPSON_METHOD);
    fprintf("Result c) trapeze = %f, simpson = %f\n\n", integral, simpson);

    integral = IntegrationMethods.integrate(@funcD, 0, 2, 8);
    simpson = IntegrationMethods.integrate(@funcD, 0, 2, 8, IntegrationMethods.SIMPSON_METHOD);
    fprintf("Result d) trapeze = %f, simpson = %f\n\n", integral, simpson);

end

function ret = funcA(x)
    ret = (x^2)*sqrt(1 + x^2);
end

function ret = funcB(x)
    ret = x*sin(x);
end

function ret = funcC(x)
    ret = x^2 * exp(x);
end

function ret = funcD(x)
    ret = x^2 * exp(-(x^2));
end