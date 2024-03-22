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

% -----pociatocny_stav------
O = [0;0;0;1];
A = [0;0;L_1;1];
B = [0;0;(L_1 + L_2);1];
C = [0;0;(L_1 + L_2 + L_3);1];

obraz = figure('Name','Zadanie_1_Matula','NumberTitle','off');
panel = uipanel(obraz,'Position',[0.0125, 0.0125, 0.45, 0.975]);

label_azimut = uicontrol(panel,'style', 'text', 'String', 'Rotacia','Units', 'normalized', 'Position', [(posun_hor + odsad_hor/8), 0.815, (0.16 - odsad_hor/4), popis_vyska]);
azimut_slider = uicontrol(panel,'style', 'slider', 'Min', 0, 'Max', 360, 'Value', Azimut, 'Units', 'normalized', 'Position', [odsad_hor, (0.7 + odsad_vert), slider_sirka, slider_vyska]);

label_elevation = uicontrol(panel,'style', 'text', 'String', 'Naklon','Units', 'normalized', 'Position', [(posun_hor + odsad_hor/8), 0.955, (0.16 - odsad_hor/4), popis_vyska]);
elevation_slider = uicontrol(panel,'style', 'slider', 'Min', 0, 'Max', 90, 'Value', Elevation, 'Units', 'normalized', 'Position', [odsad_hor, (0.83 + odsad_vert), slider_sirka, slider_vyska]);

label_axes = uicontrol(panel,'style', 'text', 'String', 'Axes','Units', 'normalized', 'Position', [odsad_hor, button_odsad_vert, button_popis_sirka, popis_vyska]);
osi_button = uicontrol(panel,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + button_popis_sirka), button_odsad_vert, button_sirka, button_vyska]);

label_max_vertical = uicontrol(panel,'style', 'text', 'String', 'Vertical','Units', 'normalized', 'Position', [(odsad_hor + button_sirka + button_popis_sirka), button_odsad_vert, button_popis_sirka, popis_vyska]);
max_vertical_button = uicontrol(panel,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + 2*button_popis_sirka + button_sirka), button_odsad_vert, button_sirka, button_vyska]);

label_max_horizontal = uicontrol(panel,'style', 'text', 'String', 'Horizontal','Units', 'normalized', 'Position', [(odsad_hor + 2*button_popis_sirka + 2*button_sirka), button_odsad_vert, button_popis_sirka, popis_vyska]);
max_horizontal_button = uicontrol(panel,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + 3*button_popis_sirka + 2*button_sirka), button_odsad_vert, button_sirka, button_vyska]);

label1 = uicontrol(panel,'style', 'text', 'String', 'Phi 1','Units', 'normalized', 'Position', [(posun_hor + odsad_hor), 0.115, (0.16 - 2*odsad_hor), popis_vyska]);
slider1 = uicontrol(panel,'style', 'slider', 'Min', -160, 'Max', 160, 'Value', Phi_1, 'Units', 'normalized', 'Position', [odsad_hor, odsad_vert, slider_sirka, slider_vyska]);

label2 = uicontrol(panel,'style', 'text', 'String', 'Phi 2','Units', 'normalized', 'Position', [(posun_hor + odsad_hor), 0.245, (0.16 - 2*odsad_hor), popis_vyska]);
slider2 = uicontrol(panel,'style', 'slider', 'Min', -50, 'Max', 130, 'Value', Phi_2, 'Units', 'normalized', 'Position', [odsad_hor, (0.13 + odsad_vert), slider_sirka, slider_vyska]);

label3 = uicontrol(panel,'style', 'text', 'String', 'Phi 3','Units', 'normalized', 'Position', [(posun_hor + odsad_hor), 0.375, (0.16 - 2*odsad_hor), popis_vyska]);
slider3 = uicontrol(panel,'style', 'slider', 'Min', -30, 'Max', 60, 'Value', Phi_3, 'Units', 'normalized', 'Position', [odsad_hor, (0.26 + odsad_vert), slider_sirka, slider_vyska]);

% --------------pohlad---------------
set(azimut_slider, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(elevation_slider, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

% ----------------osi----------------
set(osi_button, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

% ----------pracovna_plocha----------
set(max_vertical_button, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(max_horizontal_button, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

% -------------ovladanie-------------
set(slider1,'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(slider2, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(slider3, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

% --------prvotne_vykreslenie--------
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

    [O_mat,A_mat,B_mat,C_mat,O,A,B,C] = matrixMult(Phi_1, Phi_2, Phi_3,L_1,L_2,L_3);

    x = [-10 -10 10 10];
    y = [-10 10 10 -10];
    z = [0 0 0 0];
    color = [1, 1, 0.8549];

    subplot(1,2,2);
    plotLine(O, A, B, C);
    hold on;
    fill3(x, y, z, color, 'FaceAlpha', 0.5);
    if (get(button1,'Value') == 1)
        plotAxes(O_mat,A_mat,B_mat,C_mat);
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