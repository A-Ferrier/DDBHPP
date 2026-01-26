# DDBHPP
Positive-P simulations for Driven-dissipative Bose Hubbard models written for [xmds2](http://www.xmds.org/), with optional Matlab post-processing library.

## Using the code for simulations 
Once you have xmds2 installed, make a copy of the template directory for the geometry you wish to simulate, e.g. DDBH_Nsite_PP_template for 1D chains.  Use the command xmds2 DDBH_Nsite_PP.xmds to compile the xmds script and generate an executable.  The executable generates a single trajectory when run; the template directory also contains a bash script (DDBH_Nsite_PP_runscript.sh) to loop running for the desired numbers of stochastic trajectories and rename the output files appropriately.  Edit this runscript to set the system parameters and number of trajectories as desired, and then use ./DDBH_Nsite_PP_runscript.sh to have the simulations run to generate positive-P trajectories.  
