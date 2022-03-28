function [M] = koch(n)

    % KOCH function is the function that shows the koch snowflake.
    %   There is one input argument that describes how many iterations will
    %   be executed. The output M is the (n, 2) size matrice with
    %   coordinates of the points

    len = 2; 
    y = 0;
    
    a = [0,0];
    b = [1/2*len, len*sin(pi/3)];
    c = [len,0];
    M = [a; b; c]; 

    plot(M(:,1),M(:,2)+y,'b'), hold on                                      
    plot([M(1,1),M(end,1)], [M(1,2)+y,M(end,2)+y],'b')

    axis equal;
    axis off

    for iteration = 1:n

        numOfPoints = size(M, 1);
        newPoints = nan(numOfPoints*3 + numOfPoints,2);
        j = 1;

        for ii = 1:numOfPoints
            p = M(ii, :);
            newPoints(j, :) = p;
            if ii == numOfPoints
                vector = M(1, :) - M(ii, :);
            else
                vector = M(ii+1, :) - M(ii, :);
            end
            p1 = p + 1/3*vector;                        
            p2 = p + 2/3*vector;  

            pend(1) = -vector(2);
            pend(2) = vector(1);
            
            pend = pend / norm(pend);

            mid = p + 1/2*vector + pend*len/3*sin(pi/3);
            newPoints(j+1:j+3, :) = [p1; mid; p2];
            j = j + 4;
        end
    
        M = newPoints;
        y = y + 3;
        plot(M(:,1),M(:,2) + y,'b'), hold on                                      
        plot([M(1,1),M(end,1)], [M(1,2) + y,M(end,2) + y],'b')       
        len = len/3;                                  

    end    

end
