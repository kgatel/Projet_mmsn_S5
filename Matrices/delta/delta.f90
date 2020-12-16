program delta

	integer::n,i,j
	double precision,dimension(:,:), ALLOCATABLE ::A,delta_A
	integer,dimension(3) :: tarray
	
	read(*,*) n
	ALLOCATE(A(n,n))
	ALLOCATE(delta_A(n,n))
	read(*,*) A
	call itime(tarray)
	call srand(tarray(1)+tarray(2)+tarray(3))
	
	do i=1,n
		do j=i,n
			delta_A(i,j)= (int(rand()*3)-1)*A(i,j)*1.d-14
		end do
	end do
	
	do i=1,n
		do j=1,i
			delta_A(i,j)=delta_A(j,i)
		end do
	end do
	
	write(*,*) n
	do i=1,n
        	write(*,*) (A(i,j),j=1,n)
        enddo
        print*,' '
        do i=1,n
        	write(*,*) (delta_A(i,j),j=1,n)
        enddo
    
    	DEALLOCATE(A)
    	DEALLOCATE(delta_A)

end program delta
        
    
