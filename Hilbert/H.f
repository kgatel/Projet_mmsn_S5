        program Hilbert
        implicit none
        integer i,j,n
        double precision,dimension(:,:), ALLOCATABLE ::A
        double precision,dimension(:), ALLOCATABLE :: b
        double precision somme

        read(*,*) n
        ALLOCATE(A(n,n))
        ALLOCATE(b(n))

        do i=1,n
        	somme=0
        	do j=1,n
        		A(i,j) = 1.d0/(dble(i)+dble(j)-1.d0)
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
