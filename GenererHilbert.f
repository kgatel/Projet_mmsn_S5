        program Hilbert
        implicit none
        integer i,j,n
        double precision aij
        read(*,*)n
cc        n=5

        do i=1,n
        do j=1,n
        aij = 1.d0/(dble(i)+dble(j)-1.d0)
        write(*,*)aij 
        enddo
cc          write(*,*) 
        enddo

        end
