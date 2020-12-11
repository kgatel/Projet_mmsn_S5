FC = gfortran

OPT = -g

H_exe : H.f
	$(FC) $(OPT) H.f -o H_exe

H : H_exe dim
	H_exe < dim > H

clean : 
	rm H_exe
