function [P, Q, Vmag, Vtheta] = DC_PowerFlow_Solution(P, Q, Vmag, Vtheta, Ymag, Ytheta)

    % Number of buses
    n = length(P);

    % Solve for DC Solution using brute force algebra algorithm
    while any(isnan(P)) || any(isnan(Q)) || any(isnan(Vmag)) || any(isnan(Vtheta))
    
        for i = 1:n
            for j = 1:n
        
                % Solve for Real Power
                if isnan(P(i)) && ~isnan(Vmag(i)) && ~isnan(Vmag(j)) && ~isnan(Vtheta(i)) && ~isnan(Vtheta(j)) % Use isnan() to check if P(i) is NaN
                    P(i) = Ymag(i,j) * Vmag(i) * Vmag(j) * cos(Vtheta(i) - Vtheta(j) - Ytheta(i,j));
                end
        
                % Solve for Reactive Power
                if isnan(Q(i)) && ~isnan(Vmag(i)) && ~isnan(Vmag(j)) && ~isnan(Vtheta(i)) && ~isnan(Vtheta(j)) % Use isnan() to check if P(i) is NaN
                    Q(i) = Ymag(i,j) * Vmag(i) * Vmag(j) * sin(Vtheta(i) - Vtheta(j) - Ytheta(i,j));
                end
    
                % Solve for Voltage Magnitude provided Real Power 
                if isnan(Vmag(i)) && ~isnan(P(i)) && ~isnan(Vmag(j)) && ~isnan(Vtheta(i)) && ~isnan(Vtheta(j)) % Use isnan() to check if P(i) is NaN
                    Vmag(i) = P(i) / (Ymag(i,j) * Vmag(j) * cos(Vtheta(i) - Vtheta(j) - Ytheta(i,j)));
                end
        
                % Solve for Voltage Magnitude provided Reactive Power 
                if isnan(Vmag(i)) && ~isnan(Q(i)) && ~isnan(Vmag(j)) && ~isnan(Vtheta(i)) && ~isnan(Vtheta(j)) % Use isnan() to check if P(i) is NaN
                    Vmag(i) = Q(i) / (Ymag(i,j) * Vmag(j) * sin(Vtheta(i) - Vtheta(j) - Ytheta(i,j)));
                end
        
                % Solve for Voltage Angle provided Real Power
                % acos and asin return complex values when their arguements are
                % out of range. 
                if isnan(Vtheta(i)) && ~isnan(Vmag(i)) && ~isnan(Vmag(j)) && ~isnan(P(i)) && ~isnan(Vtheta(j)) % Use isnan() to check if P(i) is NaN
                    Vtheta(i) = acos(P(i)/(Ymag(i,j)*Vmag(i)*Vmag(j))) + Vtheta(j) + Ytheta(i,j);
                end
        
                % Solve for Voltage Angle provided Reactive Power
                if isnan(Vtheta(i)) && ~isnan(Vmag(i)) && ~isnan(Vmag(j)) && ~isnan(Q(i)) && ~isnan(Vtheta(j)) % Use isnan() to check if P(i) is NaN
                    Vtheta(i) = asin(Q(i)/(Ymag(i,j)*Vmag(i)*Vmag(j))) + Vtheta(j) + Ytheta(i,j);
                end
    
                % Special Case: Solve for Voltage Magnitude when i = j
                if i == j
    
                    if isnan(Vmag(i)) && ~isnan(P(i))
                        Vmag(i) = sqrt(abs(P(i))/abs((Ymag(i,j)*cos(-Ytheta(i,j)))));
                    end
                    if isnan(Vmag(i)) && ~isnan(Q(i))
                        Vmag(i) = sqrt(abs(Q(i))/abs((Ymag(i,j)*sin(-Ytheta(i,j)))));
                    end
                end
            end
        end
    end

    % Return the solved arrays
end
