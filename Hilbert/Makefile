FC = gfortran

OPT = -g

H_exe : GenererH.f
	$(FC) $(OPT) GenererH.f -o H_exe

H : H_exe dim
	H_exe < dim > H

