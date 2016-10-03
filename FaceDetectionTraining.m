clear all;
close all;
clc;


% Load positive samples.
load('FaceDetectionTraining.mat');

% Select the bounding boxes faces from the table.
positiveInstances = labelingSession(:,1:1);

% Add the image directory to the MATLAB path.
imDir = fullfile('positive');
addpath(imDir);

% Specify the folder for negative images.
negativeFolder = fullfile('negative');

% Create an imageDatastore object containing negative images.
negativeImages = imageDatastore (negativeFolder);

% Use the newly trained classifier to detect a face in an image, using HOG features.
trainCascadeObjectDetector('JJW_FaceDetector.xml',data,positiveInstances,negativeFolder,'FalseAlarmRate' ,0.1 ,'NumCascadeStages',5);