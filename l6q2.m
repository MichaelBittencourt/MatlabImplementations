function l6q2()
    
    integral = IntegrationMethods.integrate(@func, 0, 30, 6);
    simpson = IntegrationMethods.integrate(@func, 0, 30, 6, IntegrationMethods.SIMPSON_METHOD);
    fprintf("trapeze W = %f\n\n", integral);
    fprintf("simpson W = %f\n\n", simpson);

end

function ret = func(x)
    ret = Fx(x)*cos(teta(x));
end

function ret = teta(x)
    var = [0 0.5
           5 1.4
           10 0.75
           15 0.9
           20 1.3
           25 1.48
           30 1.5];
    if (rem(x, 5) == 0)
        ret = var(x/5 + 1); % The x is multiple of 5
    else
        ret = 0;
    end  
end

function ret = Fx(x)
var = [0 0
       5 9
       10 13
       15 14
       20 10.5
       25 12
       30 5];
    if (rem(x, 5) == 0)
        ret = var(x/5 + 1); % The x is multiple of 5
    else
        ret = 0;
    end
end