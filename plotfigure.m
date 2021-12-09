patient_data = load('inflammation-01.csv');

% Plot average inflammation per day
figure
plot(mean(patient_data, 1))
title('Daily average inflammation')
xlabel('Day of trial')
ylabel('Inflammation')

% Save plot in 'results' folder as png image:
print('average','-dpng')