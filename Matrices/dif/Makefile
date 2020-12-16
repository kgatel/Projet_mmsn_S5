FC = gfortran

OPT = -g

dif_exe : dif.f
	$(FC) $(OPT) dif.f -o dif_exe

dif : dif_exe dim
	dif_exe < dim > dif

clean : 
	rm dif_exe
