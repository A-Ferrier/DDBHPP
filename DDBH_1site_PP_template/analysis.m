% Overhead for Matlab postprocessing code

%Input system parameters
Delta = 0.0; % On-site energy detuning
U = 0.1; % Interaction
F = 1.0; % Coherent drive
tf = 1000; % Final time

%Input number of realisations
nsamples = 1000;

%Add all relevant directories to path
toolspath = '../matlab_tools'; % Set to matlab_tools directory location
addpath(toolspath)
addpath('./')
for ns = 1:nsamples
    addpath(['./Re' num2str(ns)])
end

%Generate Output filename with system parameters
filenameout = ['analysis_output_DDBH_1Site_Delta' correctnum2str(Delta) '_U' correctnum2str(U) '_F' correctnum2str(F) '_tf' num2str(tf)  '.mat'];

%Read simulation output files and collect data
[t, alpha, beta] = DDBH1PP_output_sample(Delta, U, F, tf, nsamples);

%Create output file and store dimensions
save(filenameout, 't');

%List of scripts to process data
DDBH1PP_tAv
