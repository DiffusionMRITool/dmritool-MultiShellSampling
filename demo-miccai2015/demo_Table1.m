
clc;
close all;


%% reference scheme with number of samples 28, 84 by EEM in CAMINO 
radius_EEM_28 = CoveringRadius(ReadDirections('reference_EEM_CAMINO/Elec028.txt'))*180/pi;
radius_EEM_84 = CoveringRadius(ReadDirections('reference_EEM_CAMINO/Elec084.txt'))*180/pi;




%% 28x3 
 fprintf('%20s\t%10s\t%10s\t%10s\t%10s\n',...
     'method','Shell 1 (28)', 'Shell 2 (28)', 'Shell 3 (28)', 'Combined (28x3)');
 
% GEEM, extracted from "Design of multishell sampling schemes with uniform coverage in diffusion MRI." MRM 2013
radius_GEEM=[22.2 22.2 22.0 13.2];
fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'GEEM', radius_GEEM(1), radius_GEEM(2), radius_GEEM(3), radius_GEEM(4));

 
% IGEEM, downloaded from http://www.emmanuelcaruyer.com/WebApp/q-space-sampling.php?nbPoints=84&nbShells=3&alpha=0
% also see Dr. Jian Cheng's code https://github.com/JianCheng/dmritool-MultiShellSampling
direction_1 = ReadDirections('multishells/directions_incrementalgEEM_84_shell1.txt');
radius_IGEEM(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('multishells/directions_incrementalgEEM_84_shell2.txt');
radius_IGEEM(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('multishells/directions_incrementalgEEM_84_shell3.txt');
radius_IGEEM(3) = CoveringRadius(direction_3)*180/pi;
radius_IGEEM(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'IGEEM', radius_IGEEM(1), radius_IGEEM(2), radius_IGEEM(3), radius_IGEEM(4));

VisualizeMultiShellScheme(direction_1, direction_2, direction_3);
title(['IGEEM (combined covering radius=', num2str(radius_IGEEM(4)), ')'], 'FontSize', 15);

% ISC, extracted from Dr. Jian Cheng's code https://github.com/JianCheng/dmritool-MultiShellSampling
direction_1 = ReadDirections('multishells/directions_incrementalCSC_84_shell1.txt');
radius_ISC(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('multishells/directions_incrementalCSC_84_shell2.txt');
radius_ISC(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('multishells/directions_incrementalCSC_84_shell3.txt');
radius_ISC(3) = CoveringRadius(direction_3)*180/pi;
radius_ISC(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'ISC', radius_ISC(1), radius_ISC(2), radius_ISC(3), radius_ISC(4));

VisualizeMultiShellScheme(direction_1, direction_2, direction_3);
title(['ISC (combined covering radius=', num2str(radius_ISC(4)), ')'], 'FontSize', 15);

% MILP, extracted from Dr. Jian Cheng's code https://github.com/JianCheng/dmritool-MultiShellSampling
direction_1 = ReadDirections('multishells/directions_milp_84_shell1.txt');
radius_MILP(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('multishells/directions_milp_84_shell2.txt');
radius_MILP(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('multishells/directions_milp_84_shell3.txt');
radius_MILP(3) = CoveringRadius(direction_3)*180/pi;
radius_MILP(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'MILP', radius_MILP(1), radius_MILP(2), radius_MILP(3), radius_MILP(4));

VisualizeMultiShellScheme(direction_1, direction_2, direction_3);
title(['MILP (combined covering radius=', num2str(radius_MILP(4)), ')'], 'FontSize', 15);

% MILP+RGD, extracted from Dr. Jian Cheng's code https://github.com/JianCheng/dmritool-MultiShellSampling
direction_1 = ReadDirections('multishells/directions_milp_gradient_84_shell1.txt');
radius_MILP_RGD(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('multishells/directions_milp_gradient_84_shell2.txt');
radius_MILP_RGD(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('multishells/directions_milp_gradient_84_shell3.txt');
radius_MILP_RGD(3) = CoveringRadius(direction_3)*180/pi;
radius_MILP_RGD(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'MILP+RGD', radius_MILP_RGD(1), radius_MILP_RGD(2), radius_MILP_RGD(3), radius_MILP_RGD(4));

VisualizeMultiShellScheme(direction_1, direction_2, direction_3);
title(['MILP+RGD (combined covering radius=', num2str(radius_MILP_RGD(4)), ')'], 'FontSize', 15);

% IMOC, our proposed method
direction_1 = ReadDirections('multishells/imoc_28x3_shell1.txt');
direction_2 = ReadDirections('multishells/imoc_28x3_shell2.txt');
direction_3 = ReadDirections('multishells/imoc_28x3_shell3.txt');
radius_imoc(1) = CoveringRadius(direction_1)*180/pi;
radius_imoc(2) = CoveringRadius(direction_2)*180/pi;
radius_imoc(3) = CoveringRadius(direction_3)*180/pi;
radius_imoc(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'IMOC', radius_imoc(1), radius_imoc(2), radius_imoc(3), radius_imoc(4));

VisualizeMultiShellScheme(direction_1, direction_2, direction_3);
title(['IMOC (combined covering radius=', num2str(radius_imoc(4)), ')'], 'FontSize', 15);

% IMOC+CNLO, our proposed method
direction_1 = ReadDirections('multishells/imoc_cnlo_28x3_shell1.txt');
direction_2 = ReadDirections('multishells/imoc_cnlo_28x3_shell2.txt');
direction_3 = ReadDirections('multishells/imoc_cnlo_28x3_shell3.txt');
radius_imoc_cnlo(1) = CoveringRadius(direction_1)*180/pi;
radius_imoc_cnlo(2) = CoveringRadius(direction_2)*180/pi;
radius_imoc_cnlo(3) = CoveringRadius(direction_3)*180/pi;
radius_imoc_cnlo(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'IMOC+CNLO', radius_imoc_cnlo(1), radius_imoc_cnlo(2), radius_imoc_cnlo(3), radius_imoc_cnlo(4));

VisualizeMultiShellScheme(direction_1, direction_2, direction_3);
title(['IMOC+CNLO (combined covering radius=', num2str(radius_imoc_cnlo(4)), ')'], 'FontSize', 15);





