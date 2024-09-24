function root = newtonRaphsonSolve(x0, epsilon)
    
    % Newton-Raphson method to solve the equation g(x) = 2*sin(x)*cos(x) - 1 = 0

    % Define the function g(x)
    g = @(x) 2 * sin(x) * cos(x) - 1;
    
    % Define the derivative of g(x), g'(x)
    g_prime = @(x) 2 * cos(2 * x);
    
    % Initialize iteration variables
    x = x0;
    error = 1; % Initial error (any large value)

    n = 0;
    
    % Newton-Raphson iteration loop
    while error > epsilon

        n = n + 1;
        % Calculate the next value using Newton-Raphson formula
        x_new = x - g(x) / g_prime(x);
        
        % Compute the error (difference between current and previous estimate)
        error = abs(x_new - x);
        
        % Update x for the next iteration
        x = x_new;

        % Display Iteration
        disp('Iteration number: ')
        disp(n)

        disp('Iternation value: ')
        disp(x_new)
    end
    
    % Return the root when the error is within tolerance
    root = x;
end
