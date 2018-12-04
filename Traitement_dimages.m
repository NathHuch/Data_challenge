%% Initialisation
clear all;
close all;
load tartan;
%% Initailisation des buffers de données 
nb_images   = 557;
vect_images = zeros(nb_images,250,325);
path        = dir('C:\Users\Nathan\Documents\Nathan Travail\I3\Data_challenge\data\data_test\*.png');

%% Récupération des images ( Traitement Image/Image )
for ii=1:nb_images
img_courante = imread(path(ii).name);
% imshow(img_courante); Visualisation de l'image courante
level = 1;
%% Décomposition de l'image courante en ondelette
[c,s] = wavedec2(img_courante,level,'coif2');
[chd1,cvd1,cdd1] = detcoef2('all',c,s,level);
subplot(1,2,1)
image(img_courante);
colormap(map)
title('Original Image')
subplot(1,2,2)
image(chd1)
colormap(map)
title('Horizontal Edges')

end

%% Détection de contours 
%% Identification si les contours sont dentelés ou non 
%% taille de la feuille étudiée