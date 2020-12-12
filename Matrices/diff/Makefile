FC = gfortran

OPT = -g

diff_exe : diff.f
	$(FC) $(OPT) diff.f -o diff_exe

diff : diff_exe dim
	diff_exe < dim > diff

clean : 
	rm diff_exe
