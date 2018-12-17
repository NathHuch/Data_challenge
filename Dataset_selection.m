clear all; close all;

rng('default'); % graine fixée pour la répétabilité

% On va re-mélanger les données de test et de vaidation afin de ne pas
% biaiser le RNA par la suite. 

addpath(genpath('data')); % ajout du folder & selected subfolder

%% 1 / Sélection des données 
%% Initailisation des buffers de données 
files_t    = dir('data/data_test');
files_v    = dir('data/data_val');

nb_files_t = size(dir('data/data_test'),1);
nb_files_v = size(dir('data/data_val'),1);


%% Mélange des données de test & de validation
n_t = randperm (nb_files_t);
n_v = randperm (nb_files_v);

A = struct;
fileID = fopen(strcat(pwd,'/data/data_test.data'),'r');
if fileID==-1
    warning ("fichier introuvable mauvais path")
else
    labels = fscanf(fileID,'%s');   
end
labels = strsplit(labels,'.png')
%% Ranger en tableau 

for i =1:round(nb_files_t/2)
    if (files_t(n_t(i)).isdir~=1)
        A.str(i) = files_t(n_t(i));
        src      = strcat(pwd,'/data/data_train/',A.str(i).name);
        
        if (exist (strcat(pwd,'/new_data/data_train/'))~=7)
            mkdir (strcat(pwd,'/new_data/data_train/'));
        end
        
        % Sauvegarde de l'image courante
        dest         = strcat(pwd,'/new_data/data_train/image_',i);
        [status,msg] = movefile(src,dest);
        
        labels{1,i}
    end

end

