
% Code to check occupations & g2 for N*N unit cell 2D DDBH Lieb Positive P with time & spatial averaging

% Size and number of bins for error bar calculating process
S_bin = nsamples/5; % Bin size for subensemble averaging
nbins = floor(nsamples/S_bin); % Number of subensembles

% Set initial time sample
init = 1+floor(length(t)/10);

% Initialise storage for bin means
means_nA_ = zeros(nbins, 1);
means_g2A_ = zeros(nbins, 1);
means_nB_ = zeros(nbins, 1);
means_g2B_ = zeros(nbins, 1);
means_nC_ = zeros(nbins, 1);
means_g2C_ = zeros(nbins, 1);

% Loop over bins
for nb = 1:nbins
    
    % Observables calculated for each bin...
    nA_bin =  real(mean(mean(mean(mean(alphaA((S_bin*(nb-1)+1):S_bin*nb,init:end,:).*betaA((S_bin*(nb-1)+1):S_bin*nb,init:end,:), 1), 2), 3), 4));
    g2A_bin = real(mean(mean(mean(mean((alphaA((S_bin*(nb-1)+1):S_bin*nb,init:end,:).*betaA((S_bin*(nb-1)+1):S_bin*nb,init:end,:)).^2, 1), 2), 3), 4))./nA_bin.^2;
    nB_bin =  real(mean(mean(mean(mean(alphaB((S_bin*(nb-1)+1):S_bin*nb,init:end,:).*betaB((S_bin*(nb-1)+1):S_bin*nb,init:end,:), 1), 2), 3), 4));
    g2B_bin = real(mean(mean(mean(mean((alphaB((S_bin*(nb-1)+1):S_bin*nb,init:end,:).*betaB((S_bin*(nb-1)+1):S_bin*nb,init:end,:)).^2, 1), 2), 3), 4))./nB_bin.^2;
    nC_bin =  real(mean(mean(mean(mean(alphaC((S_bin*(nb-1)+1):S_bin*nb,init:end,:).*betaC((S_bin*(nb-1)+1):S_bin*nb,init:end,:), 1), 2), 3), 4));
    g2C_bin = real(mean(mean(mean(mean((alphaC((S_bin*(nb-1)+1):S_bin*nb,init:end,:).*betaC((S_bin*(nb-1)+1):S_bin*nb,init:end,:)).^2, 1), 2), 3), 4))./nC_bin.^2;

    % ...and assigned to means vectors
    means_nA_(nb) = nA_bin;
    means_g2A_(nb) = g2A_bin;
    means_nB_(nb) = nB_bin;
    means_g2B_(nb) = g2B_bin;
    means_nC_(nb) = nC_bin;
    means_g2C_(nb) = g2C_bin;

end

% Calculate mean and error bar of bin means
nA_ = mean(means_nA_);
g2A_ = mean(means_g2A_);
err_nA_ = std(means_nA_);
err_g2A_ = std(means_g2A_);
nB_ = mean(means_nB_);
g2B_ = mean(means_g2B_);
err_nB_ = std(means_nB_);
err_g2B_ = std(means_g2B_);
nC_ = mean(means_nC_);
g2C_ = mean(means_g2C_);
err_nC_ = std(means_nC_);
err_g2C_ = std(means_g2C_);

% Save Output to File
save(filenameout, 'nA_', 'err_nA_', 'g2A_', 'err_g2A_', 'nB_', 'err_nB_', 'g2B_', 'err_g2B_', 'nC_', 'err_nC_', 'g2C_', 'err_g2C_', '-append');

