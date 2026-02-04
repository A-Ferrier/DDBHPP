
function [t, alpha, beta] = DDBH1PP_output_sample(Delta, U, F, tf, nsamples)

% Function for collecting all output data of many realisations of 
% DDBH_1site Positive P with Parameters U, F, Delta,  
% with nsamples realisations at time tf.  

    %Loop over realisations to read
    for nsample = 1:nsamples
    
        %Read data from h5 file
        name_File=['file_output_1Site_Delta' correctnum2str(Delta) '_U' correctnum2str(U) '_F' correctnum2str(F) '_tf' num2str(tf) '_Re' num2str(nsample) '.h5'];
        t = h5read(name_File, '/1/t');
        alphaR = h5read(name_File, '/1/alphaR');
        alphaR = permute(alphaR, ndims(alphaR):-1:1);
        alphaI = h5read(name_File, '/1/alphaI');
        alphaI = permute(alphaI, ndims(alphaI):-1:1);
        betaR = h5read(name_File, '/1/betaR');
        betaR = permute(betaR, ndims(betaR):-1:1);
        betaI = h5read(name_File, '/1/betaI');
        betaI = permute(betaI, ndims(betaI):-1:1);
        
        %Recombine real/imaginary parts of output into complex output
        alphaC = alphaR + 1i*alphaI;
        betaC = betaR + 1i*betaI;
    
        %On first run of loop allocate memory
        if nsample == 1
            alpha = zeros(nsamples, length(t));
            beta = zeros(nsamples, length(t));
        end
    
        alpha(nsample,:) = alphaC;
        beta(nsample,:) = betaC;
        
    end
end 
  
