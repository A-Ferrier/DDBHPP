#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=0:01:00
#$ -l mem=6G
#$ -l tmpfs=15G
#$ -t 1-1000
#$ -N DDBH_1D
#$ -P AllUsers
#$ -wd /home/ucapfer/Scratch/DDBH_3site_Delta0.1_U0.1_F1.0_J0.45_tf1000/


N=3;
Delta=0.1;
Uint=0.1;
FPmp=1.0;
Jhop=0.45;
time_run=1000;

	echo "Delta = ${Delta} U = ${Uint} F = ${FPmp} J = ${Jhop}  Re${SGE_TASK_ID}"
	
	mkdir Re${SGE_TASK_ID}
	cd Re${SGE_TASK_ID}

	../DDBH_Nsite_PP_v1 --N=${N} --Uint=${Uint} --FPmp=${FPmp} --Delta=${Delta} --Jhop=${Jhop} --Ttot=${time_run} --seed1=$RANDOM --seed2=$RANDOM --seed3=$RANDOM
	
	mv file_output.xsil file_output_${N}Site_Delta${Delta}_U${Uint}_F${FPmp}_J${Jhop}_tf${time_run}_Re${SGE_TASK_ID}.xsil
	mv file_output.h5 file_output_${N}Site_Delta${Delta}_U${Uint}_F${FPmp}_J${Jhop}_tf${time_run}_Re${SGE_TASK_ID}.h5 

	cd ../

