function plotAxis(mat)
    
    d = 1;

    bod_osi = mat * [0,d,0,0;0,0,d,0;0,0,0,d;1,1,1,1];

    num_points = 2;
    X1 = linspace(bod_osi(1,1), bod_osi(1,2), num_points);
    Y1 = linspace(bod_osi(2,1), bod_osi(2,2), num_points);
    Z1 = linspace(bod_osi(3,1), bod_osi(3,2), num_points);

    X2 = linspace(bod_osi(1,1), bod_osi(1,3), num_points);
    Y2 = linspace(bod_osi(2,1), bod_osi(2,3), num_points);
    Z2 = linspace(bod_osi(3,1), bod_osi(3,3), num_points);

    X3 = linspace(bod_osi(1,1), bod_osi(1,4), num_points);
    Y3 = linspace(bod_osi(2,1), bod_osi(2,4), num_points);
    Z3 = linspace(bod_osi(3,1), bod_osi(3,4), num_points);

    plot3(X1,Y1,Z1, 'r', 'LineWidth',2);
    hold on;
    plot3(X2,Y2,Z2, 'g', 'LineWidth',2);
    plot3(X3,Y3,Z3, 'b', 'LineWidth',2);
    hold off;
end