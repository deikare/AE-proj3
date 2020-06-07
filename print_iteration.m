function fig = print_iteration(x, y, point_signs, plot_title, axis_vec, w, b, color)
%% funkcja rysujaca klatke
    fig = figure;
    hold on
    
    l= length(y);
    
    for i = 1 : l
        if y(i) > 0
            p = plot(x(i, 1), x(i, 2), point_signs(1), 'Color', 'b');
        else 
            p = plot(x(i, 1), x(i, 2), point_signs(2), 'Color', 'r');
        end
        
        if sign(w * x(i, :)' - b) ~= y(i)
            p.Color = [0 0 0];
        end
    end

    if w(1, 2) == 0
        h = xline(b / w(1, 1));
    else
        h = line(axis_vec(1:2), -w(1, 1) * axis_vec(1:2) / w(1, 2) + b / w(1, 2));
    end
        
    h.Color = color;
    
    axis equal;
    axis(axis_vec);
    xlabel('x1');
    ylabel('x2');
    title(plot_title);
    grid on;
end

