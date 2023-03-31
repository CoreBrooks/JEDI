#!/bin/bash

singularity pull library://jcsda/public/jedi-tutorial

#Enter the singularity shell:

singularity shell -e jedi-tutorial_latest.sif

#Proceed to directory to run the application:

cd $HOME/jedi/tutorials/runjedi

#Run 3D and 4D data assimilation applications:

./run.bash 3denvar
./run.bash 4denvar

# View several 3D increments: 

fv3jedi_plot_field.x --inputfile=3denvar.latlon.20180415_000000z.nc4 --fieldname=ice_wat --layer=55

feh 3denvar.latlon.20180415_000000z_ice_wat_layer-55.png

fv3jedi_plot_field.x --inputfile=3denvar.latlon.20180415_000000z.nc4 --fieldname=ice_wat --layer=30

feh 3denvar.latlon.20180415_000000z_ice_wat_layer-30.png

fv3jedi_plot_field.x --inputfile=3denvar.latlon.20180415_000000z.nc4 --fieldname=liq_wat --layer=50

feh 3denvar.latlon.20180415_000000z_liq_wat_layer-50.png

#View several 4D increments:

fv3jedi_plot_field.x --inputfile=4denvar.latlon.20180415_000000z.nc4 --fieldname=liq_wat --layer=50

feh 4denvar.latlon.20180415_000000z_liq_wat_layer-50.png

fv3jedi_plot_field.x --inputfile=4denvar.latlon.20180415_000000z.nc4 --fieldname=liq_wat --layer=64

feh 4denvar.latlon.20180415_000000z_liq_wat_layer-64.png

fv3jedi_plot_field.x --inputfile=4denvar.latlon.20180415_000000z.nc4 --fieldname=T --layer=20

feh 4denvar.latlon.20180415_000000z_T_layer-20.png 
