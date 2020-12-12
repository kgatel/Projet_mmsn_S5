FC = gfortran

OPT = -g

tri_alpha_exe : tri_alpha.f
	$(FC) $(OPT) tri_alpha.f -o tri_alpha_exe

tri_alpha : tri_alpha_exe dim_et_alpha
	tri_alpha_exe < dim_et_alpha > tri_alpha_n

clean : 
	rm tri_alpha_exe
