#!/bin/bash -l

N=3; 
Delta=0.1;
Uint=0.1;
FPmp=1.0;
Jhop=0.45;
time_run=1000;

for s in 1..1000

	echo "Delta = ${Delta} U = ${Uint} F = ${FPmp} J = ${Jhop}  Re${s}"
	
	mkdir Re${s}
	cd Re${s}

	../DDBH_Nsite_PP_v1 --N=${N} --Uint=${Uint} --FPmp=${FPmp} --Delta=${Delta} --Jhop=${Jhop} --Ttot=${time_run} --seed1=$RANDOM --seed2=$RANDOM --seed3=$RANDOM
	
	mv file_output.xsil file_output_${N}Site_Delta${Delta}_U${Uint}_F${FPmp}_J${Jhop}_tf${time_run}_Re${s}.xsil
	mv file_output.h5 file_output_${N}Site_Delta${Delta}_U${Uint}_F${FPmp}_J${Jhop}_tf${time_run}_Re${s}.h5 

	cd ../

done
