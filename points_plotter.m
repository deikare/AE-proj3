function fig = points_plotter(x, y, plot_legend, point_signs, plot_title)
%% funkcja rysujaca zbior danych treningowych
    [l, ~] = size(x);
 
    fig = figure;
    hold on
    
    x_plus = [];
    x_minus = [];
    
    for i = 1 : l
        if y(i) > 0
            x_plus = [x_plus; x(i, :)];
        elseif y(i) < 0 
            x_minus = [x_minus; x(i, :)];
        end
    end
    
    plot(x_plus(:, 1), x_plus(:, 2), point_signs(1));
    plot(x_minus(:, 1), x_minus(:, 2), point_signs(2));
 
    axis equal;
    legend(plot_legend, 'Location', 'west');
    xlabel('x1');
    ylabel('x2');
    title(plot_title);
    grid on;
end

