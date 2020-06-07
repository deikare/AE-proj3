function fig = learning_plotter(x, y, plot_legend, point_signs, plot_title, axis_vec, history, numer_albumu)
%% funkcja przedstawiajaca kolejne klasyfikatory
    [l, ~] = size(x);
    
    rng(numer_albumu);
    
    fig = figure;
    hold on
    
    x_plus = [];
    x_minus = [];
    
    
    %% podzial na zbiory wedlug y
    for i = 1 : l
        if y(i) > 0
            x_plus = [x_plus; x(i, :)];
        elseif y(i) < 0 
            x_minus = [x_minus; x(i, :)];
        end
    end
    
    plot(x_plus(:, 1), x_plus(:, 2), point_signs(1));
    plot(x_minus(:, 1), x_minus(:, 2), point_signs(2));
    
    iterations_amount = length(history.b);
    
    %% wyrysowanie kolejnych klasyfikatorow
    for i = 1 : iterations_amount
        line_text = ['kl', num2str(i)];
        if history.w(i, 2) == 0
            h = xline(history.b(i) / history.w(i, 1));
        else
            h = line(axis_vec(1:2), -history.w(i, 1) * axis_vec(1:2) / history.w(i, 2) + history.b(i) / history.w(i, 2));
        end
        if i == iterations_amount || i == 1
            h.LineStyle = '-';
        else
            h.LineStyle = '--';
        end
        h.DisplayName = line_text;
        plot_legend = [plot_legend; line_text];
        legend(plot_legend);
        h.Color = [rand() rand() rand()];
    end
    
    axis equal;
    axis(axis_vec);
    xlabel('x1');
    ylabel('x2');
    title(plot_title);
    grid on;
end

