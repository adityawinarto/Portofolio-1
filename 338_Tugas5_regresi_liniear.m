x = [-0.0008, -0.0016, -0.0048, -0.0027, 0.0028, 0.0039, -0.0026, 0.0024, -0.0030, -0.0042, -0.0064, 0.0023, -0.0027, 0.0077, -0.0038, 0.0022, 0.0045, 0.0061, 0.0056, -0.0041, 0.0020, 0.0060, 0.0016, -0.0003, -0.0004];
y = [-0.0037, 0.0005, -0.0046, -0.0055, 0.0028, 0.0029, -0.0040, 0.0027, -0.0040, -0.0023, -0.0069, 0.0065, -0.0024, 0.0119, -0.0005, 0.0059, 0.0034, 0.0052, 0.0090, 0.0024, -0.0037, 0.0091, 0.0007, 0.0010, 0.0056];

n = length(x);

x_mean = mean(x);
y_mean = mean(y);

printf("\nRata-rata x: %.6f\n", x_mean);
printf("Rata-rata y: %.6f\n", y_mean);

sum_x = sum(x);
sum_y = sum(y);
sum_xy = sum(x .* y);
sum_x_squared = sum(x .^ 2);

numerator_a = (sum_y * sum_x_squared) - (sum_x * sum_xy);
denominator_a = (n * sum_x_squared) - (sum_x^2);

a = numerator_a / denominator_a;

numerator_b = (n * sum_xy) - (sum_x * sum_y);
denominator_b = denominator_a;

b = numerator_b / denominator_b;

y_pred = b * x + a;

error = y - y_pred;

total_error = sum(abs(error));

% Menghitung rata-rata error
average_error = total_error / n;

printf("a: %.16f\n", a);
printf("b: %.14f\n", b);
printf("Total error (jumlah absolut dari error): %.15f\n", total_error);
printf("Rata-rata error: %.15f\n", average_error);

figure; % Membuat figure baru
plot(x, y, 'ro', 'MarkerSize', 8); % Plot data asli
hold on;
plot(x, y_pred, 'b-', 'LineWidth', 2); % Plot garis regresi
xlabel('x');
ylabel('y');
title('Regresi Linear');
legend('Data', 'Garis Regresi');
grid on;

