%% skrypt z parametrami

numer_albumu = 293452;

rng(numer_albumu);
N=20;
A=[randn(N/2,1) rand(N/2,1)+0.5;randn(N/2,1) -rand(N/2,1)-0.5];
angle=randn(1);
x(:,1)=A(:,1)*cos(angle)-A(:,2)*sin(angle);
x(:,2)=A(:,1)*sin(angle)+A(:,2)*cos(angle);
x=x+randn(1,2);
y=sign(A(:,2));

plot_legend = ["+1"; "-1"];
point_signs = ['+', 'o'];

axis_vec = [min(x(:, 1)) - 5, max(x(:, 1)) + 5, min(x(:, 2)) - 5, max(x(:, 2)) + 5];
axis_vec_GIF = [min(x(:, 1)) - 1, max(x(:, 1)) + 1, min(x(:, 2)) - 1, max(x(:, 2)) + 1];


fig = points_plotter(x, y, plot_legend, point_signs, 'Zbiór treningowy');

saveas(fig, 'wykresy/zbior_treningowy.png');
