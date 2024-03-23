function updateLabel(slider1,label1,slider2,label2,slider3,label3,azimut,azimut_label,elevation,elevation_label)
    
    % -----aktualizacia_hodnot_v_popisku-----
    set(label1, 'String', ['Phi_1: ',num2str(get(slider1, 'Value'))]);
    set(label2, 'String', ['Phi_2: ',num2str(get(slider2, 'Value'))]);
    set(label3, 'String', ['Phi_3: ',num2str(get(slider3, 'Value'))]);
    set(azimut_label, 'String', ['Rotacia: ',num2str(get(azimut, 'Value'))]);
    set(elevation_label, 'String', ['Naklon: ',num2str(get(elevation, 'Value'))]);
end
