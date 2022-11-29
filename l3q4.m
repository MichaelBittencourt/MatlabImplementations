function l3q4()
    x = -10:10;
    k = 1;
    for i=1:21
        for j=1:21
            y(1, k) = i - 11;
            y(2, k) = j - 11;
            k = k+1
        end
    end
    z = (1/50)*y'
    z = z*[93 24; 24 107]
    z = z*y 
    z = z - (1/5)*[42 31]*y - 23/2;
    [px,py] = gradient(z);
    figure
    contour(x,y,z)
    hold on
    quiver(x,y,px,py)
    hold off

    %[X,Y] = meshgrid(-10:.1:10);
    %Z = (1/50)*Y'*[93 24; 24 107]*Y - (1/5)*[42 31]*Y - 23/2.^2+-(Y).^2+100;
    %surf(X,Y,Z)
end
