        program tri_alpha
        implicit none
        integer i,j,n
        double precision,dimension(:,:), ALLOCATABLE ::A
        double precision,dimension(:), ALLOCATABLE :: b
        double precision somme,alpha

cc alpha doit etre supérieur ou égale à 1 pour définie positive
        read(*,*) n,alpha
        ALLOCATE(A(n,n))
        ALLOCATE(b(n))

        do i=1,n
        	A(i,i)=alpha+alpha
        	somme=0.d0
        	do j=1,n
        		if ( j == i+1 .OR. j == i-1 ) then
        			A(i,j)=1
                        elseif ( .NOT. i == j) then
        			A(i,j)=0.d0
        		endif
        		somme=somme+A(i,j)
        	enddo
        	b(i)=somme
        enddo
        	
	do i=1,n
                write(*,*) (A(i,j),j=1,n)
        enddo
        write(*,*)
        write(*,*)b
	
        end
