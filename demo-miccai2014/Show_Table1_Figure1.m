% reproduce Table 1 and Figure 1 in the paper
%
% "Designing Single- and Multiple-Shell Sampling Schemes for Diffusion MRI Using Spherical Code", Jian Cheng, Dinggang Shen, Pew-Thian Yap, MICCAI 2014.
%
% Copyright (c) 2014, Jian Cheng <jian.cheng.1983@gmail.com>
%

clc;
close all;

size=100;

%% reference scheme with number of samples 28, 84, 90 by EEM in CAMINO 
% scheme with 270 samples is not available in CAMINO)
radius_EEM_28 = CoveringRadius(ReadDirections('reference_EEM_CAMINO/Elec028.txt'))*180/pi;
radius_EEM_84 = CoveringRadius(ReadDirections('reference_EEM_CAMINO/Elec084.txt'))*180/pi;
radius_EEM_90 = CoveringRadius(ReadDirections('reference_EEM_CAMINO/Elec090.txt'))*180/pi;




%% 28x3 
 fprintf('%20s\t%10s\t%10s\t%10s\t%10s\n',...
     'method','Shell 1 (28)', 'Shell 2 (28)', 'Shell 3 (28)', 'Combined (28x3)');
 
% gEEM, extracted from "Design of multishell sampling schemes with uniform coverage in diffusion MRI." MRM 2013
radius_gEEM=[22.2 22.2 22.0 13.2];
fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'gEEM', radius_gEEM(1), radius_gEEM(2), radius_gEEM(3), radius_gEEM(4));

 
% incremental gEEM, downloaded from http://www.emmanuelcaruyer.com/WebApp/q-space-sampling.php?nbPoints=84&nbShells=3&alpha=0
direction_1 = ReadDirections('28x3/directions_incrementalgEEM_84_shell1.txt');
radius_incremental_gEEM(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('28x3/directions_incrementalgEEM_84_shell2.txt');
radius_incremental_gEEM(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('28x3/directions_incrementalgEEM_84_shell3.txt');
radius_incremental_gEEM(3) = CoveringRadius(direction_3)*180/pi;
radius_incremental_gEEM(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'Incr. gEEM', radius_incremental_gEEM(1), radius_incremental_gEEM(2), radius_incremental_gEEM(3), radius_incremental_gEEM(4));

VisualizeMultiShellScheme(direction_1,direction_2,direction_3);
title(['Incremental gEEM (combined covering radius=', num2str(radius_incremental_gEEM(4)), ')'], 'FontSize', 15);


% incremental CSC
direction_1 = ReadDirections('28x3/directions_incrementalCSC_84_shell1.txt');
radius_incremental_CSC(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('28x3/directions_incrementalCSC_84_shell2.txt');
radius_incremental_CSC(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('28x3/directions_incrementalCSC_84_shell3.txt');
radius_incremental_CSC(3) = CoveringRadius(direction_3)*180/pi;
radius_incremental_CSC(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'Incr. CSC', radius_incremental_CSC(1), radius_incremental_CSC(2), radius_incremental_CSC(3), radius_incremental_CSC(4));

VisualizeMultiShellScheme(direction_1,direction_2,direction_3);
title(['Incremental CSC (combined covering radius=', num2str(radius_incremental_CSC(4)), ')'], 'FontSize', 15);


% MILP
direction_1 = ReadDirections('28x3/directions_milp_84_shell1.txt');
radius_milp(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('28x3/directions_milp_84_shell2.txt');
radius_milp(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('28x3/directions_milp_84_shell3.txt');
radius_milp(3) = CoveringRadius(direction_3)*180/pi;
radius_milp(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'MILP', radius_milp(1), radius_milp(2), radius_milp(3), radius_milp(4));


% incremental CSC + gradient descent 
direction_1 = ReadDirections('28x3/directions_incrementalCSC_gradient_84_shell1.txt');
radius_incremental_CSC_gradient(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('28x3/directions_incrementalCSC_gradient_84_shell2.txt');
radius_incremental_CSC_gradient(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('28x3/directions_incrementalCSC_gradient_84_shell3.txt');
radius_incremental_CSC_gradient(3) = CoveringRadius(direction_3)*180/pi;
radius_incremental_CSC_gradient(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'Incr. CSC + Grad. Desc.', radius_incremental_CSC_gradient(1), radius_incremental_CSC_gradient(2), radius_incremental_CSC_gradient(3), radius_incremental_CSC_gradient(4));


% MILP + gradient descent
direction_1 = ReadDirections('28x3/directions_milp_gradient_84_shell1.txt');
radius_milp_gradient(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('28x3/directions_milp_gradient_84_shell2.txt');
radius_milp_gradient(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('28x3/directions_milp_gradient_84_shell3.txt');
radius_milp_gradient(3) = CoveringRadius(direction_3)*180/pi;
radius_milp_gradient(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'MILP + Grad. Desc.', radius_milp_gradient(1), radius_milp_gradient(2), radius_milp_gradient(3), radius_milp_gradient(4));

% reference by EEM
fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'EEM (CAMINO)', radius_EEM_28, radius_EEM_28, radius_EEM_28, radius_EEM_84);


VisualizeMultiShellScheme(direction_1,direction_2,direction_3);
title(['MILP + Gradient descent (combined covering radius=', num2str(radius_milp_gradient(4)), ')'], 'FontSize', 15);

fprintf('\n')

%% 90x3 
 fprintf('%20s\t%10s\t%10s\t%10s\t%10s\n',...
     'method','Shell 1 (90)', 'Shell 2 (90)', 'Shell 3 (90)', 'Combined (90x3)');

% gEEM, not available in "Design of multishell sampling schemes with uniform coverage in diffusion MRI." MRM 2013 

% incremental gEEM, downloaded from http://www.emmanuelcaruyer.com/WebApp/q-space-sampling.php?nbPoints=270&nbShells=3&alpha=0
direction_1 = ReadDirections('90x3/directions_incrementalgEEM_270_shell1.txt');
radius_incremental_gEEM(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('90x3/directions_incrementalgEEM_270_shell2.txt');
radius_incremental_gEEM(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('90x3/directions_incrementalgEEM_270_shell3.txt');
radius_incremental_gEEM(3) = CoveringRadius(direction_3)*180/pi;
radius_incremental_gEEM(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'Incr. gEEM', radius_incremental_gEEM(1), radius_incremental_gEEM(2), radius_incremental_gEEM(3), radius_incremental_gEEM(4));

% incremental CSC
direction_1 = ReadDirections('90x3/directions_incrementalCSC_270_shell1.txt');
radius_incremental_CSC(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('90x3/directions_incrementalCSC_270_shell2.txt');
radius_incremental_CSC(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('90x3/directions_incrementalCSC_270_shell3.txt');
radius_incremental_CSC(3) = CoveringRadius(direction_3)*180/pi;
radius_incremental_CSC(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'Incr. CSC', radius_incremental_CSC(1), radius_incremental_CSC(2), radius_incremental_CSC(3), radius_incremental_CSC(4));


% MILP
direction_1 = ReadDirections('90x3/directions_milp_270_shell1.txt');
radius_milp(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('90x3/directions_milp_270_shell2.txt');
radius_milp(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('90x3/directions_milp_270_shell3.txt');
radius_milp(3) = CoveringRadius(direction_3)*180/pi;
radius_milp(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'MILP', radius_milp(1), radius_milp(2), radius_milp(3), radius_milp(4));


% incremental CSC + gradient descent 
direction_1 = ReadDirections('90x3/directions_incrementalCSC_gradient_270_shell1.txt');
radius_incremental_CSC_gradient(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('90x3/directions_incrementalCSC_gradient_270_shell2.txt');
radius_incremental_CSC_gradient(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('90x3/directions_incrementalCSC_gradient_270_shell3.txt');
radius_incremental_CSC_gradient(3) = CoveringRadius(direction_3)*180/pi;
radius_incremental_CSC_gradient(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'Incr. CSC + Grad. Desc.', radius_incremental_CSC_gradient(1), radius_incremental_CSC_gradient(2), radius_incremental_CSC_gradient(3), radius_incremental_CSC_gradient(4));


% MILP + gradient descent
direction_1 = ReadDirections('90x3/directions_milp_gradient_270_shell1.txt');
radius_milp_gradient(1) = CoveringRadius(direction_1)*180/pi;
direction_2 = ReadDirections('90x3/directions_milp_gradient_270_shell2.txt');
radius_milp_gradient(2) = CoveringRadius(direction_2)*180/pi;
direction_3 = ReadDirections('90x3/directions_milp_gradient_270_shell3.txt');
radius_milp_gradient(3) = CoveringRadius(direction_3)*180/pi;
radius_milp_gradient(4) = CoveringRadius([direction_1; direction_2; direction_3])*180/pi;

fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10.1f\n', ...
    'MILP + Grad. Desc.', radius_milp_gradient(1), radius_milp_gradient(2), radius_milp_gradient(3), radius_milp_gradient(4));

% reference by EEM
fprintf('%20s\t%10.1f\t%10.1f\t%10.1f\t%10s\n', ...
    'EEM (CAMINO)', radius_EEM_90, radius_EEM_90, radius_EEM_90, '-');


%% 
