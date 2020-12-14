program gradient

        integer::n
        integer,parameter::imax=100
        double precision,dimension(:), ALLOCATABLE ::x,r,b,p,x0
        double precision,dimension(:,:), ALLOCATABLE ::A
        double precision::tol,alpha,beta, cond_A,delta_x,erreur
        integer::i=1,j

        read (*,*) n
        ALLOCATE(A(n,n))
        ALLOCATE (x(n))
        ALLOCATE (r(n))
        ALLOCATE (b(n))
        ALLOCATE (p(n))
        ALLOCATE (x0(n))
        read (*,*) A,b,tol,cond_A,x0
        x=x0
        r=matmul(A,x)-b
        p=r
        print*, 'A = '
        do i=1,n
        	write(*,*) (A(i,j),j=1,n)
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
                alpha=(dot_product(r,r))/(dot_product(matmul(A,p),p))
                x=x-alpha*p
                r=r-alpha*matmul(A,p)
                beta=dot_product(r,r)/(alpha*(dot_product(matmul(A,p),p)))
                p=r+beta*p
                write (*,*) i, x
                i=i+1
        end do
        delta_x=maxval(ABS(x-1))
        erreur=delta_x/maxval(ABS(x)) 
        print*, 'estimation de l''erreur relative :'
        write(*,*) erreur


        DEALLOCATE(A)
        DEALLOCATE(x)
        DEALLOCATE(r)
        DEALLOCATE(b)
        DEALLOCATE(p)
        DEALLOCATE(x0)

end program gradient
