wt = [0 1.75 2.57 3 4.5 5.8]
fwt = [87.14 154 29.60 -55 -174.30 -5]

figure(1)
plot(wt, fwt)
title('First Graph ')
xlabel('wt')
ylabel('f(wt)')
grid

A = [];
b = fwt';

for i=1:size(wt, 2)
    A(i,1) = cos(wt(i));
    A(i,2) = sin(wt(i));
end

x = inv((A')*A)*(A')*b;

fi = atan(x(1)/x(2))
ampl = x(1)/cos(fi)

x = linspace(0, 6);
for i=1:size(x,2)
    y(i) = ampl*sin(x(i) + fi); 
end

figure(2)
plot(x, y)
title('Graph A*sin(wt + fi')
xlabel('wt')
ylabel('f(wt)')
grid