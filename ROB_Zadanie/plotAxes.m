function plotAxes(O,A,B,C)
    
    %-----vykreslenie_osi-----
    plotAxis(O);
    hold on;
    plotAxis(A)
    hold off;
    hold on;
    plotAxis(B);
    hold off;
    hold on;
    plotAxis(C);
    hold off;
end