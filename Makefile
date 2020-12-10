FC = gfortran

OPT = -g

H_exe : GenererHilbert.f
	$(FC) $(OPT) GenererHilbert.f -o H_exe

H : H_exe H_dim
	H_exe < H_dim > H

