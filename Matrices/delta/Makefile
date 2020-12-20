FC = gfortran

OPT = -g

delta : delta.f90
	$(FC) $(OPT) delta.f90 -o delta_exe

res : delta
	delta_exe < données > res

clean :
	rm delta_exe

