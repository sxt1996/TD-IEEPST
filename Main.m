clear all;  
clc; 
close all

%% read the HSI data being processed

a = dir;   
filename_path = a.folder;     
filename_path = strcat(filename_path,'\');
name_HSI = 'cut_1';     
name_target = 'target';

filename = strcat(filename_path,name_HSI,'.mat');
filename_target = strcat(filename_path, name_target, '.mat');

load(filename);
load(filename_target);

X_cube = data;
clear('data');
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;

gt = map;
clear('map');

mask = squeeze(gt(:));   



%% Set the key parameters
 
N_topo = 40;    % the number of point sets in each topological space
per_ie = 0.1;   % the percentage used to set the threshold to constrain the information entropy


%% Perform target detection with TD-IEEPST
r_TD_IEEPST = TD_IEEPST(X_cube, target, N_topo, per_ie); 

%% illustrate detection results
figure;
subplot(121), imagesc(gt); axis image;   title('Ground Truth')     
subplot(122), imagesc(r_TD_IEEPST); axis image;   title('Detection map of TD-IEEPST')    

%% evaluate detection results with ROC 

r_255 = squeeze(r_TD_IEEPST(:));
figure;
AUC = ROC(mask,r_255,'r')       

