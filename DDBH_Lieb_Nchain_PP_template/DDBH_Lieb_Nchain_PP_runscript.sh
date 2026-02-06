# Bash runscript for generating many stochastic trajectories from 1D DDBH Lieb positive-P simulations

# Parameters; gamma = 1 taken as energy unit by default.
N=3; # Number of unit cells (3*N sites)
Delta=0.0; # On-site energy detuning
Uint=0.1; # Two-particle interaction strength
FPmp=1.0; # Coherent drive amplitude
Jhop=3.0; # Hopping strength
time_run=1000; # end time of simulation

for s in {1..1000} # Loop over 1 to total number of stochastic trajectories
do

        echo "Delta = ${Delta} U = ${Uint} F = ${FPmp} J = ${Jhop}  Re${s}"

        mkdir Re${s}
        cd Re${s}

        ../DDBH_Lieb_Nchain_PP --N=${N} --Uint=${Uint} --FPmp=${FPmp} --Delta=${Delta} --Jhop=${Jhop} --Ttot=${time_run} --seed1=$RANDOM --seed2=$RANDOM --seed3=$RANDOM

        mv file_output.xsil file_output_Lieb_${N}chain_Delta${Delta}_U${Uint}_F${FPmp}_J${Jhop}_tf${time_run}_Re${s}.xsil
        mv file_output.h5 file_output_Lieb_${N}chain_Delta${Delta}_U${Uint}_F${FPmp}_J${Jhop}_tf${time_run}_Re${s}.h5

        cd ../

done
