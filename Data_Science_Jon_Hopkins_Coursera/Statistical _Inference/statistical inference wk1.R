pbeta(c(0.4,0.5,0.6),2,1)
#= probabilty at 40%, 50%, 60% for f(x) = 2x = a triangle with 2 height, 1 base

qbeta(0.5,2,1)
#quantile of 50%, is .71

library(manipulate)
myHist<-function(mu){
  g<-ggplot(galton, aes(x=child))
  g<-g+geom_histogram(fill="salmon", bindwidth=1,
                      aes(y=..density..), colour="black")
  g<-g+geom_density(size=2)
  g<-g+geom_vline(xintercept=mu,size=2)
  mse<-round(mean((galton$child-mu)^2),3)
  g<-g+labs(title=paste('my= ', mu, ' MSE= ', mse))
  g
}
manipulate(myHist(mu), mu=slider(62,74,step=0.5))
