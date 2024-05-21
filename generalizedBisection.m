function [root, iterations] = generalizedBisection(a, b, e, f, N)
    if f(a) * f(b) > 0
        error("Initial interval does not bracket the root.");
    end
    
    c = (a + b) / 2;
    iterations = 0;

    % Print header
    fprintf('i\t\ta\t\tb\t\tc\t\tf(a)\t\tf(b)\t\tf(c)\t\tError\n');

    while iterations < N
        fa = f(a);
        fb = f(b);
        fc = f(c);
        error = abs(fc);

        % Print values
        fprintf('%d\t\t%.7f\t%.7f\t%.7f\t%.7f\t%.7f\t%.7f\t%.7f\n', iterations, a, b, c, fa, fb, fc, error);
        if abs(fc) <= e
            root = c;
            return;
        end

        if fc * fa < 0
            b = c;
        else
            a = c;
        end
        
        c = (a + b) / 2;

        iterations = iterations + 1;
    end

    % If maximum iterations reached, return last approximation
    root = c;
end
