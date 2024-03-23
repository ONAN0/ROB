function updateEndpoints(~, ~, slider1, slider2, slider3,L_1,L_2,L_3,button1,button2,button3,Azimut,Elevation)
    
    % -----stupne_na_radiany-----
    Phi_1 = deg2rad(90 - get(slider1, 'Value'));
    Phi_2 = deg2rad(get(slider2, 'Value'));
    Phi_3 = deg2rad(get(slider3, 'Value'));

    % -------ratanie_bodov-------
    [O_mat,A_mat,B_mat,C_mat,O,A,B,C] = matrixMult(Phi_1, Phi_2, Phi_3,L_1,L_2,L_3);

    % ----------podlaha----------
    x = [-10 -10 10 10];
    y = [-10 10 10 -10];
    z = [0 0 0 0];
    color = [1, 1, 0.8549];

    % --------vykreslenie--------
    subplot(1,2,2);
    plotLine(O, A, B, C);
    hold on;
    fill3(x, y, z, color, 'FaceAlpha', 0.5);
    
    % -----vyber_vykreslenia-----
    % ------------osi------------
    if (get(button1,'Value') == 1)
        plotAxes(O_mat,A_mat,B_mat,C_mat);
        hold on;
    end

    % vertikalna_pracovna_plocha
    if (get(button2,'Value') == 1)
        plotVertical(L_1,L_2,L_3);
        hold on;
    end

    % horizontalna_pracovna_plocha
    if (get(button3,'Value') == 1)
        plotHorizontal(L_1,L_2,L_3);
    end

    hold off;
    
    % -----pohlad-----
    view((get(Azimut, 'Value')),(get(Elevation, 'Value')));
end