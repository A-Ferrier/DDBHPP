
% Code to check time evolution of occupations & g2 for N site 0D (single site) DDBH Positive P 

% Size and number of bins for error bar calculating process
S_bin = nsamples/5; % Bin size for subensemble averaging
nbins = floor(nsamples/S_bin); % Number of subensembles

% Initialise storage for bin means
means_n_t = zeros(nbins, length(t));
means_g2_t = zeros(nbins, length(t));

% Loop over bins
for nb = 1:nbins
    
    % Observables calculated for each bin...
    n_bin =  real(mean(alpha((S_bin*(nb-1)+1):S_bin*nb,:).*beta((S_bin*(nb-1)+1):S_bin*nb,:), 1));
    g2_bin = real(mean((alpha((S_bin*(nb-1)+1):S_bin*nb,:).*beta((S_bin*(nb-1)+1):S_bin*nb,:)).^2, 1))./n_bin.^2;
    
    % ...and assigned to means vectors
    means_n_t(nb,:) = n_bin;
    means_g2_t(nb,:) = g2_bin;
    
end

% Calculate mean and error bar of bin means
n_t = mean(means_n_t, 1);
g2_t = mean(means_g2_t, 1);
err_n_t = std(means_n_t);
err_g2_t = std(means_g2_t);

% Save Output to File
save(filenameout, 'n_t', 'err_n_t', 'g2_t', 'err_g2_t', '-append');
