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

% ------dlzky_ramien--------
L_1 = 3.00;
L_2 = 3.00;
L_3 = 2.00;

% ----rozmedzia_stupnov-----
Phi_1 = 0;
Phi_2 = 40;
Phi_3 = 15;

% -----------stav-----------
O = [0;0;0;1];
A = [0;0;3;1];
B = [0;1.92;5.29;1];
C = [0;3.56;6.44;1];

f = figure('Name','Zadanie_1_Matula','NumberTitle','off');
p = uipanel(f,'Position',[0.0125, 0.0125, 0.45, 0.975]);

label_axes = uicontrol(p,'style', 'text', 'String', 'Axes','Units', 'normalized', 'Position', [odsad_hor, button_odsad_vert, button_popis_sirka, popis_vyska]);
axes_button = uicontrol(p,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + button_popis_sirka), button_odsad_vert, button_sirka, button_vyska]);

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

set(axes_button,'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,axes_button,max_vertical_button,max_horizontal_button});
set(slider1,'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,axes_button,max_vertical_button,max_horizontal_button});
set(slider2, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,axes_button,max_vertical_button,max_horizontal_button});
set(slider3, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,axes_button,max_vertical_button,max_horizontal_button});

subplot(1,2,2);
plotLine(O, A, B, C);
hold on;
fill3([-10 -10 10 10], [-10 10 10 -10 ], [0 0 0 0],[1, 1, 0.8549], 'FaceAlpha', 0.5);
hold off;

function updateEndpoints(~, ~, slider1, slider2, slider3,L_1,L_2,L_3,button1,button2,button3)
    
    Phi_1 = deg2rad(90 - get(slider1, 'Value'));
    Phi_2 = deg2rad(get(slider2, 'Value'));
    Phi_3 = deg2rad(get(slider3, 'Value'));

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

    O = [0;0;0;1];
    A = A_mat * p0;
    B = B_mat * p0;
    C = C_mat * p0;

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
    end

    if (get(button2,'Value') == 1)
        plotVertical();
    end

    if (get(button3,'Value') == 1)
        plotHorizontal();
    end

    hold off;
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
    xlabel('X-axis');
    xlim([-10 , 10]);
    ylabel('Y-axis');
    ylim([-10 , 10]);
    zlabel('Z-axis');
    zlim([-2 , 10]);
    title('3D Robot Arm Vizualizer');

    view(45,45);
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

function plotVertical()
    
end