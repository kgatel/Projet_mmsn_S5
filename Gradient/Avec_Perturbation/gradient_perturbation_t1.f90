program gradient1

        integer::n
        integer,parameter::imax=100
        double precision,dimension(:), ALLOCATABLE ::x,r,b,p,x0
        double precision,dimension(:,:), ALLOCATABLE ::A,delta_A,A_temp
        double precision::tol,alpha,beta, cond_A,delta_x,erreur,delA
        integer::i=1,j

        read (*,*) n
        ALLOCATE(delta_A(n,n))
        ALLOCATE(A_temp(n,n))
        ALLOCATE(A(n,n))
        ALLOCATE (x(n))
        ALLOCATE (r(n))
        ALLOCATE (b(n))
        ALLOCATE (p(n))
        ALLOCATE (x0(n))
        read (*,*) A,delta_A,b,tol,cond_A,x0
        x=x0
        A_temp=A+delta_A
        r=matmul(A_temp,x)-b
        p=r
        print*, 'A = '
        do i=1,n
                write(*,*) (A(i,j),j=1,n)
        enddo
        print*, 'delta_A = '
        do i=1,n
                write(*,*) (delta_A(i,j),j=1,n)
        enddo
        print*, 'b = '
        write (*,*) b
        print*, 'Nmax = '
        write (*,*) imax     
        print*, 'tol = '
        write (*,*) tol
        print*, 'cond = '
        write (*,*) cond_A   
        print*,'x0 = '    
        write(*,*) x0 
       
        print*,'suite de vecteurs x et le n°d''itération :'
        i=1
        do while (((maxval(ABS(r)))>=maxval(ABS(b))*tol).AND.(i<=imax))
                alpha=(dot_product(r,r))/(dot_product(matmul(A_temp,p),p))
                x=x-alpha*p
                r=r-alpha*matmul(A_temp,p)
                beta=dot_product(r,r)/(alpha*(dot_product(matmul(A_temp,p),p)))
                p=r+beta*p
                write (*,*) i, x
                i=i+1
        end do
        delta_x=maxval(ABS(x-1))
        erreur=delta_x/maxval(x) 
        print*, 'estimation de l''erreur relative :'
        write(*,*) erreur
        delA=maxval(ABS(delta_A))/maxval(ABS(A))  ! delA correspond à la norme infini de delta A sur la norme infini de A
        print*, 'norme infini de delta A sur la norme infini de A :'
        write(*,*) delA
        print*, 'second membre de l''inégalité du conditionnement :'
        write(*,*) cond_A*delA
        if (erreur<=cond_A*delA) then
                print*,'l''inégalité du conditionnement est respectée'
        else
                print*,'l''inégalité du conditionnement n''est pas respectée'
        end if

        DEALLOCATE(A)
        DEALLOCATE(x)
        DEALLOCATE(r)
        DEALLOCATE(b)
        DEALLOCATE(p)
        DEALLOCATE(x0)
        DEALLOCATE(delta_A)
        DEALLOCATE(A_temp)
end program gradient1

