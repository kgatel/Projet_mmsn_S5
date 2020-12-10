program gradient

        integer::n
        integer,parameter::imax=100
        double precision,dimension(:), ALLOCATABLE ::x,r,b,p,x0
        double precision,dimension(:,:), ALLOCATABLE ::A
        double precision::tol,alpha,beta, cond_A,delta_x,erreur,norme_r
        integer::i=1

        read (*,*) n
        ALLOCATE(A(n,n))
        ALLOCATE (x(n))
        ALLOCATE (r(n))
        ALLOCATE (b(n))
        ALLOCATE (p(n))
        ALLOCATE (x0(n))
        read (*,*) x0, b, tol, A, cond_A
        x=x0
        r=matmul(A,x)-b
        p=r
        
        print*,'suite de vecteurs x0 et le n°d''itération :'
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
        erreur=delta_x/maxval(x)
        print*, 'imax = '
        write (*,*) imax
        print*, 'A = '
        write (*,*) A
        print*, 'b = '
        write (*,*) b
        print*, 'tol = '
        write (*,*) tol
        print*, 'cond = '
        write (*,*) cond_A
        print*, 'estimation de l''erreur relative :'
        write(*,*) erreur


        DEALLOCATE(A)
        DEALLOCATE(x)
        DEALLOCATE(r)
        DEALLOCATE(b)
        DEALLOCATE(p)
        DEALLOCATE(x0)

end program gradient
