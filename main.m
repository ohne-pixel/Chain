clear;
m = 1;
k = 1e7;
g = 9.8;

Mass = [1e-3 2e-3 3e-3 4e-3 5e-3 6e-3 7e-3 8e-3 9e-3 1e-2 2e-2 3e-2 4e-2 5e-2 6e-2 7e-2 8e-2 9e-2 1e-1 2e-1 3e-1 4e-1 5e-1 6e-1 7e-1 8e-1 9e-1 1e0];
for i = 1:length(Mass)
    a_mass(i) = Solution(Mass(i), k, g, 3);
end
figure
    loglog(Mass, a_mass)
    grid on
    hold on
    for i = 1:length(Mass)
        plot(Mass(i), a_mass(i), 'ro')
    end
    title('Зависимость от времени')
    xlabel('Время, [с]')
    ylabel('Ускорение, [м/с^{2}]')
   