
%Input system parameters
N = 3;
Delta = 0.1;
U = 0.1;
F = 1.0;
J = 0.45;
tf = 1000;

%Input number of realisations
nsamples = 1000;

%Add all relevant directories to path
addpath('/home/ucapfer/Scratch/matlab_code')
addpath('./')
for ns = 1:nsamples
    addpath(['./Re' num2str(ns)])
end

%Generate Output filename with system parameters
filenameout = ['analysis_output_DDBH_' num2str(N) 'Site_Delta' correctnum2str(Delta) '_U' correctnum2str(U) '_F' correctnum2str(F) '_J' correctnum2str(J) '_tf' num2str(tf)  '.mat'];

%Read simulation output files and collect data
[t, alpha, beta] = DDBHNPP_output_sample(N, Delta, U, F, J, tf, nsamples);

%Create output file and store dimensions
save(filenameout, 't');

%List of scripts to process data
DDBHNPP_check

