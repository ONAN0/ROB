% --------------ratanie_matic--------------
function [O_mat,A_mat,B_mat,C_mat,O,A,B,C] = matrixMult(Phi_1, Phi_2, Phi_3, L_1, L_2, L_3)
    Rz_1 = [cos(Phi_1),-sin(Phi_1),0,0; sin(Phi_1),cos(Phi_1),0,0; 0,0,1,0; 0,0,0,1];

    Tz_1 = [1,0,0,0; 0,1,0,0; 0,0,1,L_1; 0,0,0,1];

    Ry_2 = [cos(Phi_2),0,sin(Phi_2),0; 0,1,0,0; -sin(Phi_2),0,cos(Phi_2),0; 0,0,0,1];

    Tz_2 = [1,0,0,0; 0,1,0,0; 0,0,1,L_2; 0,0,0,1];

    Ry_3 = [cos(Phi_3),0,sin(Phi_3),0; 0,1,0,0; -sin(Phi_3),0,cos(Phi_3),0; 0,0,0,1];

    Tz_3 = [1,0,0,0; 0,1,0,0; 0,0,1,L_3; 0,0,0,1];

    p0 = [0;0;0;1];

    O_mat = eye(4);
    A_mat = O_mat * Rz_1 * Tz_1;
    B_mat = A_mat * Ry_2 * Tz_2;
    C_mat= B_mat * Ry_3 * Tz_3;

    O = O_mat * p0;
    A = A_mat * p0;
    B = B_mat * p0;
    C = C_mat * p0;
end