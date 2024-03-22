function plotHorizontal(L_1,L_2,L_3)
    Phi_1 = -160:4:160;
    Phi_2 = -50:5:130;
    Phi_3 = -30:10:60;

    Phi_1_lenght = length(Phi_1);
    Phi_2_lenght = length(Phi_2);
    Phi_3_lenght = length(Phi_3);
    
    persistent x_points_h
    persistent y_points_h
    persistent z_points_h

    if isempty(x_points_h) || isempty(y_points_h) || isempty(z_points_h)

        x_points_h = zeros(1, ceil(Phi_1_lenght*Phi_2_lenght*Phi_3_lenght/202));
        y_points_h = zeros(1, ceil(Phi_1_lenght*Phi_2_lenght*Phi_3_lenght/202));
        z_points_h = zeros(1, ceil(Phi_1_lenght*Phi_2_lenght*Phi_3_lenght/202));

        counter = 1;
        tolerance = 0.00001;

        for i = 1:Phi_1_lenght
            for j = 1:Phi_2_lenght
                for k = 1:Phi_3_lenght
                    [~, ~, ~, ~, ~, ~, ~, point4] = matrixMult(deg2rad(90 - Phi_1(i)), deg2rad(Phi_2(j)), deg2rad(Phi_3(k)), L_1, L_2, L_3);
                    
                    x_points_h(counter) = point4(1);
                    y_points_h(counter) = point4(2);
                    z_points_h(counter) = L_1;
                    
                    if (abs(norm([x_points_h(counter), y_points_h(counter)]) - (L_2+L_3)) <= tolerance) || ((i >= ceil((7/16)*Phi_1_lenght) && i <= ceil((9/16)*Phi_1_lenght)) && j == 1 && k == 1) || ((i == 1 || i == Phi_1_lenght) && j == ceil((13/18)*Phi_2_lenght))
                        counter = counter + 1;
                    else
                        x_points_h(counter) = 0;
                        y_points_h(counter) = 0;
                        z_points_h(counter) = 0;
                    end
                end
            end
        end
    end

    scatter3(x_points_h, y_points_h, z_points_h, 2.5, 'k','filled');
        
end