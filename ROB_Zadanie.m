clear;
clc;
close all;

% --------estetika----------
odsad_vert = 0.025;
odsad_hor = 0.025;
posun_hor = 0.425;

popis_vyska = 0.03;

button_popis_sirka = 0.115;
button_sirka = 0.055;
button_vyska = 0.04;
button_odsad_vert = 17*odsad_vert;

slider_vyska = 0.08;
slider_sirka = (1 - 2*odsad_hor);


Azimut = 45;
Elevation = 45;


% ------dlzky_ramien--------
L_1 = 3.00;
L_2 = 3.00;
L_3 = 2.00;

% ----rozmedzia_stupnov-----
Phi_1 = 0;
Phi_2 = 0;
Phi_3 = 0;

% -----------stav-----------
O = [0;0;0;1];
A = [0;0;L_1;1];
B = [0;0;(L_1 + L_2);1];
C = [0;0;(L_1 + L_2 + L_3);1];

f = figure('Name','Zadanie_1_Matula','NumberTitle','off');
p = uipanel(f,'Position',[0.0125, 0.0125, 0.45, 0.975]);

label_azimut = uicontrol(p,'style', 'text', 'String', 'Rotacia','Units', 'normalized', 'Position', [(posun_hor + odsad_hor/8), 0.815, (0.16 - odsad_hor/4), popis_vyska]);
azimut_slider = uicontrol(p,'style', 'slider', 'Min', 0, 'Max', 360, 'Value', Azimut, 'Units', 'normalized', 'Position', [odsad_hor, (0.7 + odsad_vert), slider_sirka, slider_vyska]);

label_elevation = uicontrol(p,'style', 'text', 'String', 'Naklon','Units', 'normalized', 'Position', [(posun_hor + odsad_hor/8), 0.955, (0.16 - odsad_hor/4), popis_vyska]);
elevation_slider = uicontrol(p,'style', 'slider', 'Min', 0, 'Max', 90, 'Value', Elevation, 'Units', 'normalized', 'Position', [odsad_hor, (0.83 + odsad_vert), slider_sirka, slider_vyska]);

label_axes = uicontrol(p,'style', 'text', 'String', 'Axes','Units', 'normalized', 'Position', [odsad_hor, button_odsad_vert, button_popis_sirka, popis_vyska]);
osi_button = uicontrol(p,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + button_popis_sirka), button_odsad_vert, button_sirka, button_vyska]);

label_max_vertical = uicontrol(p,'style', 'text', 'String', 'Vertical','Units', 'normalized', 'Position', [(odsad_hor + button_sirka + button_popis_sirka), button_odsad_vert, button_popis_sirka, popis_vyska]);
max_vertical_button = uicontrol(p,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + 2*button_popis_sirka + button_sirka), button_odsad_vert, button_sirka, button_vyska]);

label_max_horizontal = uicontrol(p,'style', 'text', 'String', 'Horizontal','Units', 'normalized', 'Position', [(odsad_hor + 2*button_popis_sirka + 2*button_sirka), button_odsad_vert, button_popis_sirka, popis_vyska]);
max_horizontal_button = uicontrol(p,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + 3*button_popis_sirka + 2*button_sirka), button_odsad_vert, button_sirka, button_vyska]);

label1 = uicontrol(p,'style', 'text', 'String', 'Phi 1','Units', 'normalized', 'Position', [(posun_hor + odsad_hor), 0.115, (0.16 - 2*odsad_hor), popis_vyska]);
slider1 = uicontrol(p,'style', 'slider', 'Min', -160, 'Max', 160, 'Value', Phi_1, 'Units', 'normalized', 'Position', [odsad_hor, odsad_vert, slider_sirka, slider_vyska]);

label2 = uicontrol(p,'style', 'text', 'String', 'Phi 2','Units', 'normalized', 'Position', [(posun_hor + odsad_hor), 0.245, (0.16 - 2*odsad_hor), popis_vyska]);
slider2 = uicontrol(p,'style', 'slider', 'Min', -50, 'Max', 130, 'Value', Phi_2, 'Units', 'normalized', 'Position', [odsad_hor, (0.13 + odsad_vert), slider_sirka, slider_vyska]);

label3 = uicontrol(p,'style', 'text', 'String', 'Phi 3','Units', 'normalized', 'Position', [(posun_hor + odsad_hor), 0.375, (0.16 - 2*odsad_hor), popis_vyska]);
slider3 = uicontrol(p,'style', 'slider', 'Min', -30, 'Max', 60, 'Value', Phi_3, 'Units', 'normalized', 'Position', [odsad_hor, (0.26 + odsad_vert), slider_sirka, slider_vyska]);

