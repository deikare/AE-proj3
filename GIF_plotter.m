function GIF_plotter(x, y, point_signs, plot_title, axis_vec, history, numer_albumu, path)
%% funkcja zapisujaca potrzebne klatki animacji
    rng(numer_albumu);
    
    iterations_amount = length(history.b);
    
    for i = 1 : iterations_amount
        color = [rand() rand() rand()];
        current_plot_title = [plot_title, 'i = ', num2str(i), ' / ', num2str(iterations_amount)];
        fig = print_iteration(x, y, point_signs, current_plot_title, axis_vec, history.w(i, :), history.b(i), color);
        name = [path, 'i_', num2str(i), '.png'];
        saveas(fig, name);
        close all
    end
end

