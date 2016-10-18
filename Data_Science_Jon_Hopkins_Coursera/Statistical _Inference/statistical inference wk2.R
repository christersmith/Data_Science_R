nosim<-1000 #number of simulations
n<-10
sd(apply(matrix(rnorm(nosim * n), nosim),1,mean))
#10 iid draws from a sample normal istribution of 1000
1/sqrt(n)

sd(apply(matrix(runif(nosim * n), nosim), 1, mean))
#standard distribution
1/sqrt(12 * n)

sd(apply(matrix(rpois(nosim * n, 4), nosim), 1, mean))
#Poisson(4)
2/sqrt(n)

sd(apply(matrix(sample(0:1,nosim*n, replace=TRUE),nosim),1,mean))
#coin toss: coin flip
1/(2*sqrt(n))

library(UsingR); data(father.son);
x<-father.son$sheight
n<-length(x)
hist(father.son$sheight)
round(c(var(x), var(x)/n, sd(x), sd(x)/sqrt(n)),2)
#var and sd are variability in son's height
#var/n and sd/sqrt(n) are variabiliy in the averages of the heights

choose(8,7)*((1-0.5)^7)*((1-0.5)^1) + choose(8,8)*(0.5^8) #binomial for 8 children choose 7 or more daughters
pbinom(6, size=8, prob=0.5, lower.tail=FALSE)
#showing that the choose function calculation is the same for the binom calc