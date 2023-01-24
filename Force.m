function [Fx, Fy] =  Force(x1, x2, y1, y2, k, m, L_0)
        Fx = k/m*(1-L_0/(sqrt((x1-x2)^2+(y1-y2)^2)))*(x1-x2);
        Fy = k/m*(1-L_0/(sqrt((x1-x2)^2+(y1-y2)^2)))*(y1-y2);
end