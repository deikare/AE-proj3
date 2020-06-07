function fig = wrong_classified_plotter(iterations, intervals, plot_title)
%% funkcja rysujaca zaleznosc miedzy iteracjami i liczba blednych klasyfikacji
    fig = figure;
    
    stairs(iterations);
    hold on
    
    %% wyrysowanie ostatniego "0"
    scatter(length(iterations), 0, [], [0 0.4470 0.7410], 'filled');
    
    for i = 1 : length(intervals)
        xline(intervals(i), '--', [], 'Color', 'r');
    end
    xlabel('iteracja');
    ylabel('błędne klasyfikacje');
    title(plot_title);
    if length(iterations) > 1
        axis([1 length(iterations)+1 min(iterations) max(iterations)+1]);
    end
    hold off
end

