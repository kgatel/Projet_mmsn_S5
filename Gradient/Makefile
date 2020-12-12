FC = gfortran

OPT = -g

gradient : gradient_t1.f90
	$(FC) $(OPT) gradient_t1.f90 -o gradient

gradient2 : gradient_t2.f90
	$(FC) $(OPT) gradient_t2.f90 -o gradient2

res1 : gradient dgradient
	gradient < dgradient > res
	
res2 : gradient2 dgradient
	gradient2 < dgradient > res

touch :
	touch resgradient

clean :
	rm gradient gradient2 *.d
