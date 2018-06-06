#The famous coupon collecting problem, simulated

N <- 50 # number of distinct coupons #30 and 20 as well
values <- numeric(300) #Large value just in case we have to sample a lot 
coupons <- numeric(20) #keep track of coupons weve already picked 
index <- 0 #how many distinct coupons weve picked 
j <- 0 #keep track of the number of iterations weve done/T values
while(index != N){ #until weve picked N 
  x <- sample(1:N, 1) #pick a random number 
  if(!is.element(x, coupons)){ #if we havent picked that coupon add it 
    coupons[index] <- x
    index <- index + 1
  }
  values[j] <- N - index #number of distinct coupons we still need 
  j <- j + 1
}
Tvalues <- numeric(j)
Tvalues <- values[0:j]
print(Tvalues)
print(coupons)
plot(1:j, Tvalues)

#And here is the direct calculation from the classic_problems handout
N <- 20
x <- N*log(N) + 0.5772*N + 0.5
print(ceiling(x))
N <- 30
x <- N*log(N) + 0.5772*N + 0.5
print(ceiling(x))
N <- 50
x <- N*log(N) + 0.5772*N + 0.5
print(ceiling(x))