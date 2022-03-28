function [M] = koch(n)

    len = 2; 
    y = 0;
    
    a = [0,0];
    b = [1/2*len, len*sin(pi/3)];
    c = [len,0];
    M = [a; b; c]; 

    plot(M(:,1),M(:,2)+y,'b'), hold on                                      
    plot([M(1,1),M(end,1)], [M(1,2)+y,M(end,2)+y],'b')
     y = y + 3;

    for iteration = 1:n

        n_points = size(M, 1);
        new_flake_points = nan(n_points*3+n_points,2);
        j=1;

        for ii = 1:n_points
            p = M(ii, :);
            new_flake_points(j,:) = p;
            if ii == n_points
                vector = M(1,:)-M(ii, :);
            else
                vector = M(ii+1, :) - M(ii, :);
            end
            b1 = p + 1/3*vector;                        % Base point 1 of the new triangle
            b2 = p + 2/3*vector;                        % Base point 2 of the new triangle
            top = p + 1/2*vector + perp(vector)*len/3*sin(pi/3);
            new_flake_points(j+1:j+3,:) = [b1; top; b2];
            j = j + 4;
        end
    
        M = new_flake_points;
        plot(M(:,1),M(:,2)+y,'b'), hold on                                      
        plot([M(1,1),M(end,1)], [M(1,2)+y,M(end,2)+y],'b')
        y = y + 3;

        len = 1/3*len;                                  % Revise length

    end
    
    %plot(M(:,1),M(:,2),'b'), hold on                                      
    %plot([M(1,1),M(end,1)], [M(1,2),M(end,2)],'b')
         
    axis equal;
    axis off;
    
    
    function p_vec = perp(vec)
      
    p_vec(1) = -vec(2);
    p_vec(2) = vec(1);
    
    p_vec = p_vec / norm(p_vec);
    
    end

end


%}

    %{
    P = [ 0 0; 
          1 0; 
          cos(-pi/3), sin(-pi/3); 
          0 0  ];

    for iteration = 1:n
       newP = zeros( size(P,1) * 4 + 1, 2);
       
       for i = 1:size(P,1) - 1
           newP(4*i+1,:) = P(i,:);
           newP(4*i+2,:) = (2*P(i,:) + P(i+1,:) )/3;
           link = P(i+1,:)-P(i,:);
           ang = atan2( link(2), link(1) );   
           linkLeng = sqrt( sum(link.^2) );   
           newP(4*i+3,:) = newP(4*i+2,:) + (linkLeng/3)*[ cos(ang+pi/3), sin(ang+pi/3) ];
           newP(4*i+4,:) = (P(i,:) + 2*P(i+1,:) )/3;
       end
       newP( 4*size(P,1)+1,:) = P(size(P,1),:);
       P = newP;
    end
    
    clf;   
    M = P;
    plot( P(:,1), P(:,2) );   
    axis equal; 
end
    %}
      
