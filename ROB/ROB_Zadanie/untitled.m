% Create a figure window
    fig = figure('Position', [200, 200, 400, 150]);

    % Create a slider
    slider = uicontrol('Style', 'slider', ...
                       'Min', 0, 'Max', 100, ...
                       'Value', 50, ...
                       'SliderStep', [0.01, 0.1], ...
                       'Position', [100, 60, 200, 20]);
    
    % Create a text box to display the slider value
    label = uicontrol('Style', 'text', ...
                           'Position', [200, 100, 50, 20], ...
                           'String', ['Phi:', num2str(get(slider, 'Value'))]);

    set(slider,'Callback', {@updateNumber,slider,label});

    

    % Function to update the number text
    function updateNumber(~, ~, slider,numberText)
        set(numberText, 'String', ['Phi:', num2str(get(slider, 'Value'))]);
    end