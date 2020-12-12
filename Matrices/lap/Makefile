FC = gfortran

OPT = -g

lap_exe : lap.f
	$(FC) $(OPT) lap.f -o lap_exe

lap : lap_exe dim
	lap_exe < dim > lap

clean : 
	rm lap_exe
