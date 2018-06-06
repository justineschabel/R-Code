#Here I am just taking different sized samples form different distributions and analyzing the qqplots 
#n = 30
sample1 <- rnorm(30)
sample2 <- rnorm(30)
qqplot(sample1, sample2)

#n = 100
sample1 <- rnorm(100)
sample2 <- rnorm(100)
qqplot(sample1, sample2)

#n=1000
sample1 <- rnorm(1000)
sample2 <- rnorm(1000)
qqplot(sample1, sample2)



#mean = 5 standard deviation = 3
sample1 <- rnorm(100)
sample2 <- rnorm(100,mean = 5, sd = 3)
qqplot(sample1, sample2)

#Exponential 
#n = 100
sample1 <- rexp(100)
sample2 <- rexp(100)
qqplot(sample1, sample2)

#n=1000
sample1 <- rexp(1000)
sample2 <- rexp(1000)
qqplot(sample1, sample2)

#Norm vs Exp
sample1 <- rnorm(100)
sample2 <- rexp(100)
qqplot(sample1, sample2)

sample1 <- rnorm(500)
sample2 <- rexp(500)
qqplot(sample1, sample2)
