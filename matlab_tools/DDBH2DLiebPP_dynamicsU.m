
% Code to check time evolution of occupations & g2 for N*N unit cell (3*N*N site) 2D DDBH Lieb Positive P with spatial averaging (for use with spatially uniform parameters)

% Size and number of bins for error bar calculating process
S_bin = nsamples/5; % Bin size for subensemble averaging
nbins = floor(nsamples/S_bin); % Number of subensembles

% Initialise storage for bin means
means_nA_t = zeros(nbins, length(t));
means_g2A_t = zeros(nbins, length(t));
means_nB_t = zeros(nbins, length(t));
means_g2B_t = zeros(nbins, length(t));
means_nC_t = zeros(nbins, length(t));
means_g2C_t = zeros(nbins, length(t));

% Loop over bins
for nb = 1:nbins
    
    % Observables calculated for each bin...
    nA_bin =  real(mean(mean(mean(alphaA((S_bin*(nb-1)+1):S_bin*nb,:,:,:).*betaA((S_bin*(nb-1)+1):S_bin*nb,:,:,:), 1), 3), 4));
    g2A_bin = real(mean(mean(mean((alphaA((S_bin*(nb-1)+1):S_bin*nb,:,:,:).*betaA((S_bin*(nb-1)+1):S_bin*nb,:,:,:)).^2, 1), 3), 4))./nA_bin.^2;
    nB_bin =  real(mean(mean(mean(alphaB((S_bin*(nb-1)+1):S_bin*nb,:,:,:).*betaB((S_bin*(nb-1)+1):S_bin*nb,:,:,:), 1), 3), 4));
    g2B_bin = real(mean(mean(mean((alphaB((S_bin*(nb-1)+1):S_bin*nb,:,:,:).*betaB((S_bin*(nb-1)+1):S_bin*nb,:,:,:)).^2, 1), 3), 4))./nB_bin.^2;
    nC_bin =  real(mean(mean(mean(alphaC((S_bin*(nb-1)+1):S_bin*nb,:,:,:).*betaC((S_bin*(nb-1)+1):S_bin*nb,:,:,:), 1), 3), 4));
    g2C_bin = real(mean(mean(mean((alphaC((S_bin*(nb-1)+1):S_bin*nb,:,:,:).*betaC((S_bin*(nb-1)+1):S_bin*nb,:,:,:)).^2, 1), 3), 4))./nC_bin.^2;

    % ...and assigned to means vectors
    means_nA_t(nb,:) = nA_bin;
    means_g2A_t(nb,:) = g2A_bin;
    means_nB_t(nb,:) = nB_bin;
    means_g2B_t(nb,:) = g2B_bin;
    means_nC_t(nb,:) = nC_bin;
    means_g2C_t(nb,:) = g2C_bin;

end

% Calculate mean and error bar of bin means
nA_t = mean(means_nA_t);
g2A_t = mean(means_g2A_t);
err_nA_t = std(means_nA_t);
err_g2A_t = std(means_g2A_t);
nB_t = mean(means_nB_t);
g2B_t = mean(means_g2B_t);
err_nB_t = std(means_nB_t);
err_g2B_t = std(means_g2B_t);
nC_t = mean(means_nC_t);
g2C_t = mean(means_g2C_t);
err_nC_t = std(means_nC_t);
err_g2C_t = std(means_g2C_t);

% Save Output to File
save(filenameout, 'nA_t', 'err_nA_t', 'g2A_t', 'err_g2A_t', 'nB_t', 'err_nB_t', 'g2B_t', 'err_g2B_t', 'nC_t', 'err_nC_t', 'g2C_t', 'err_g2C_t', '-append');

