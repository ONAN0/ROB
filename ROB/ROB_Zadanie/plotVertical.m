function plotVertical(L_1,L_2,L_3)
    Phi_2 = -50:4:130;
    Phi_3 = -30:8:60;

    Phi_2_lenght = length(Phi_2);
    Phi_3_lenght = length(Phi_3);

    persistent x_points_v
    persistent y_points_v
    persistent z_points_v

    if isempty(x_points_v) || isempty(y_points_v) || isempty(z_points_v)

        x_points_v = zeros(1, ceil(Phi_2_lenght*Phi_3_lenght/227));
        y_points_v = zeros(1, ceil(Phi_2_lenght*Phi_3_lenght/227));
        z_points_v = zeros(1, ceil(Phi_2_lenght*Phi_3_lenght/227));

        counter = 1;

        for j = 1:Phi_2_lenght
            if j == 1
                for k = 1:Phi_3_lenght
                    if k <= ceil((1/3)*Phi_3_lenght) || k >= ceil((2/3)*Phi_3_lenght)
                        [~, ~, ~, ~, ~, ~, ~, point4] = matrixMult(deg2rad(90), deg2rad(Phi_2(j)), deg2rad(Phi_3(k)), L_1, L_2, L_3);
                        x_points_v(counter) = point4(1);
                        y_points_v(counter) = point4(2);
                        z_points_v(counter) = point4(3);
                        counter = counter + 1;
                    end
                end
            end
    
            if j <= ceil((23/180)*Phi_2_lenght)
                [~, ~, ~, ~, ~, ~, ~, point4] = matrixMult(deg2rad(90), deg2rad(Phi_2(j)), deg2rad(-30), L_1, L_2, L_3);
                x_points_v(counter) = point4(1);
                y_points_v(counter) = point4(2);
                z_points_v(counter) = point4(3);
                counter = counter + 1;
            end

            for k = 1:Phi_3_lenght
                if k == ceil((1/3)*Phi_3_lenght) || k == Phi_3_lenght
                    [~, ~, ~, ~, ~, ~, ~, point4] = matrixMult(deg2rad(90), deg2rad(Phi_2(j)), deg2rad(Phi_3(k)), L_1, L_2, L_3);
                    x_points_v(counter) = point4(1);
                    y_points_v(counter) = point4(2);
                    z_points_v(counter) = point4(3);
                    counter = counter + 1;
                end
            end

            if j == Phi_2_lenght
                for k = 1:Phi_3_lenght
                    if ceil((13/45)*Phi_3_lenght) <= k
                        [~, ~, ~, ~, ~, ~, ~, point4] = matrixMult(deg2rad(90), deg2rad(Phi_2(j)), deg2rad(Phi_3(k)), L_1, L_2, L_3);
                        x_points_v(counter) = point4(1);
                        y_points_v(counter) = point4(2);
                        z_points_v(counter) = point4(3);
                        counter = counter + 1;
                    end
                end
            end
        end
    end

    scatter3(x_points_v, y_points_v, z_points_v, 2.5, 'k','filled');
end