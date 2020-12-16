program gradient

        integer::n
        integer,parameter::imax=100
        double precision,dimension(:), ALLOCATABLE ::x,r,b,p,x0
        double precision,dimension(:,:), ALLOCATABLE ::A,rn
        double precision::tol,alpha,beta, cond_A,delta_x,erreur
        integer::i=1,j,k

        read (*,*) n
        ALLOCATE(A(n,n))
        ALLOCATE (x(n))
        ALLOCATE (r(n))
        ALLOCATE (b(n))
        ALLOCATE (p(n))
        ALLOCATE (x0(n))
        ALLOCATE (rn(n,n))
        read (*,*) A,b,tol,cond_A,x0
        x=x0
        r=matmul(A,x)-b
        rn(1,:)=r
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
       
        print*,'suite de vecteurs x et le n°d''itération :'
        i=0
        write(*,*) i, x
        i=1
        do while (((maxval(ABS(r)))>=maxval(ABS(b))*tol).AND.(i<=imax))
                alpha=(dot_product(r,r))/(dot_product(matmul(A,p),p))
                x=x-alpha*p
                r=r-alpha*matmul(A,p)
                beta=dot_product(r,r)/(alpha*(dot_product(matmul(A,p),p)))
                p=r+beta*p
                rn(i+1,:)=r
                write (*,*) i, x
                i=i+1
        end do
        print*,'suite de vecteurs r :'
        do j=0,i
        	print*, 'r',j,rn(j,:)
        end do 
        print*,'produit scalaire entre les rn :'
        do j=0,i
        	do k=j,i
        		if (j/=k) then
        			print*,'(r',j,'.r',k,') = ',dot_product(rn(j,:),rn(k,:))
        		end if
        	end do
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
        DEALLOCATE(rn)

end program gradient
