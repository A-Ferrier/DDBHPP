
function [t, alphaA, alphaB, alphaC, betaA, betaB, betaC] = DDBHNLiebPP_output_sample(N, Delta, U, F, J, tf, nsamples)

% Function for collecting all output data of many realisations of
% DDBH_Lieb_Nchain Positive P with Parameters U, F, J, Delta, with nsamples realisations at time tf.  

    %Loop over realisations to read
    for nsample = 1:nsamples
    
        %Read data from h5 file
        name_File=['file_output_Lieb_' num2str(N) 'chain_Delta' correctnum2str(Delta) '_U' correctnum2str(U) '_F' correctnum2str(F) '_J' correctnum2str(J) '_tf' num2str(tf) '_Re' num2str(nsample) '.h5'];
        t = h5read(name_File, '/1/t');
        alphaAR = h5read(name_File, '/1/alphaAR');
        alphaAR = permute(alphaAR, ndims(alphaAR):-1:1);
        alphaAI = h5read(name_File, '/1/alphaAI');
        alphaAI = permute(alphaAI, ndims(alphaAI):-1:1);
        betaAR = h5read(name_File, '/1/betaAR');
        betaAR = permute(betaAR, ndims(betaAR):-1:1);
        betaAI = h5read(name_File, '/1/betaAI');
        betaAI = permute(betaAI, ndims(betaAI):-1:1);
        alphaBR = h5read(name_File, '/1/alphaBR');
        alphaBR = permute(alphaBR, ndims(alphaBR):-1:1);
        alphaBI = h5read(name_File, '/1/alphaBI');
        alphaBI = permute(alphaBI, ndims(alphaBI):-1:1);
        betaBR = h5read(name_File, '/1/betaBR');
        betaBR = permute(betaBR, ndims(betaBR):-1:1);
        betaBI = h5read(name_File, '/1/betaBI');
        betaBI = permute(betaBI, ndims(betaBI):-1:1);
        alphaCR = h5read(name_File, '/1/alphaCR');
        alphaCR = permute(alphaCR, ndims(alphaCR):-1:1);
        alphaCI = h5read(name_File, '/1/alphaCI');
        alphaCI = permute(alphaCI, ndims(alphaCI):-1:1);
        betaCR = h5read(name_File, '/1/betaCR');
        betaCR = permute(betaCR, ndims(betaCR):-1:1);
        betaCI = h5read(name_File, '/1/betaCI');
        betaCI = permute(betaCI, ndims(betaCI):-1:1);
      
        %Recombine real/imaginary parts of output into complex output
        alphaAC = alphaAR + 1i*alphaAI;
        betaAC = betaAR + 1i*betaAI;
        alphaBC = alphaBR + 1i*alphaBI;
        betaBC = betaBR + 1i*betaBI;
        alphaCC = alphaCR + 1i*alphaCI;
        betaCC = betaCR + 1i*betaCI;
    
        %On first run of loop allocate memory
        if nsample == 1
            alphaA = zeros(nsamples, length(t), N);
            betaA = zeros(nsamples, length(t), N);
            alphaB = zeros(nsamples, length(t), N);
            betaB = zeros(nsamples, length(t), N);
            alphaC = zeros(nsamples, length(t), N);
            betaC = zeros(nsamples, length(t), N);
        end
    
        alphaA(nsample,:,:) = alphaAC;
        betaA(nsample,:,:) = betaAC;
        alphaB(nsample,:,:) = alphaBC;
        betaB(nsample,:,:) = betaBC;
        alphaC(nsample,:,:) = alphaCC;
        betaC(nsample,:,:) = betaCC;
        
    end
end 
  
