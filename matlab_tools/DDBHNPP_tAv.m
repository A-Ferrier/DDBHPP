
% Code to check spatially resolved occupations & g2 for N site 1D DDBH Positive P with time averaging

% Size and number of bins for error bar calculating process
S_bin = nsamples/5; % Bin size for subensemble averaging
nbins = floor(nsamples/S_bin); % Number of subensembles

% Set initial time sample
init = 1+floor(length(t)/10);

% Initialise storage for bin means
means_nj = zeros(nbins, N);
means_g2j = zeros(nbins, N);

% Loop over bins
for nb = 1:nbins
    
    % Observables calculated for each bin...
    nj_bin =  real(mean(mean(alpha((S_bin*(nb-1)+1):S_bin*nb,init:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,init:end,:), 1), 2));
    g2j_bin = real(mean(mean((alpha((S_bin*(nb-1)+1):S_bin*nb,init:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,init:end,:)).^2, 1), 2))./nj_bin.^2;
    
    % ...and assigned to means vectors
    means_nj(nb,:) = nj_bin;
    means_g2j(nb,:) = g2j_bin;
    
end

% Calculate mean and error bar of bin means
nj = mean(means_nj);
g2j = mean(means_g2);
err_nj = std(means_nj);
err_g2j = std(means_g2j);

% Save Output to File
save(filenameout, 'nj', 'err_nj', 'g2j', 'err_g2j', '-append');
