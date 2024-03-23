function plotLine(point1, point2, point3,point4)
    
    % -----vykreslenie_ramena-----
    num_points = 2;
    X(1,:) = linspace(point1(1), point2(1), num_points);
    Y(1,:) = linspace(point1(2), point2(2), num_points);
    Z(1,:) = linspace(point1(3), point2(3), num_points);
    
    X(2,:) = linspace(point2(1), point3(1), num_points);
    Y(2,:) = linspace(point2(2), point3(2), num_points);
    Z(2,:) = linspace(point2(3), point3(3), num_points);

    X(3,:) = linspace(point3(1), point4(1), num_points);
    Y(3,:) = linspace(point3(2), point4(2), num_points);
    Z(3,:) = linspace(point3(3), point4(3), num_points);

    plot3(X, Y, Z,'-o', 'LineWidth',5,'Color','#FF9933','MarkerSize',5,'MarkerEdgeColor','#000000');
    grid on;
    xlabel('X');
    xlim([-10 , 10]);
    ylabel('Y');
    ylim([-10 , 10]);
    zlabel('Z');
    zlim([-2 , 10]);
    title('3D Vizualizer robota');
end