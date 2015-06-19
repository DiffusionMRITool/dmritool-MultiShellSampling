
clc;
clear all;
close all;



%% single shell
numSamples=5:5:80;

radius_IMOC_81=zeros(size(numSamples));
radius_IMOC_20481=zeros(size(numSamples));
radius_ISC_81=zeros(size(numSamples));
radius_ISC_20481=zeros(size(numSamples));
radius_IEEM_81=zeros(size(numSamples));
radius_IEEM_20481=zeros(size(numSamples));
radius_EEM_CAMINO=zeros(size(numSamples));

for i = 1 : size(numSamples,2)
    nn = numSamples(i);
    
    direction = ReadDirections(['singleshell/grad_', num2str(nn), '_imoc_t3_shell1.txt']);
    radius_IMOC_81(i) = CoveringRadius(direction)*180/pi;
    direction = ReadDirections(['singleshell/grad_', num2str(nn), '_IGEEM_t3_shell1.txt']);
    radius_IEEM_81(i) = CoveringRadius(direction)*180/pi;
    direction = ReadDirections(['singleshell/grad_', num2str(nn), '_ISC_t3_shell1.txt']);
    radius_ISC_81(i) = CoveringRadius(direction)*180/pi;
    
    direction = ReadDirections(['singleshell/grad_', num2str(nn), '_imoc_t7_shell1.txt']);
    radius_IMOC_20481(i) = CoveringRadius(direction)*180/pi;
    direction = ReadDirections(['singleshell/grad_', num2str(nn), '_IGEEM_t7_shell1.txt']);
    radius_IEEM_20481(i) = CoveringRadius(direction)*180/pi;
    direction = ReadDirections(['singleshell/grad_', num2str(nn), '_ISC_t7_shell1.txt']);
    radius_ISC_20481(i) = CoveringRadius(direction)*180/pi;
    
    radius_EEM_CAMINO(i) = CoveringRadius(ReadDirections(['reference_EEM_CAMINO/Elec', num2str(nn,'%.3d') ,'.txt']))*180/pi;
end

figure; 
hold on;
plot(numSamples, radius_IMOC_20481,'-rs','MarkerSize',8)
plot(numSamples, radius_IMOC_81,'--ro','MarkerSize',8)
plot(numSamples, radius_ISC_20481,'-bs','MarkerSize',8)
plot(numSamples, radius_ISC_81,'--bo','MarkerSize',8)
plot(numSamples, radius_IEEM_20481,'-gs','MarkerSize',8)
plot(numSamples, radius_IEEM_81,'--go','MarkerSize',8)
plot(numSamples, radius_EEM_CAMINO,'--k^','MarkerSize',8)
ylim([10,70]);
legend('IMOC (20481)','IMOC (81)','ISC (20481)', 'ISC (81)', 'IEEM (20481)', 'IEEM (81)', 'EEM (CAMINO)');

%% multi-shell

numSamples=5:5:25;

radius_IMOC_81_s=zeros(size(numSamples));
radius_IMOC_20481_s=zeros(size(numSamples));
radius_IMOC_81_0=zeros(size(numSamples));
radius_IMOC_20481_0=zeros(size(numSamples));
radius_ISC_81_s=zeros(size(numSamples));
radius_ISC_20481_s=zeros(size(numSamples));
radius_ISC_81_0=zeros(size(numSamples));
radius_ISC_20481_0=zeros(size(numSamples));

for i = 1 : size(numSamples,2)
    nn = numSamples(i);
    
    direction_1 = ReadDirections(['multishells/grad_', num2str(nn), '_imoc_t3_shell1.txt']);
    direction_2 = ReadDirections(['multishells/grad_', num2str(nn), '_imoc_t3_shell2.txt']);
    direction_3 = ReadDirections(['multishells/grad_', num2str(nn), '_imoc_t3_shell3.txt']);
    radius_IMOC_81_s(i) = (CoveringRadius(direction_1)+CoveringRadius(direction_2)+CoveringRadius(direction_3))/3 * 180/pi;
    radius_IMOC_81_0(i) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;
    
    direction_1 = ReadDirections(['multishells/grad_', num2str(nn), '_imoc_t7_shell1.txt']);
    direction_2 = ReadDirections(['multishells/grad_', num2str(nn), '_imoc_t7_shell2.txt']);
    direction_3 = ReadDirections(['multishells/grad_', num2str(nn), '_imoc_t7_shell3.txt']);
    radius_IMOC_20481_s(i) = (CoveringRadius(direction_1)+CoveringRadius(direction_2)+CoveringRadius(direction_3))/3 * 180/pi;
    radius_IMOC_20481_0(i) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

    direction_1 = ReadDirections(['multishells/grad_', num2str(nn), '_ISC_t3_shell1.txt']);
    direction_2 = ReadDirections(['multishells/grad_', num2str(nn), '_ISC_t3_shell2.txt']);
    direction_3 = ReadDirections(['multishells/grad_', num2str(nn), '_ISC_t3_shell3.txt']);
    radius_ISC_81_s(i) = (CoveringRadius(direction_1)+CoveringRadius(direction_2)+CoveringRadius(direction_3))/3 * 180/pi;
    radius_ISC_81_0(i) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;
    
    direction_1 = ReadDirections(['multishells/grad_', num2str(nn), '_ISC_t7_shell1.txt']);
    direction_2 = ReadDirections(['multishells/grad_', num2str(nn), '_ISC_t7_shell2.txt']);
    direction_3 = ReadDirections(['multishells/grad_', num2str(nn), '_ISC_t7_shell3.txt']);
    radius_ISC_20481_s(i) = (CoveringRadius(direction_1)+CoveringRadius(direction_2)+CoveringRadius(direction_3))/3 * 180/pi;
    radius_ISC_20481_0(i) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;
end

figure; 
hold on;
plot(numSamples, radius_IMOC_20481_s,'-rs','MarkerSize',8)
plot(numSamples, radius_IMOC_20481_0,'-r^','MarkerSize',8)
plot(numSamples, radius_IMOC_81_s,'--ro','MarkerSize',8)
plot(numSamples, radius_IMOC_81_0,'--r^','MarkerSize',8)
plot(numSamples, radius_ISC_20481_s,'-bs','MarkerSize',8)
plot(numSamples, radius_ISC_20481_0,'-b^','MarkerSize',8)
plot(numSamples, radius_ISC_81_s,'--bo','MarkerSize',8)
plot(numSamples, radius_ISC_81_0,'--b^','MarkerSize',8)
xlim([0,25]);
ylim([10,70]);
legend('IMOC (\theta_s, 20481)','IMOC (\theta_0, 20481)', 'IMOC (\theta_s, 81)','IMOC (\theta_0, 81)', ...
    'ISC (\theta_s, 20481)','ISC (\theta_0, 20481)', 'ISC (\theta_s, 81)','ISC (\theta_0, 81)');
