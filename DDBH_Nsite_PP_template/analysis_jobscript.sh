#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=1:20:00
#$ -l mem=1G 
#$ -l tmpfs=15G
#$ -l matlab=1
#$ -N Matlab_analysis
#$ -P AllUsers
#$ -wd /home/ucapfer/Scratch/DDBH_3site_Delta0.1_U0.1_F1.0_J0.45_tf1000/

module load xorg-utils/X11R7.7
module load matlab/full/r2021a/9.10

matlab -nosplash -nodesktop -nodisplay < analysis.m