set(azimut_slider, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(elevation_slider, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

set(osi_button, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(max_vertical_button, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(max_horizontal_button, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

set(slider1,'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(slider2, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(slider3, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

subplot(1,2,2);
plotLine(O, A, B, C);
hold on;
fill3([-10 -10 10 10], [-10 10 10 -10 ], [0 0 0 0],[1, 1, 0.8549], 'FaceAlpha', 0.5);
hold off;
view(Azimut,Elevation)

function updateEndpoints(~, ~, slider1, slider2, slider3,L_1,L_2,L_3,button1,button2,button3,Azimut,Elevation)
    
    Phi_1 = deg2rad(90 - get(slider1, 'Value'));
    Phi_2 = deg2rad(get(slider2, 'Value'));
    Phi_3 = deg2rad(get(slider3, 'Value'));

    [O,A,B,C,Rz_1,Ry_2,Ry_3] = matrixMult(Phi_1, Phi_2, Phi_3,L_1,L_2,L_3);

    x = [-10 -10 10 10];
    y = [-10 10 10 -10];
    z = [0 0 0 0];
    color = [1, 1, 0.8549];

    subplot(1,2,2);
    plotLine(O, A, B, C);
    hold on;
    fill3(x, y, z, color, 'FaceAlpha', 0.5);
    if (get(button1,'Value') == 1)
        plotAxes(O,A,B,C,Rz_1,Ry_2,Ry_3);
        hold on;
    end

    if (get(button2,'Value') == 1)
        plotVertical(L_1,L_2,L_3);
        hold on;
    end

    if (get(button3,'Value') == 1)
        plotHorizontal(L_1,L_2,L_3);
    end

    hold off;
    view((get(Azimut, 'Value')),(get(Elevation, 'Value')))
end

function plotLine(point1, point2, point3,point4)
    
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

function plotAxes(O,A,B,C,Rz_1,Ry_2,Ry_3)
    plotAxis(O,eye(4),eye(4),Rz_1);
    hold on;
    plotAxis(A,eye(4),Ry_2,Rz_1)
    hold off;
    hold on;
    plotAxis(B,Ry_2,Ry_3,Rz_1);
    hold off;
    hold on;
    plotAxis(C,Ry_2,Ry_3,Rz_1);
    hold off;
end

function plotAxis(x,rot_y1,rot_y2,rot_z)
    
    bod1 = [0;0;0;1]+x;
    bod2 = rot_z*rot_y1*rot_y2*[1;0;0;1]+x;
    bod3 = rot_z*rot_y1*rot_y2*[0;1;0;1]+x;
    bod4 = rot_z*rot_y1*rot_y2*[0;0;1;1]+x;

    num_points = 2;
    X1 = linspace(bod1(1), bod2(1), num_points);
    Y1 = linspace(bod1(2), bod2(2), num_points);
    Z1 = linspace(bod1(3), bod2(3), num_points);
    
    X2 = linspace(bod1(1), bod3(1), num_points);
    Y2 = linspace(bod1(2), bod3(2), num_points);
    Z2 = linspace(bod1(3), bod3(3), num_points);

    X3 = linspace(bod1(1), bod4(1), num_points);
    Y3 = linspace(bod1(2), bod4(2), num_points);
    Z3 = linspace(bod1(3), bod4(3), num_points);

    plot3(X1, Y1, Z1, 'r', 'LineWidth',2);
    hold on;
    plot3(X2, Y2, Z2, 'g', 'LineWidth',2);
    plot3(X3, Y3, Z3, 'b', 'LineWidth',2);
    hold off;
end

function plotVertical(L_1,L_2,L_3)
    Phi_1 = 0;
    Phi_2 = -50:5:130;
    Phi_3 = -30:10:60;

    % Preallocate arrays to store coordinates of point4
    counter = 1;

    % Iterate through all combinations of slider1, slider2, and slider3

    for j = 1:length(Phi_2)
        if j == 1
            for k = 1:length(Phi_3)
                if k <= ceil((1/3)*length(Phi_3)) || k >= ceil((2/3)*length(Phi_3))
                    [~, ~, ~, point4, ~, ~, ~] = matrixMult(deg2rad(90 - Phi_1), deg2rad(Phi_2(j)), deg2rad(Phi_3(k)), L_1, L_2, L_3);
                    x_points(counter) = point4(1);
                    y_points(counter) = point4(2);
                    z_points(counter) = point4(3);
                    counter = counter + 1;
                end
            end
        end
    
        if j <= ceil((23/180)*length(Phi_2))
            [~, ~, ~, point4, ~, ~, ~] = matrixMult(deg2rad(90 - Phi_1), deg2rad(Phi_2(j)), deg2rad(-30), L_1, L_2, L_3);
            x_points(counter) = point4(1);
            y_points(counter) = point4(2);
            z_points(counter) = point4(3);
            counter = counter + 1;
        end

        for k = 1:length(Phi_3)
            if k == ceil((1/3)*length(Phi_3)) || k == length(Phi_3)
                [~, ~, ~, point4, ~, ~, ~] = matrixMult(deg2rad(90 - Phi_1), deg2rad(Phi_2(j)), deg2rad(Phi_3(k)), L_1, L_2, L_3);
                x_points(counter) = point4(1);
                y_points(counter) = point4(2);
                z_points(counter) = point4(3);
                counter = counter + 1;
            end
        end

        if j == length(Phi_2)
            for k = 1:length(Phi_3)
                if ceil((13/45)*length(Phi_3)) <= k
                    [~, ~, ~, point4, ~, ~, ~] = matrixMult(deg2rad(90 - Phi_1), deg2rad(Phi_2(j)), deg2rad(Phi_3(k)), L_1, L_2, L_3);
                    x_points(counter) = point4(1);
                    y_points(counter) = point4(2);
                    z_points(counter) = point4(3);
                    counter = counter + 1;
                end
            end
        end
    end

    % Plot the points using scatter3
    scatter3(x_points, y_points, z_points, 2.5, 'k','filled');
end

function plotHorizontal(L_1,L_2,L_3)
    Phi_1 = -160:5:160;
    Phi_2 = -50:5:130;
    Phi_3 = -30:10:60;

    counter = 1;
    tolerance = 0.00001;

    for i = 1:length(Phi_1)
        for j = 1:length(Phi_2)
            for k = 1:length(Phi_3)
                [~, ~, ~, point4, ~, ~, ~] = matrixMult(deg2rad(90 - Phi_1(i)), deg2rad(Phi_2(j)), deg2rad(Phi_3(k)), L_1, L_2, L_3);
                x_points(counter) = point4(1);
                y_points(counter) = point4(2);
                z_points(counter) = L_1;
                % Check if the norm of [x_points(counter), y_points(counter)] is within the tolerance range
                if (abs(norm([x_points(counter), y_points(counter)]) - (L_2+L_3)) <= tolerance) || ((i >= ceil((7/16)*length(Phi_1)) && i <= ceil((9/16)*length(Phi_1))) && j == 1 && k == 1) || ((i == 1 || i == length(Phi_1)) && j == ceil((13/18)*length(Phi_2)))
                    counter = counter + 1;
                else
                    x_points(counter) = 0;
                    y_points(counter) = 0;
                    z_points(counter) = 0;
                end
            end
        end
    end


    % Plot the points using scatter3
    scatter3(x_points, y_points, z_points, 2.5, 'k','filled');
        
end

function [O,A,B,C,Rz_1,Ry_2,Ry_3] = matrixMult(Phi_1, Phi_2, Phi_3, L_1, L_2, L_3)
    Rz_1 = [cos(Phi_1),-sin(Phi_1),0,0; sin(Phi_1),cos(Phi_1),0,0; 0,0,1,0; 0,0,0,1];

    Tz_1 = [1,0,0,0; 0,1,0,0; 0,0,1,L_1; 0,0,0,1];

    Ry_2 = [cos(Phi_2),0,sin(Phi_2),0; 0,1,0,0; -sin(Phi_2),0,cos(Phi_2),0; 0,0,0,1];

    Tz_2 = [1,0,0,0; 0,1,0,0; 0,0,1,L_2; 0,0,0,1];

    Ry_3 = [cos(Phi_3),0,sin(Phi_3),0; 0,1,0,0; -sin(Phi_3),0,cos(Phi_3),0; 0,0,0,1];

    Tz_3 = [1,0,0,0; 0,1,0,0; 0,0,1,L_3; 0,0,0,1];

    p0 = [0;0;0;1];

    A_mat = Rz_1 * Tz_1;
    B_mat = A_mat * Ry_2 * Tz_2;
    C_mat= B_mat * Ry_3 * Tz_3;

    O = p0;
    A = A_mat * p0;
    B = B_mat * p0;
    C = C_mat * p0;
end