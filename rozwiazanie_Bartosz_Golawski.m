%% AE - projekt nr 3
%% Bartosz Goławski
%% nr albumu 293452
%% 6.06.2020

%% zakomentowane zapisywania danych oraz wykresów

clear
close all

params;

i = 1;

eta_v = [0.01 0.1 0.3 0.6 0.9];
for eta = eta_v
    [w, b, cycles, iterations, history, intervals] = perceptron_training(x, y, eta, [], [], numer_albumu);
    
    learning_eta(i).eta = eta;
    learning_eta(i).w = w;
    learning_eta(i).b = b;
    learning_eta(i).cycles = cycles;
    learning_eta(i).iterations = iterations;
    learning_eta(i).history = history;
    learning_eta(i).intervals = intervals;
    learning_eta(i).cycles_amount = length(cycles) - 1;
    learning_eta(i).iterations_amount = length(iterations);
    learning_eta(i).improv_amount = length(history.b) - 1;
    
    i = i + 1;
    
%     path = ['GIF_data/a/eta_', num2str(eta), '_'];
%     plot_title = ['Zmiany parametrów klasyfikatora, \eta = ', num2str(eta), ', '];
%     GIF_plotter(x, y, point_signs, plot_title, axis_vec_GIF, history, numer_albumu, path);
%     
    plot_title = ['Zmiany parametrów klasyfikatora, \eta = ', num2str(eta)];
    fig = learning_plotter(x, y, plot_legend, point_signs, plot_title, axis_vec, history, numer_albumu);
    path = ['wykresy/a_params_eta_', num2str(eta), '.png'];
%     saveas(fig, path);
    
    plot_title = ['Błąd klasyfikacji punktów treningowych, \eta = ', num2str(eta)];
    fig = wrong_classified_plotter(iterations, intervals, plot_title);
    path = ['wykresy/a_error_eta_', num2str(eta), '.png'];
%     saveas(fig, path);
    
    close all
end

eta = 0.2;



w0_v = [1 0; 0 1; 1 -1; 1 1]';
b0 = 0;

i = 1;
for w0 = w0_v
    [w, b, cycles, iterations, history, intervals] = perceptron_training(x, y, eta, w0', b0, numer_albumu);
    
    learning_w(i).w0 = w0';
    learning_w(i).w = w;
    learning_w(i).b = b;
    learning_w(i).cycles = cycles;
    learning_w(i).iterations = iterations;
    learning_w(i).history = history;
    learning_w(i).intervals = intervals;
    learning_w(i).cycles_amount = length(cycles) - 1;
    learning_w(i).iterations_amount = length(iterations);
    learning_w(i).improv_amount = length(history.b) - 1;

    
    i = i + 1;
    
%     path = ['GIF_data/b/w0_', num2str(w0(1)), '_', num2str(w0(2)), '_'];
%     plot_title = ['Zmiany parametrów klasyfikatora, w0 = ', num2str(w0'), ', '];
%     GIF_plotter(x, y, point_signs, plot_title, axis_vec_GIF, history, numer_albumu, path);
 
    plot_title = ['Zmiany parametrów klasyfikatora, w0 = ', num2str(w0')];
    fig = learning_plotter(x, y, plot_legend, point_signs, plot_title, axis_vec, history, numer_albumu);
    path = ['wykresy/b_params_w0_', num2str(w0(1)), '_', num2str(w0(2)), '.png'];
%     saveas(fig, path);
    
    plot_title = ['Błąd klasyfikacji punktów treningowych, w0 = ', num2str(w0')];
    fig = wrong_classified_plotter(iterations, intervals, plot_title);
    path = ['wykresy/b_error_w0_', num2str(w0(1)), '_', num2str(w0(2)), '.png'];
%     saveas(fig, path);
    
    close all
end