FC = gfortran

OPT = -g

gradientper1 : gradient_perturbation_t1.f90
	$(FC) $(OPT) gradient_perturbation_t1.f90 -o gradientper_t1

res1 : gradientper1 
	 gradientper_t1 < dgradient > res1

gradientper2 : gradient_perturbation_t2.f90
	$(FC) $(OPT) gradient_perturbation_t2.f90 -o gradientper_t2

res2 : gradientper2 
	 gradientper_t2 < dgradient > res2

res : res1 res2

touch :
	touch res1 res2

clean :
	rm gradientper_t1 gradientper_t2 *.d

