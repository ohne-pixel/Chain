function [x, y, v_x, v_y, a_max, Time] = Solution(m, k, g, T)


particle_x = 0:0.1:2;
num = length(particle_x);
for i = 1:num
    particle_y(i) = (particle_x(i)-1)^2-1;
end
h = 1e-5;
for i = 1:num-1
    L_0(i) = sqrt((particle_x(i)-particle_x(i+1))^2+(particle_y(i)-particle_y(i+1))^2); % начальная длина
end
Time = 0:h:T;
Time = length(Time);
x = zeros(length(Time), num); % коордиината по x 
y = zeros(length(Time), num); % коордиината по y
for i = 1:num
    x(1,i) = particle_x(i);
    y(1,i) = particle_y(i);
end
v_x = zeros(length(Time), num);
v_y = zeros(length(Time), num);
V_X = zeros(1, num);
V_Y = zeros(1, num);

for i = 2:length(Time)
    for j = 1:num-1
        [F_x(j), F_y(j)] = Force(x(i-1,j), x(i-1,j+1), y(i-1,j), y(i-1,j+1),k,m, L_0(j));
    end
    F_x(num) = 0;
    F_y(num) = 0;

    for j = 2:num
        V_X(j) = v_x(i-1,j) + 1/2*h*(-F_x(j) + F_x(j-1));
        V_Y(j) = v_y(i-1,j) + 1/2*h*(-F_y(j) + F_y(j-1) - g);
    end

    for j = 1:num
        x(i,j) = x(i-1,j) + h*V_X(j);
        y(i,j) = y(i-1,j) + h*V_Y(j);
    end

    for j = 1:num-1
        [F_x(j), F_y(j)] = Force(x(i,j), x(i,j+1), y(i,j), y(i,j+1),k,m, L_0(j));
    end

    for j = 2:num
        v_x(i,j) = V_X(j) + 1/2*h*(-F_x(j) + F_x(j-1));
        v_y(i,j) = V_Y(j) + 1/2*h*(-F_y(j) + F_y(j-1) - g);
    end
end


a_x = zeros(length(Time), num);
a_y = zeros(length(Time), num);
Module_a = zeros(length(Time), num);
 for i = 2:length(Time)
     for j = 1:num
        a_x(i,j) = (v_x(i,j) - v_x(i-1,j))/h;
        a_y(i,j) = (v_y(i,j) - v_y(i-1,j))/h;
        Module_a(i,j) = sqrt(a_x(i,j)^2+a_y(i,j)^2);
     end
 end


 Max_a = max(Module_a);
 a_max = Max_a(num);

end