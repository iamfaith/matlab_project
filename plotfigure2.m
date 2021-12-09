files = dir('inflammation-*.csv');

for i = 1:length(files)
    fileName = files(i).name;
    disp(fileName)
    
    plotData(fileName)
end


function ret =  plotData(fileName)
    assert(isfile(fileName), 'file not exists')
    ret = true;
    patient_data = load(fileName);
    % Plot inflammation stats for first patient
    figure
    subplot(1, 3, 1)
    plot(mean(patient_data, 1))
    title('Average')
    ylabel('Inflammation')
    xlabel('Day')

    subplot(1, 3, 2)
    plot(max(patient_data, [], 1))
    title('Max')
    ylabel('Inflammation')
    xlabel('Day')

    subplot(1, 3, 3)
    plot(min(patient_data, [], 1))
    title('Min')
    ylabel('Inflammation')
    xlabel('Day')


    print('inflammation-01','-dpng')

    % close()
end
