clear;
clc;
close all;

% --------estetika----------
odsad_vert = 0.025;
odsad_hor = 0.025;
posun_hor = 0.425;

popis_vyska = 0.03;

button_popis_sirka = 0.2;
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
Phi_2 = 0;
Phi_3 = 0;

% -----pociatocny_stav------
O = [0;0;0;1];
A = [0;0;L_1;1];
B = [0;0;(L_1 + L_2);1];
C = [0;0;(L_1 + L_2 + L_3);1];

obraz = figure('Name','Zadanie_1_Matula','NumberTitle','off');
panel = uipanel(obraz,'Position',[0.0125, 0.0125, 0.45, 0.975]);

% ---------pohlad-----------
Azimut = 45;
Elevation = 45;

azimut_slider = uicontrol(panel,'style', 'slider', 'Min', 0, 'Max', 360, 'Value', Azimut, 'Units', 'normalized', 'Position', [odsad_hor, (0.7 + odsad_vert), slider_sirka, slider_vyska]);
elevation_slider = uicontrol(panel,'style', 'slider', 'Min', 0, 'Max', 90, 'Value', Elevation, 'Units', 'normalized', 'Position', [odsad_hor, (0.83 + odsad_vert), slider_sirka, slider_vyska]);

label_azimut = uicontrol(panel,'style', 'text', 'String', ['Rotacia: ',num2str(get(azimut_slider, 'Value'))],'Units', 'normalized', 'Position', [posun_hor*5/6, 0.815, (0.32 - odsad_hor), popis_vyska]);
label_elevation = uicontrol(panel,'style', 'text', 'String', ['Naklon: ',num2str(get(elevation_slider, 'Value'))],'Units', 'normalized', 'Position', [posun_hor*5/6, 0.955, (0.32 - odsad_hor), popis_vyska]);

% -----------osi------------
osi_button = uicontrol(panel,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + button_popis_sirka), button_odsad_vert, button_sirka, button_vyska]);

label_axes = uicontrol(panel,'style', 'text', 'String', 'Axes', 'HorizontalAlignment', 'right', 'Units', 'normalized', 'Position', [odsad_hor, button_odsad_vert, button_popis_sirka, popis_vyska]);

% -----pracovna_plocha------
max_vertical_button = uicontrol(panel,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + 2*button_popis_sirka + button_sirka), button_odsad_vert, button_sirka, button_vyska]);
max_horizontal_button = uicontrol(panel,'style','checkbox','Units', 'normalized','Position',[( odsad_hor + 3*button_popis_sirka + 2*button_sirka), button_odsad_vert, button_sirka, button_vyska]);

label_max_vertical = uicontrol(panel,'style', 'text', 'String', 'Vertical', 'HorizontalAlignment', 'right', 'Units', 'normalized', 'Position', [(odsad_hor + button_sirka + button_popis_sirka), button_odsad_vert, button_popis_sirka, popis_vyska]);
label_max_horizontal = uicontrol(panel,'style', 'text', 'String', 'Horizontal', 'HorizontalAlignment', 'right','Units', 'normalized', 'Position', [(odsad_hor + 2*button_popis_sirka + 2*button_sirka), button_odsad_vert, button_popis_sirka, popis_vyska]);

% --------ovladanie---------
slider1 = uicontrol(panel,'style', 'slider', 'Min', -160, 'Max', 160, 'Value', Phi_1, 'Units', 'normalized', 'Position', [odsad_hor, odsad_vert, slider_sirka, slider_vyska]);
slider2 = uicontrol(panel,'style', 'slider', 'Min', -50, 'Max', 130, 'Value', Phi_2, 'Units', 'normalized', 'Position', [odsad_hor, (0.13 + odsad_vert), slider_sirka, slider_vyska]);
slider3 = uicontrol(panel,'style', 'slider', 'Min', -30, 'Max', 60, 'Value', Phi_3, 'Units', 'normalized', 'Position', [odsad_hor, (0.26 + odsad_vert), slider_sirka, slider_vyska]);

label1 = uicontrol(panel,'style', 'text', 'String', ['Phi_1: ', num2str(get(slider1, 'Value'))],'Units', 'normalized', 'Position', [posun_hor*5/6, 0.115, (0.32 - odsad_hor), popis_vyska]);
label2 = uicontrol(panel,'style', 'text', 'String', ['Phi_2: ', num2str(get(slider2, 'Value'))],'Units', 'normalized', 'Position', [posun_hor*5/6, 0.245, (0.32 - odsad_hor), popis_vyska]);
label3 = uicontrol(panel,'style', 'text', 'String', ['Phi_3: ', num2str(get(slider3, 'Value'))],'Units', 'normalized', 'Position', [posun_hor*5/6, 0.375, (0.32 - odsad_hor), popis_vyska]);

% -----aktualne_hodnoty-----
addlistener(slider1, 'Value', 'PostSet', @(~,~) updateLabel(slider1, label1, slider2, label2, slider3, label3, azimut_slider, label_azimut, elevation_slider, label_elevation));
addlistener(slider2, 'Value', 'PostSet', @(~,~) updateLabel(slider1, label1, slider2, label2, slider3, label3, azimut_slider, label_azimut, elevation_slider, label_elevation));
addlistener(slider3, 'Value', 'PostSet', @(~,~) updateLabel(slider1, label1, slider2, label2, slider3, label3, azimut_slider, label_azimut, elevation_slider, label_elevation));
addlistener(azimut_slider, 'Value', 'PostSet', @(~,~) updateLabel(slider1, label1, slider2, label2, slider3, label3, azimut_slider, label_azimut, elevation_slider, label_elevation));
addlistener(elevation_slider, 'Value', 'PostSet', @(~,~) updateLabel(slider1, label1, slider2, label2, slider3, label3, azimut_slider, label_azimut, elevation_slider, label_elevation));

% ---------pohlad-----------
set(azimut_slider, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(elevation_slider, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

% -----------osi------------
set(osi_button, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

% -----pracovna_plocha------
set(max_vertical_button, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(max_horizontal_button, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

% --------ovladanie---------
set(slider1,'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(slider2, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});
set(slider3, 'Callback', {@updateEndpoints, slider1, slider2, slider3,L_1,L_2,L_3,osi_button,max_vertical_button,max_horizontal_button,azimut_slider,elevation_slider});

% ---prvotne_vykreslenie----
subplot(1,2,2);
plotLine(O, A, B, C);
hold on;
fill3([-10 -10 10 10], [-10 10 10 -10 ], [0 0 0 0],[1, 1, 0.8549], 'FaceAlpha', 0.5);
hold off;

% ----------pohlad----------
view(Azimut,Elevation);