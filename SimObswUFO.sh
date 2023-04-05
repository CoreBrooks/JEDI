#!/bin/sh

#Download the appropriate JEDI Singularity container:

singularity pull library://jcsda/public/jedi-tutorial

#Enter the container:

singularity shell -e jedi-tutorial_latest.sif

#Make sure stack size limits won't cause JEDI applications to fail:

ulimit -s unlimited
ulimit -v unlimited

#Proceed to the appropriate directory to run the application:

cd $HOME/jedi/tutorials/Hofx 

#Run this script to obtain the input data:

./get_input.bash

#Focus on radiance data from the AMSU-a instrument on the NOAA-19 satellite:

./run.bash Amsua_n19

#Find and use the file name to view the png file of the simulated brightness temperature plot:

feh output/plots/Amsua_n19/brightness_temperature-channel4_hofx_20201001_030000.png

#After editing the plot configuration file to change the Group to plot "metric" to "ObsValue", view the png file of the actual observation:

cd $HOME/jedi/tutorials/HofX
fv3jeditools.x 2020-10-01T03:00:00 config/Amsua_n19_gfs.hofx3d.plot.yaml
feh output/plots/Amsua_n19/brightness_temperature-channel4_hofx_20201001_030000.png

#After changing the "metric" value to "omb", plot again to directly compare the simulated observations with the actual observations:






