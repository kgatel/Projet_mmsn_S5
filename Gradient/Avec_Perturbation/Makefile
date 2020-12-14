FC = gfortran

OPT = -g

gradientper : gradient_perturbation.f90
	$(FC) $(OPT) gradient_perturbation.f90 -o gradientper

touch :
	touch res

clean :
	rm gradientper *.d

