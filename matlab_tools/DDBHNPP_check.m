
% Code to check occupations & g2 for N site 1D DDBH Positive P with time & spatial averaging

% Size and number of bins for error bar calculating process
S_bin = nsamples/5;
nbins = floor(nsamples/S_bin);

% Set initial time sample
init = 1+floor(length(t)/10);

% Initialise storage for bin means
means_n_Av = zeros(nbins, 1);
means_g2 = zeros(nbins, 1);

% Loop over bins
for nb = 1:nbins
    
    % Reset totalers
    Running_tnumer = zeros(length(t), N);
    Running_tdenom = zeros(length(t), N);
    
    % Loop over samples in bin
    for ns = (S_bin*(nb-1)+1):S_bin*nb
        
        Running_tnumer = Running_tnumer + real((alpha{ns}.*beta{ns}).^2);
        Running_tdenom = Running_tdenom + real(alpha{ns}.*beta{ns});

    end
   
    % Observables calculated for each bin...
    n_Av_bin = mean(mean(Running_tdenom(init:end, :)))./S_bin;
    g2_bin = mean(mean(Running_tnumer(init:end, :)))./S_bin./n_Av_bin.^2;
    
    % ...and assigned to means vectors
    means_n_Av(nb) = n_Av_bin;
    means_g2(nb) = g2_bin;
    
end

% Calculate mean and error bar of bin means
n_Av = mean(means_n_Av);
g2 = mean(means_g2);
err_n_Av = std(means_n_Av);
err_g2 = std(means_g2);

% Save Output to File
save(filenameout, 'n_Av', 'err_n_Av', 'g2', 'err_g2', '-append');

