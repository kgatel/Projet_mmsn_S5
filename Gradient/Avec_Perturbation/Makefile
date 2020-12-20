FC = gfortran

OPT = -g

gradient : gradient_perturbation.f90
	$(FC) $(OPT) gradient_perturbation.f90 -o gradientper

res : gradientper 
	 gradientper < dgradient > res
	
touch :
	touch res

clean :
	rm gradientper *.d

