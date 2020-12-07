program gradient

integer,parameter::n=2
double precision,dimension(n)::x,r,b,p,x0
double precision,dimension(n,n)::A
double precision::tol=1.d-10,alpha,beta
integer::i=1

read (*,*) x0, b, A
x=x0
r=matmul(A,x)-b
p=r

do while (maxval(r)>=tol)
alpha=(dot_product(r,r))/(dot_product(matmul(A,p),p))
x=x-alpha*p
r=r-alpha*matmul(A,p)
beta=(dot_product(r,r))/alpha*(dot_product(matmul(A,p),p))
p=r+beta*p
write (*,*) i, r
i=i+1
end do
write (*,*) x
end program gradient
