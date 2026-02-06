% Overhead for Matlab postprocessing code

%Input system parameters
N = 3; % System Size: N*N unit cells (3*N*N sites)
Delta = 0.0; % On-site energy detuning
U = 0.1; % Interaction
F = 1.0; % Coherent drive
J = 3.0; % Hopping
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
filenameout = ['analysis_output_DDBH_Lieb_' num2str(N) 'x' num2str(N) '_Delta' correctnum2str(Delta) '_U' correctnum2str(U) '_F' correctnum2str(F) '_J' correctnum2str(J) '_tf' num2str(tf)  '.mat'];

%Read simulation output files and collect data
[t, alphaA, alphaB, alphaC, betaA, betaB, betaC] = DDBH2DLiebPP_output_sample(N, Delta, U, F, J, tf, nsamples);

%Create output file and store dimensions
save(filenameout, 't');

%List of scripts to process data
DDBH2DLiebPP_stAv
DDBH2DLiebPP_dynamicsU
