x = [-0.0008, -0.0016, -0.0048, -0.0027, 0.0028, 0.0039, -0.0026, 0.0024, -0.0030, -0.0042, -0.0064, 0.0023, -0.0027, 0.0077, -0.0038, 0.0022, 0.0045, 0.0061, 0.0056, -0.0041, 0.0020, 0.0060, 0.0016, -0.0003, -0.0004];
y = [-0.0037, 0.0005, -0.0046, -0.0055, 0.0028, 0.0029, -0.0040, 0.0027, -0.0040, -0.0023, -0.0069, 0.0065, -0.0024, 0.0119, -0.0005, 0.0059, 0.0034, 0.0052, 0.0090, 0.0024, -0.0037, 0.0091, 0.0007, 0.0010, 0.0056];

n = length(x);

x_mean = mean(x);
y_mean = mean(y);

printf("Rata-rata x: %.6f\n", x_mean);
printf("Rata-rata y: %.6f\n", y_mean);

x_diff = x - x_mean;
y_diff = y - y_mean;

xi_yrata2 = x_diff .* y_diff;  % (xi - x_mean)(yi - y_mean)
xi_xrata2 = x_diff .^ 2;       % (xi - x_mean)^2

m = sum(xi_yrata2) / sum(xi_xrata2);
c = y_mean - m * x_mean;

printf("m: %.15f\n", m);
printf("c: %.18f\n", c);

y_pred = m * x + c;

error = y - y_pred;

total_error = sum(abs(error));

average_error = total_error / n;

printf("\nTotal error (jumlah absolut dari error): %.15f\n", total_error);
printf("Rata-rata error: %.15f\n", average_error);

figure; % Membuat figure baru
plot(x, y, 'ro', 'MarkerSize', 8); % Plot data asli
hold on;
plot(x, y_pred, 'b-', 'LineWidth', 2); % Plot garis regresi
xlabel('x');
ylabel('y');
title('Least Square');
legend('Data', 'Garis Regresi');
grid on;

