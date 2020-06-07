function [w, b, cycles, iterations, history, intervals] = perceptron_training(x, y, eta, w0, b0, number_albumu)
%% funkcja przeprowadzajaca uczenie perceptronu
    [l, n] = size(x);
    
    cycles = [];
    iterations = [];
    
    rng(number_albumu);

    if isempty(w0)
        w = rand(1, n);
    else
        w = w0;
    end
    
    if isempty(b0)
        b = rand();
    else
        b = b0;
    end
    
    history.w = w;
    history.b = b;
    
    %% obliczenie r
    r = 0;
    for i = 1 : l
        x_current = x(i, :);
        if sqrt(x_current * x_current') > r
            r = sqrt(x_current * x_current');
        end
    end
    
    j = 1;
    intervals = [];
    
    
    %% petla uczaca
    while true
        for i = 1 : l
            wrong_classified_amount = get_wrong_classified(x, y, w, b);
            iterations = [iterations; wrong_classified_amount];
            %% jezeli 0 zle zaklasyfikowanych, to skoncz uczenie
            if wrong_classified_amount == 0
                cycles = [cycles; wrong_classified_amount];
                break
            end
            
            if sign(w * x(i, :)' - b) ~= y(i)
                %% punkt zle zaklasyfikowany, nastepne uczenie
                w = w + eta * y(i) * x(i, :);
                b = b - eta * y(i) * r^2;
                
                history.w = [history.w; w];
                history.b = [history.b; b];
                intervals = [intervals; j];
            end
            j = j + 1;
        end
        
        %% po przejsciu wszystkich punktow mamy cykl
        wrong_classified_amount = get_wrong_classified(x, y, w, b);
        cycles = [cycles; wrong_classified_amount];
        
        if wrong_classified_amount == 0
            break
        end
    end
    
end

function amount = get_wrong_classified(x, y, w, b)
    amount = 0;
    
    l = length(y);
    
    for i = 1 : l
        if sign(w * x(i, :)' - b) ~= y(i)
            amount = amount + 1;
        end
    end
end

